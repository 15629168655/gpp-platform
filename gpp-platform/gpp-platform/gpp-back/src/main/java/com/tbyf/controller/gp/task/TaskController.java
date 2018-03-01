package com.tbyf.controller.gp.task;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumIsWorkMsg;
import com.tbyf.entity.enums.EnumJobSource;
import com.tbyf.entity.enums.EnumJobType;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.entity.enums.EnumMzzdwhCRB;
import com.tbyf.entity.enums.EnumSfjlSFCL;
import com.tbyf.entity.enums.EnumSfjlSFFS;
import com.tbyf.entity.enums.EnumSfjlSFLX;
import com.tbyf.entity.enums.EnumSfjlSTZZ;
import com.tbyf.entity.enums.EnumSfjlZT;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.enums.EnumTaskStatus;
import com.tbyf.entity.enums.EnumTreateCaseState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.servicePack.ServicePackManager;
import com.tbyf.service.gp.sfjl.SfjlManager;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.service.gp.team.TeamManager;
import com.tbyf.service.gp.treatecase.TreateCaseManager;
import com.tbyf.service.gp.treatecase.TreateCaseRecordManager;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;
import com.tbyf.util.jpush.entity.MemberMessage;
import com.tbyf.util.jpush.service.PushMessageService;


/** 
 * 类名称：TaskController
 * 修改时间：2016年9月5日
 * 作者：聂方
 * @version
 */
@Controller
@RequestMapping(value="/task")
public class TaskController extends BaseController {
	String menuUrl = "task/list.do"; //菜单地址(权限用)
	@Resource(name="taskService")
	private TaskManager taskService;
	@Resource(name="teamService")
	private TeamManager teamService;
	@Resource(name="treateCaseRecordService")
	private TreateCaseRecordManager treateCaseRecordService;
	@Resource(name="treateCaseService")
	private TreateCaseManager treateCaseService;
	
	Integer UNTREATED = EnumTaskStatus.UNTREATED.getCode();      //任务状态枚举，未处理
	Integer PROCESSED = EnumTaskStatus.PROCESSED.getCode();      //任务状态枚举，已处理
	Integer DELETE = EnumTaskStatus.DELETE.getCode();            //任务状态枚举，删除
	Integer SELF = EnumJobSource.SELF.getCode();                 //任务来源，自建
	@Resource(name="servicePackService")
	private ServicePackManager servicePackService;
	@Resource(name="sfjlService")
	private SfjlManager sfjlService;
	@Resource(name="devicePushService")
	private DevicePushManager devicePushService;//推送关联Service
	@Resource(name="pushMessageService")
	private PushMessageService pushMessageService;//推送关联Service
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception  
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumTaskStatus", EnumTaskStatus.toMapNoDELETE()); // 任务状态
		pd.put("enumJobType", EnumJobType.toMap());               // 任务类型
		pd.put("enumJobSource", EnumJobSource.toMap());           // 任务来源
		pd.put("UNTREATED", UNTREATED);                           // 任务状态,未处理
		pd.put("PROCESSED", PROCESSED);                           // 任务状态,已处理
		pd.put("SELF", SELF);                                     // 任务来源,未处理
		pd.put("TEAM_MEMBER_ID", this.getCurrentUser().getProviderId());
		//查询当前医生的团队Id
		List<PageData> teamList = teamService.getlistByMemberId(pd);
		if(teamList.size() == 0) {
			pd.put("TEAM_ID", "");//没有团队ID
		}
		else {
			pd.put("TEAM_ID", teamList.get(0).get("TEAM_ID"));
		}
		
		String JOB_NAME = pd.getString("JOB_NAME");	              //任务名称 检索条件 去空格
		if(null != JOB_NAME && !"".equals(JOB_NAME)){
			pd.put("JOB_NAME", JOB_NAME.trim());
		}
		String JOB_TYPE = pd.getString("JOB_TYPE");              //任务类型检索条件
		if(null != JOB_TYPE && !"".equals(JOB_TYPE)){
			pd.put("JOB_TYPE", JOB_TYPE.trim());
		}else{
			pd.put("JOB_TYPE", null);
		}
		String JOB_SOURCE = pd.getString("JOB_SOURCE");	         //任务来源检索条件
		if(null != JOB_SOURCE && !"".equals(JOB_SOURCE)){
			pd.put("JOB_SOURCE", JOB_SOURCE.trim());
		}else{
			pd.put("JOB_SOURCE", null);
		}
		String STATUS = pd.getString("STATUS");	                 //任务状态检索条件
		if(null != STATUS && !"".equals(STATUS)){
			pd.put("STATUS", STATUS.trim());
		}else{
			pd.put("STATUS", null);
		}
		pd.put("DOCTOR_ID", getCurUser().getProviderId());	     //执行医生ID 检索条件限制
		pd.put("ORG_CODE", getCurUser().getOrgCode());           //机构编码 检索条件限制
		/*String s = pd.getString("taskTimeStart");
		if(null != s && !"".equals(s)){
		    pd.put("taskTimeStart", s+"00:00:00");	
		    pd.put("taskTimeStart1", s);	
		}
		String e = pd.getString("taskTimeEnd");
		if(null != e && !"".equals(e)){
		    pd.put("taskTimeEnd", e+"23:59:59");
		    pd.put("taskTimeEnd1", e);	
		}*/
		page.setPd(pd);
		
		List<PageData>	taskList = taskService.list(page);	//列出Task列表
		mv.setViewName("gp/task/task_list");
		mv.addObject("taskList", taskList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增任务页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumTaskStatus", EnumTaskStatus.toMap()); // 任务状态
		pd.put("enumJobType", EnumJobType.toMap());       // 任务类型
		pd.put("enumJobSource", EnumJobSource.toMap());   // 任务来源
		mv.setViewName("gp/task/task_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		//mv.addObject("jmxxList", jmxxList);
		return mv;
	}
	
	/**保存任务
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增任务");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//ID
		pd.put("JOB_SOURCE",0);
		pd.put("STATUS",UNTREATED);

		pd.put("DOCTOR_NAME", getCurUser().getName());	         //医生姓名
		pd.put("DOCTOR_ID", getCurUser().getProviderId());	     //医生ID
		pd.put("DOCTOR_CODE", getCurUser().getProviderCode());	 //执行医生CODE
		pd.put("ORG_CODE", getCurUser().getOrgCode());	         //机构编码
		pd.put("REGION_CODE", getCurUser().getRegionCode());	 //区划编码
		pd.put("OPERATOR_ID", getCurUser().getProviderId());	 //操作人ID
		pd.put("OPERATOR_NAME", getCurUser().getName());	     //操作人姓名
		
		if(null == taskService.findById(pd)){  //判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		//向app发送任务提醒
		taskService.save(pd);           //执行保存
		pd.put("ISWORKMSG", EnumIsWorkMsg.YES.getCode());
		pd.put("USERID", getCurUser().getUserId());
		PageData pdDevicePush = devicePushService.findByUserID(pd);//获得用户设备的推送ID
		if(null != pdDevicePush) {
			MemberMessage memberMessage = new MemberMessage();
			memberMessage.setTime(0);
			memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//不带链接的
			memberMessage.setType(EnumMessageType.JOB.getCode());
			memberMessage.setDeviceId(pdDevicePush.get("DEVUSERID").toString());//设备的推送ID
			memberMessage.setContent(pd.get("JOB_NAME").toString());//推送的内容
			memberMessage.setjID(pd.get("ID").toString());
			memberMessage.setTitle("任务提醒");
			memberMessage.setTime(0);
			pushMessageService.sentJobMessage(memberMessage);
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改任务页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = taskService.findById(pd);  	//根据ID读取
		pd.put("enumTaskStatus", EnumTaskStatus.toMap()); // 任务状态
		pd.put("enumJobType", EnumJobType.toMap());       // 任务类型
		pd.put("enumJobSource", EnumJobSource.toMap());   // 任务来源
		mv.setViewName("gp/task/task_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);

		return mv;
	}
	
	/**
	 * 修改任务
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改任务");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("OPERATOR_ID", getCurUser().getProviderId());	//操作人ID
		pd.put("OPERATOR_NAME", getCurUser().getName());	    //操作人姓名
		taskService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除任务
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除任务");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("OPERATOR_ID", getCurUser().getProviderId());	//操作人ID
		pd.put("OPERATOR_NAME", getCurUser().getName());	    //操作人姓名
		pd.put("STATUS", DELETE);	//删除状态
		taskService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**处理任务
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/process")
	public ModelAndView process() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"处理任务");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", pd.get("JOB_ID"));
		pd = taskService.findById(pd);
		/**
		 * 去随访界面
		 */
		String sF = Integer.toString(EnumJobType.VISIT.getCode());// 任务类型 随饭
		String treate = Integer.toString(EnumJobType.TREATMENT.getCode());// 任务类型 治疗
		String reaapp = Integer.toString(EnumJobType.AGREEMENT.getCode());//任务类型 签约
		String JOB_SOURCE = pd.get("JOB_SOURCE").toString();
		if(JOB_SOURCE.equals(sF) || JOB_SOURCE.equals(treate)){//如果是治疗或随访跳到随访的界面
			pd.put("JOB_ID", pd.get("ID"));
			List<PageData> list=sfjlService.findColumn(pd);
			pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
			mv.setViewName("gp/sfjl/sfjl_editTemp");
			mv.addObject("varList", list);
			mv.addObject("msg", "saveTemp");
			mv.addObject("pd", pd);
		}
		if(JOB_SOURCE.equals(reaapp)) {//如果是签约跳到签约的界面
			pd.put("JOB_ID", pd.get("ID"));
			pd.put("ZT_QY", EnumStatus.ENABLE.getCode());			//枚举 ，状态--启用（只有启用状态下的服务包在签约的时候才可以选取）
			Page page = new Page();
			page.setPd(pd);
			List<PageData> varList = servicePackService.PackBM(page);
			pd.put("PACKList", varList);
			mv.addObject("pd", pd);
			mv.setViewName("gp/agreementservice/agreementservice_add");
			mv.addObject("msg", "save");
		}
		/**
		 * 
		 
		taskService.process(pd);
		//保存执行方案的记录
		if(pd.get("JOB_TYPE").toString().equals(Integer.toString(EnumJobType.TREATMENT.getCode()))) {//如果是诊疗的业务，保存执u行的记录，并且更新治疗方案的
			pd.put("CASE_ID", pd.get("BUSINESS_ID"));//治疗方案ID	
			//随访ID	FOLLOW_ID
			pd.put("IMPLEMENT_TIME", Tools.date2Str(new Date()));//执行时间	
			pd.put("IMPL_NAME", pd.get("DOCTOR_NAME"));//执行人姓名	
			pd.put("IMPL_ID", pd.get("DOCTOR_ID"));//执行人ID	
			treateCaseRecordService.save(pd);
			/**
			 * 变更治疗方案的执行次数
			 
			pd = treateCaseService.findById(pd);
			pd.put("EDIT_TIME", Tools.date2Str(new Date()));
			Integer IMPL_COUNT = Integer.parseInt(pd.get("IMPL_COUNT").toString());
			IMPL_COUNT ++;
			Integer TREATE_COUNT = Integer.parseInt(pd.get("TREATE_COUNT").toString());
			if(TREATE_COUNT == IMPL_COUNT) {
				pd.put("IMPL_STATE", EnumTreateCaseState.COMPLETED.getCode());
			}
			else {
				pd.put("IMPL_STATE", EnumTreateCaseState.EXECUTED.getCode());
			}
			treateCaseService.changCaseCount(pd);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		*/
		return mv;
	}
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除任务");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String IDS = pd.getString("IDS");
			String OPERATOR_ID = getCurUser().getProviderId();  //操作人ID
			String OPERATOR_NAME = getCurUser().getName();      //操作人姓名
			String STATUS = DELETE.toString();                  //珊瑚状态
			if(null != IDS && !"".equals(IDS)){
				String ArrayIDS[] = IDS.split(",");
				taskService.deleteAll( ArrayIDS,OPERATOR_ID,OPERATOR_NAME,STATUS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}


}

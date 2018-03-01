package com.tbyf.controller.gp.treatecase;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAgreement;
import com.tbyf.entity.enums.EnumDiseaseCode;
import com.tbyf.entity.enums.EnumImplEffect;
import com.tbyf.entity.enums.EnumIntervalCompany;
import com.tbyf.entity.enums.EnumIsImprotantP;
import com.tbyf.entity.enums.EnumIsSign;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumIsWorkMsg;
import com.tbyf.entity.enums.EnumJobSource;
import com.tbyf.entity.enums.EnumJobType;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.entity.enums.EnumTaskStatus;
import com.tbyf.entity.enums.EnumTreateCaseModelState;
import com.tbyf.entity.enums.EnumTreateCaseModelType;
import com.tbyf.entity.enums.EnumTreateCaseState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.service.gp.team.TeamManager;
import com.tbyf.service.gp.treatecase.TreateCaseManager;
import com.tbyf.service.gp.treatecase.TreateCaseModelManager;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.service.system.appuser.AppuserManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;
import com.tbyf.util.jpush.entity.MemberMessage;
import com.tbyf.util.jpush.service.JPushService;
import com.tbyf.util.jpush.service.PushMessageService;

/**
 * 治疗方案的模板
 * @author zanxc
 * @创建日期2017年8月21日上午11:40:09
 */
@Controller
@RequestMapping(value="/treateCase")
public class TreateCaseController extends BaseController{

	String menuUrl = "treateCaseModel/list.do"; //菜单地址(权限用)
	@Resource(name="treateCaseModelService")
	private TreateCaseModelManager treateCaseModelService;//治疗方案的model
	@Resource(name="treateCaseService")
	private TreateCaseManager treateCaseService;//治疗方案
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	@Resource(name="taskService")
	private TaskManager taskService;
	@Resource(name="teamService")
	private TeamManager teamService;
	@Resource(name="devicePushService")
	private DevicePushManager devicePushService;//推送关联Service
	@Resource(name="pushMessageService")
	private PushMessageService pushMessageService;//推送关联Service
	@Resource(name="appuserService")
	private AppuserManager appuserService;//推送关联Service
	Integer EnumUnexecuted = EnumTreateCaseState.EXECUTED.getCode();//未执行
	Integer Enumexecuted = EnumTreateCaseState.EXECUTED.getCode();//执行中
	Integer EnumCompleted =  EnumTreateCaseState.COMPLETED.getCode();//完结
	Integer eaD = EnumAgreement.DELETE.getCode();//枚举，删除状态
	Integer eaE = EnumAgreement.EFFECTIVE.getCode();//枚举，有效状态
	/**显示居民的治疗方案
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示重点人群的治疗方案");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROVIDER_ID", this.getCurrentUser().getProviderId());
		pd.put("STATE", eaD);
		pd.put("zdrq", EnumIsImprotantP.YES.getCode());//重点人群列表
		pd.put("is_sign", EnumIsSign.YES.getCode());//是否签约
		page.setPd(pd);
		List<PageData>	jmxxList = jmxxService.listAlljmxx(page);//居民列表
		mv.setViewName("gp/treatecase/jmxx_list");
		mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("jmxxList", jmxxList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 治疗方案数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dataCase")
	@ResponseBody
	public Object dataCase(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"重点人群的治疗方案数据");
		Map<String,Object> data = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", EnumTreateCaseState.DEL.getCode());//显示该重点人群没有删除的治疗方案
		page.setPd(pd);
		List<PageData>	list = treateCaseService.findByResidentId(pd);				//治疗方案列表
		data.put("varList", list);
		data.put("pd", pd);
		return AppUtil.returnObject(new PageData(), data);
	}
	/**
	 * 显示方案的内容
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/caseInfo")
	public ModelAndView caseInfo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示方案内容");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = treateCaseService.findById(pd);
		/**
		 * Blob格式的转换
		 */
		Object CONTENT = pd.get("CASE_CONTENT");
		String content = null;  
	    byte[] inbytes=null;  
	    if(CONTENT instanceof Blob){  
	        Blob blob = (Blob) CONTENT;  
	        if (blob != null) {  
	            inbytes = blob.getBytes(1, (int) blob.length());  
	        }  
	        content =new String (inbytes);  
	    }
	    mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("TYPE", EnumTreateCaseModelType.toMap());//模板的类型
	    pd.put("CASE_CONTENT", content);
		mv.setViewName("gp/treatecase/case_info");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 治疗方案模板选择
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/residentSelect")
	public ModelAndView residentSelect(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示重点人群的治疗方案");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = this.getPageData();
		pd.put("PROVIDER_ID", this.getCurrentUser().getProviderId());
		pd.put("STATE", eaD);
		pd.put("zdrq", EnumIsImprotantP.YES.getCode());//重点人群列表
		pd.put("is_sign", EnumIsSign.YES.getCode());//是否签约
		page.setPd(pd);
		List<PageData>	jmxxList = jmxxService.listAlljmxx(page);//居民列表
		mv.setViewName("gp/indexcommonchose/getJMXX");
		mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("jmxxList", jmxxList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 治疗方案居民选择
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/modelSelect")
	public ModelAndView modelSelect(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示治疗模板");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", EnumTreateCaseModelState.ENABLE.getCode());//模板为启用的状态
		page.setPd(pd);
		List<PageData>	modelList = treateCaseModelService.list(page);//治疗方案模板列表
		List<PageData> modelLists = new ArrayList<PageData>();
		for(PageData model : modelList) {
			/**
			 * Blob格式的转换
			 */
			Object CONTENT = model.get("MODEL_CONTENT");
			String content = null;  
		    byte[] inbytes=null;  
		    if(CONTENT instanceof Blob){  
		        Blob blob = (Blob) CONTENT;  
		        if (blob != null) {  
		            inbytes = blob.getBytes(1, (int) blob.length());  
		        }  
		        content =new String (inbytes);  
		    }
		    model.put("MODEL_CONTENT", content);
		    modelLists.add(model);
		}
		mv.setViewName("gp/treatecase/modelSelect");
		mv.addObject("DISEASENAME", EnumDiseaseCode.toMap());//人群类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("modelList", modelLists);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 治疗方案新增界面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addCase")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增治疗方案界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("TYPE", EnumTreateCaseModelType.toMap());//模板的类型
		mv.setViewName("gp/treatecase/treatecase_edit");
		mv.addObject("msg", "saveCase");
		return mv;
	}
	/**
	 * 保存治疗方案
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveCase")
	public ModelAndView saveCase() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加治疗方案");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CASE_ID", this.get32UUID());	//保存主键
		String nowDate = Tools.date2Str(new Date());
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("STATE", EnumUnexecuted);//添加方案状态为未执行
		pd.put("IMPL_COUNT", 0);//执行的次数
		pd.put("OPERATOR_ID", this.getCurUser().getProviderId());//操作人ID	
		pd.put("OPERATOR_NAME", this.getCurrentUser().getProviderName());//操作人姓名	
		/**
		 * blob格式转化
		 */
		if(null != pd.getString("CASE_CONTENT") && !"".equals(pd.getString("CASE_CONTENT"))){			
			byte[] CASE_CONTENT = pd.getString("CASE_CONTENT").getBytes();//将blob类型转换
			pd.put("CASE_CONTENT", CASE_CONTENT);//内容
		}
		pd.put("DCREATE_ID", this.getCurUser().getProviderId());
		pd.put("DCREATE_NAME", this.getCurUser().getProviderName());
		pd.put("IMPL_EFFECT", EnumImplEffect.NO.getCode());//执行的效果	IMPL_EFFECT
		pd.put("IMPL_STATE", EnumTreateCaseState.UNEXECUTED.getCode());//执行的状态呢
		treateCaseService.save(pd);
		buildJob(pd);//生成任务
		changeCount(pd);//改变模板的使用次数
		//pushNotificationToGroup(pd);//给团队成员发推送
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/editCase")
	public ModelAndView editCase() throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"指标结果模板修改界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = treateCaseService.findById(pd);	//根据ID读取
		mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("TYPE", EnumTreateCaseModelType.toMap());//模板的类型
		mv.setViewName("gp/treatecase/treatecase_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "updateCase");
		return mv;
	}
	/**
	 * 修改编辑方案
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateCase")
	public ModelAndView updateCase() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改编辑方案");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("OPERATOR_ID", this.getCurUser().getProviderId());//操作人ID	
		pd.put("OPERATOR_NAME", this.getCurrentUser().getProviderName());//操作人姓名
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		treateCaseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 批量的给居民添加治疗方案
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addAllCase")
	public ModelAndView add(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量的给居民添加治疗方案");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("STATE", eaD);
		pd.put("zdrq", EnumIsImprotantP.YES.getCode());//重点人群列表
		pd.put("is_sign", EnumIsSign.YES.getCode());//是否签约
		page.setPd(pd);
		List<PageData>	jmxxList = jmxxService.listAlljmxx(page);//居民列表
		//查询已经关联的指标ID
		mv.addObject("pd", pd);
		mv.addObject("jmxxList", jmxxList);
		mv.setViewName("gp/treatecase/getimportjm_list");//获得重点人群列表
		mv.addObject("msg", "saveAllCase");
		return mv;
	}
	/**
	 * 批量保存治疗方案
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量添加组合关联");
		Map<String,Object> map = new HashMap<String,Object>();
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String USER_AGENT_ID = String.valueOf(pd.get("IDS"));
		/**
		 * Blob的转化
		 */
		byte[] MODEL_CONTENT = null;
		if(null != pd.getString("MODEL_CONTENT") && !"".equals(pd.getString("MODEL_CONTENT"))){			
			MODEL_CONTENT = pd.getString("MODEL_CONTENT").getBytes();//将blob类型转换
		}
		String nowDate = Tools.date2Str(new Date());
		PageData pds = pd;
		String[] ids = USER_AGENT_ID.split(",");
		for(int i = 0 ; i < ids.length; i++) {
			String[] residentInformation = ids[i].split("_");
			pds.put("CASE_ID", this.get32UUID());					//主键
			pds.put("CASE_NAME", residentInformation[0] + "患者的" + pd.get("DISEASE_NAME").toString() + "治疗方案");//治疗方案名称	CASE_NAME
			pds.put("ESIDENT_ID", residentInformation[1]);//居民ID	
			pds.put("RESIDENT_NAME", residentInformation[0]);//居民的姓名	
			pds.put("CASE_CONTENT", MODEL_CONTENT);//方案内容	CASE_CONTENT
			pds.put("TREATE_COUNT", pd.get("TREATE_COUNT"));//治疗次数	
			pds.put("MODEL_ID", pd.get("TREATE_MODEL_ID"));//治疗方案模板的ID	
			pds.put("DISEASE_NAME", pd.get("DISEASE_NAME"));//病种	
			pds.put("PEOPLE_TYPE", pd.get("SUIT_PEOPLE"));//人群	
			pds.put("INTERVAL_TIME", pd.get("INTERVAL_TIME"));//间隔时间	
			pds.put("INTERVAL_COMPANY", pd.get("INTERVAL_COMPANY"));//间隔单位	
			pds.put("PROVDER_ID", pd.get("PROVDER_ID"));//医生ID	
			pds.put("PROVDER_NAME", pd.get("PROVDER_NAME"));//医生姓名	
			pds.put("ORG_ID", pd.get("ORG_ID"));//机构ID	
			pds.put("TIME_ID", residentInformation[2]);//团队ID	
			pds.put("ORG_NAME", pd.get("ORG_NAME"));//机构名称	
			pds.put("START_TIME", pd.get("START_TIME"));//开始时间	
			pds.put("REMIND_TIME", Const.REMIND_TIME);//提醒时间	
			pds.put("IMPL_COUNT", 0);//执行的次数	
			pds.put("IMPL_EFFECT", EnumImplEffect.NO.getCode());//执行的效果	IMPL_EFFECT
			pds.put("IMPL_SUGGESTION", MODEL_CONTENT);//建议	
			pds.put("IMPL_STATE", EnumTreateCaseState.UNEXECUTED.getCode());//执行的状态呢	
			pds.put("PROVDER_ID",nowDate);//创建时间	CREATE_TIME
			pds.put("PROVDER_ID", nowDate);//修改时间	EDIT_TIME
			pds.put("", pd.get(""));
			treateCaseService.save(pds);
			pds.clear();
		}
		changeCount(pd, ids.length);//更新模板的使用次数
		pd.put("msg", "ok");
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 生成任务，并形成推送
	 * @return
	 * @throws Exception
	 */
	public void buildJob(PageData pd) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"生成任务");
		Integer jobCount = Integer.parseInt(pd.get("TREATE_COUNT").toString());//生成任务的条数
		String startTime = pd.get("START_TIME").toString();//生成任务的开始时间
		Integer intervalTime = Integer.parseInt(pd.get("INTERVAL_TIME").toString());
		Integer intervalCompany = Integer.parseInt(pd.get("INTERVAL_COMPANY").toString());//间隔的单位
		Integer remindTime = Integer.parseInt(pd.get("REMIND_TIME").toString());//提醒时间
		for(int i = 0; i < jobCount; i++) {//生成若干任务
			PageData pdJob = new PageData();
			pdJob.put("BUSINESS_ID", pd.get("CASE_ID"));//业务ID
			pdJob.put("TEAM_ID", pd.get("TIME_ID"));//团队ID
			pdJob.put("ID", this.get32UUID());//主键	
			pdJob.put("JOB_NAME", pd.get("MODEL_NAME"));//任务名称	
			pdJob.put("JOB_CONTENT",pd.get("CASE_NAME"));//任务内容
			pdJob.put("JOB_TYPE", EnumJobType.TREATMENT.getCode());//任务类型	
			pdJob.put("JOB_SOURCE",EnumJobSource.SYSTEM.getCode());//任务来源
			String GMT_JOB = Tools.getDateByDaysOrMonths(startTime, intervalTime*i, intervalCompany, true);
			pdJob.put("GMT_JOB", GMT_JOB);//任务时间	
			pdJob.put("GMT_REMIND", Tools.getDateByDaysOrMonths(GMT_JOB, remindTime, EnumIntervalCompany.DAY.getCode(), false));//提醒时间	GMT_REMIND
			pdJob.put("GMT_CREATED", pd.get("CREATE_TIME"));//生成时间	
			pdJob.put("MEMBER_ID", pd.get("RESIDENT_ID"));//服务对象ID	
			pdJob.put("MEMBER_NAME", pd.get("RESIDENT_NAME"));//服务对象姓名	
			pdJob.put("STATUS", EnumTaskStatus.UNTREATED.getCode());//任务状态	
			//执行医生ID	DOCTOR_ID
			//执行医生CODE	DOCTOR_CODE
			//执行医生姓名	DOCTOR_NAME
			pdJob.put("ORG_CODE", this.getCurrentUser().getOrgCode());//机构编码	
			pdJob.put("REGION_CODE", this.getCurrentUser().getRegionCode());//区划编码	
			pdJob.put("OPERATOR_ID", pd.get("OPERATOR_ID"));//操作人ID	
			pdJob.put("OPERATOR_NAME", pd.get("OPERATOR_NAME"));//操作人姓名	
			pdJob.put("GMT_MODIFIED", pd.get("CREATE_TIME"));//修改时间
			taskService.save(pdJob);
			pushNotificationToGroup(pdJob);
		}
	}
	/**
	 * 改变方案模板的次数
	 * @throws Exception
	 */
	public void changeCount(PageData pd) throws Exception{
		Integer USED_COUNT = Integer.parseInt(pd.get("USED_COUNT").toString()) ;//治疗模板的使用的次数+1
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("USED_COUNT", ++ USED_COUNT);//治疗方案模板的
		pd.put("TREATE_MODEL_ID", pd.get("MODEL_ID"));
		//更新方案模板的使用次数
		treateCaseModelService.updateCount(pd);
	}
	/**批量改变方案模板的使用次数
	 *
	 */
	public void changeCount(PageData pd, int allAdd) throws Exception{
		Integer USED_COUNT = Integer.parseInt(pd.get("USED_COUNT").toString()) ;//治疗模板的使用的次数+1
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("USED_COUNT", USED_COUNT + allAdd);//治疗方案模板的
		pd.put("TREATE_MODEL_ID", pd.get("MODEL_ID"));
		//更新方案模板的使用次数
		treateCaseModelService.updateCount(pd);
	}
	/**
	 * 给团队成员发送推送的消息
	 * @param pd
	 */
	public void pushNotificationToGroup(PageData pd) throws Exception{
		//获得任务列表
		//通过业务ID获得任务列表
		Page page = this.getPage();
		page.setPd(pd);
		List<PageData> teamMemberList = teamService.memberList(page);
		/**
		 * 给团队发推送
		 */
		List<String> resList= new ArrayList<String>();
		
		for(PageData teamMember : teamMemberList) {
			teamMember.put("PROVIDER_ID", teamMember.get("TEAM_MEMBER_ID"));
			teamMember = appuserService.findByProviderId(teamMember);
			pd.put("ISWORKMSG", EnumIsWorkMsg.YES.getCode());
			if(null != teamMember){
				pd.put("ISWORKMSG", EnumIsWorkMsg.YES.getCode());
				pd.put("USERID", teamMember.get("USER_ID"));
				PageData pdDevicePush = devicePushService.findByUserID(pd);//获得用户设备的推送ID
				if(null != pdDevicePush) {
					resList.add(pdDevicePush.get("DEVUSERID").toString());
				}
			}
		}
		String[] res = new String[resList.size()];
		for(int i = 0; i < resList.size(); i ++) {
			res[i] = resList.get(i);
		}
		if(null != res) {
			MemberMessage memberMessage = new MemberMessage();
			memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//不带链接的
			memberMessage.setType(EnumMessageType.JOB.getCode());//是job类型的链接
			String nowTime = Tools.date2Str(new Date(), "yyyy-MM-dd");
			String GMT_REMIND = pd.get("GMT_REMIND").toString();//提醒时间
			memberMessage.setDeviceIdStr(res);//设备的推送ID
			long timeOut = Tools.getDateTimeToLive(nowTime, pd.get("GMT_REMIND").toString());
			memberMessage.setContent("团队任务-" + pd.get("JOB_NAME").toString());//推送的内容
			memberMessage.setjID(pd.get("ID").toString());
			memberMessage.setTitle("任务提醒");
			if( timeOut <= 0) {
				memberMessage.setTime(0);//及时推送推送
				pushMessageService.sentJobMessage(memberMessage);
			}
			else {
				memberMessage.setTime(100);//定时推送推送
				GMT_REMIND += " 08:00:00";//八点定时推送
				memberMessage.setPushTime(GMT_REMIND);//推送时间
				JPushService.createOnePushPlan(memberMessage);//创建任务计划
			}
		}
	}
	
}

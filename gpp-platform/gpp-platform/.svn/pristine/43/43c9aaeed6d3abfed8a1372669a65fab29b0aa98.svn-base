package com.tbyf.controller.gp.sfjl;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumJobSource;
import com.tbyf.entity.enums.EnumJobType;
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
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.sfjl.impl.SfjlService;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.service.gp.treatecase.TreateCaseManager;
import com.tbyf.service.gp.treatecase.TreateCaseRecordManager;
import com.tbyf.service.hm.yhry.impl.YhryService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**
 * 随访登记
 * @author lizk
 *2016-10-12
 */
@Controller
@RequestMapping(value="/sfjl")
public class SfjlController extends BaseController {
	
	String menuUrl = "sfjl/list.do"; //菜单地址(权限用)

	@Resource(name="sfjlService")
	private SfjlService sfjlService;
	
//	@Resource(name="yhryzdService")
//	private YhryzdService yhryzdService;
	
	@Resource(name="yhryService")
	private YhryService yhryService;
	
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	@Resource(name="taskService")
	private TaskManager taskService;
	@Resource(name="treateCaseService")
	private TreateCaseManager treateCaseService;
	@Resource(name="treateCaseRecordService")
	private TreateCaseRecordManager treateCaseRecordService;
	
	Integer eaZC = EnumSfjlZT.NORMAL.getCode();//枚举，正常状态
	Integer eaZF = EnumSfjlZT.TO_VOID.getCode();//枚举，作废状态
	Integer eaSC = EnumSfjlZT.DELETE.getCode();//枚举，删除状态
	
	/**显示随访登记列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String sfcl = pd.getString("sfcl");					//是否处理
			if(null != sfcl && !"".equals(sfcl)){
				pd.put("sfcl", sfcl.trim());
			}else{
				pd.put("sfcl", null);
			}
			String sflx = pd.getString("sflx");					//随访类型
			if(null != sflx && !"".equals(sflx)){
				pd.put("sflx", sflx.trim());
			}else{
				pd.put("sflx", null);
			}
			String sffs = pd.getString("sffs");					//随访方式
			if(null != sffs && !"".equals(sffs)){
				pd.put("sffs", sffs.trim());
			}else{
				pd.put("sffs", null);
			}
			pd.put("ZT", eaSC);
			pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构编码
			pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());  //随访方式
			pd.put("EnumSfjlSTZZ", EnumSfjlSTZZ.toMap());  //身体症状
			pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());  //随访类型
			pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());  //是否访视
			pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
			page.setPd(pd);
			List<PageData>	list = sfjlService.list(page);  //列表
			mv.setViewName("gp/sfjl/sfjl_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**去新增模版页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAddTemp")
	public ModelAndView goAddTemp() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> list=sfjlService.findColumn(pd);
		pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
		mv.setViewName("gp/sfjl/sfjl_editTemp");
		mv.addObject("varList", list);
		mv.addObject("msg", "saveTemp");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去新增页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
		pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());
		pd.put("EnumSfjlSTZZ", EnumSfjlSTZZ.toMap());
		pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
		pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());
		pd.put("EnumSfjlZT", EnumSfjlZT.toMapNoDELETE());//访视状态（无删除状态）
		mv.setViewName("gp/sfjl/sfjl_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存模版,然后去新增页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveTemp")
	public ModelAndView saveTemp() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增模版");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData tempPd = new PageData();
		pd = this.getPageData();
		String jobId =pd.get("JOB_ID").toString();
		String caseId =pd.get("CASE_ID").toString();
		String GUID = this.get32UUID();
		pd.put("GUID", GUID);
		pd.put("PROVIDER_ID", this.getCurrentUser().getUserId());
		pd.put("PROVIDER_NAME", this.getCurrentUser().getName());
		pd.put("STATUS", EnumStatus.ENABLE.getCode());
		sfjlService.saveTemp(pd);
		pd.remove("GUID");
		pd.remove("NAME");
		pd.remove("PROVIDER_ID");
		pd.remove("PROVIDER_NAME");
		pd.remove("ISTEMP");
		pd.remove("STATUS");
		String SFLX=pd.getString("SFLX");
		pd.remove("SFLX");
    	Iterator iter = pd.entrySet().iterator(); 
		while(iter.hasNext()){
			PageData pd1 = new PageData();
			Map.Entry entry = (Map.Entry) iter.next();
			pd1.put("GUID",this.get32UUID());
			pd1.put("TEMP_ID", GUID);       //设置外键，前面的模版ID
			pd1.put("COLUMN_ID", entry.getKey().toString());
			pd1.put("COLUMN_NAME", entry.getValue().toString());
			sfjlService.saveTempDetail(pd1);
		}
		pd.clear();
		pd.put("TEMP_ID", GUID);
		List<PageData> list = sfjlService.findByTempId(pd);             //根据模版ID查询所选字段
		logger.info("--------所选字段list--------:"+list);
		for(Object o: list){
			Map m=(Map)o;
			tempPd.put(m.get("COLUMN_ID"), "show");
		}
		pd.put("tempPd", tempPd);
		pd.put("SFLX", SFLX);                          //将模版中设置的随访类型传递过来
		pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
		pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());
		pd.put("EnumSfjlSTZZ", EnumSfjlSTZZ.toMap());
		pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
		pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());
		pd.put("EnumSfjlZT", EnumSfjlZT.toMapNoDELETE());//访视状态（无删除状态）
		pd.put("JOB_ID", jobId);
		pd.put("CASE_ID", caseId);
		mv.setViewName("gp/sfjl/sfjl_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存新增随访记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增随访登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());						//ID
//		pd.put("ORG_NAME", getCurUser().getOrgName());		//机构
		pd.put("ORG_CODE", getCurUser().getOrgCode());		//机构编码
		pd.put("LRR_ID", getCurUser().getProviderId());		//录入人ID
		pd.put("LRR", getCurUser().getProviderName()); 		//录入人
//		pd.put("state", eaN);								//状态(正常状态)
		if(null==pd.getString("STZZ")||"".equals(pd.getString("STZZ"))){  //身体症状若为空则为无症状
			pd.put("STZZ", EnumSfjlSTZZ.WZZ.getCode());                  
		}
		sfjlService.save(pd);
		/**
		 * 保存治疗方案记录
		 */
		pd.put("RECORD_ID", this.get32UUID());
		pd.put("FOLLOW_ID", pd.get("ID"));//随访ID	FOLLOW_ID
		pd.put("IMPLEMENT_TIME", Tools.date2Str(new Date()));//执行时间	
		pd.put("IMPL_NAME", pd.get("FSYS"));//执行人姓名	
		pd.put("IMPL_ID", pd.get("FSYS_ID"));//执行人ID	
		/**
		 * 更新任务的状态
		 */
		if(pd.containsKey("JOB_ID")) {
			pd.put("ID", pd.get("JOB_ID"));
			pd.put("DOCTOR_ID", pd.get("FSYS_ID"));
			pd.put("DOCTOR_NAME", pd.get("FSYS"));
			pd.put("OPERATOR_ID", this.getCurUser().getProviderId());
			pd.put("OPERATOR_NAME", this.getCurUser().getProviderName());
			pd.put("STATUS", EnumTaskStatus.PROCESSED.getCode());
			taskService.process(pd);//
			if(pd.get("JOB_TYPE").toString().equals(Integer.toString(EnumJobType.TREATMENT.getCode()))) {
				treateCaseRecordService.save(pd);
				/**
				 * 更新治疗方案的的执行次数
				 */
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
				pd.put("IMPL_COUNT", IMPL_COUNT);
				treateCaseService.changCaseCount(pd);
			}
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData tempPd = new PageData();
		pd = this.getPageData();
		try {
			pd = sfjlService.findById(pd);					      //根据ID读取
			List<PageData> list = sfjlService.findByTempId(pd);   //根据模版ID查询所选字段
			for(Object o: list){
				Map m=(Map)o;
				tempPd.put(m.get("COLUMN_ID"), "show");
			}
			pd.put("tempPd", tempPd);
			pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());
			pd.put("EnumSfjlSTZZ", EnumSfjlSTZZ.toMap());
			pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
			pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());
			pd.put("EnumSfjlZT", EnumSfjlZT.toMapNoDELETE());//访视状态（无删除状态）
			pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
			mv.setViewName("gp/sfjl/sfjl_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改随访记录
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改随访登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_CODE", getCurUser().getOrgCode());		//机构编码
		pd.put("LRR_ID", getCurUser().getProviderId());		//录入人ID
		pd.put("LRR", getCurUser().getProviderName()); 		//录入人
		sfjlService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除随访登记
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除随访登记");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", eaSC);						//状态(删除状态)
		sfjlService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除随访登记
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除随访记录信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				pd.put("ZT", eaSC);
				sfjlService.delete(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

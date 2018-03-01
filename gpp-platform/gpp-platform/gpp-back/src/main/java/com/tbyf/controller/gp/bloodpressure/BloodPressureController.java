package com.tbyf.controller.gp.bloodpressure;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumBloodPressure;
import com.tbyf.entity.enums.EnumIsNormal;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.bloodPressure.impl.BloodPressureService;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 门诊测血压
 * @author lizk
 * 2016-09-26
 *
 */
@Controller
@RequestMapping(value="/bloodPressure")
public class BloodPressureController extends BaseController{
		
	String menuUrl = "bloodPressure/list.do"; //菜单地址(权限用)
	@Resource(name="bloodPressureService")
	private BloodPressureService bloodPressureService;
	
	@Resource(name="patientService")
	private PatientManager patientService;
	
	
	/**
	 * 列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"门诊测血压列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构ID
		pd.put("enumBloodPressure", EnumBloodPressure.toMap());  //是否用药
		page.setPd(pd);

		List<PageData> varList = bloodPressureService.list(page);
		mv.setViewName("gp/bloodpressure/bloodPressure_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAddU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumBloodPressure", EnumBloodPressure.toMap());  //是否用药
		pd.put("EnumIsNormal", EnumIsNormal.toMap());  //是否正常
		mv.setViewName("gp/bloodpressure/bloodPressure_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**弹出患者信息页面点击录入
	 * @param
	 * @throws Exception
	 
	@RequestMapping(value="/goLuru")
	public ModelAndView goLuru(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取患者信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String XM = pd.getString("XM");	//检索条件
		if(null != XM && !"".equals(XM)){
			pd.put("XM", XM.trim());
		}
		page.setPd(pd);
		List<PageData>	patientList = patientService.list(page);	//列出patient列表
		mv.setViewName("gp/bloodpressure/bloodPressure_add_list");
		mv.addObject("patientList", patientList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	*/
	
	/**保存新增门诊测血压信息
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增门诊测血压信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		pd.put("ID", id);									//id	
		pd.put("INPUT_ID", getCurUser().getProviderId());	//录入人ID
		pd.put("INPUT_NAME", getCurUser().getProviderName());     	//录入人
		pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构ID
		pd.put("REGION_CODE", getCurUser().getRegionCode());	//区划编码
		bloodPressureService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改信息页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = bloodPressureService.findById(pd);				//根据ID读取
			pd.put("enumBloodPressure", EnumBloodPressure.toMap());  //是否用药
			pd.put("EnumIsNormal", EnumIsNormal.toMap());  //是否正常
			mv.setViewName("gp/bloodpressure/bloodPressure_add");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改门诊测血压信息
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改门诊测血压信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INPUT_ID", getCurUser().getProviderId());	//录入人ID
		pd.put("INPUT_NAME", getCurUser().getProviderName());     	//录入人
		pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构ID
		pd.put("REGION_CODE", getCurUser().getRegionCode());	//区划编码
		bloodPressureService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除门诊测血压信息
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除门诊测血压信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		bloodPressureService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除门诊测血压信息
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		logBefore(logger, Jurisdiction.getUsername()+"批量删除门诊测血压信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				bloodPressureService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "ERROR");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

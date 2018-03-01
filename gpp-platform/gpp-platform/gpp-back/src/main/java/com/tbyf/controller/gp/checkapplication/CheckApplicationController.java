package com.tbyf.controller.gp.checkapplication;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.gp.patient.Patient;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.checkApplication.CheckApplicationManager;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.service.hm.yhry.YhryManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


/**
 * 检查申请管理
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/checkApplication")
public class CheckApplicationController extends BaseController{
		
	String menuUrl = "checkApplication/list.do"; //菜单地址(权限用)
		
	@Resource(name="checkApplicationService")
	private CheckApplicationManager checkApplicationService;
	
	@Resource(name="patientService")
	private PatientManager patientService;
	
	@Resource(name="yhryService")
	private YhryManager yhryService;
	
	/**
	 * 分页显示检查申请列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		/**
		 * 点击过敏管理
		 * 分页显示过敏信息
		 */
		List<PageData> varList = checkApplicationService.list(page);
		mv.setViewName("gp/checkApplication/checkApplication_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String doctor_id = pd.getString("INSPECTION_DOCTOR_ID");
		pd.put("ID", this.get32UUID());					//主键
		pd.put("JCMXID",this.get32UUID());
		pd.put("ORG_CODE", this.getCurrentUser().getOrgCode());//获取当前登录人的机构编码
		pd.put("STATUS", "0");
		pd.put("INSPECTION_DOCTOR_ID", doctor_id);
		checkApplicationService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Date nowdate = new Date();
		pd.put("LRR_ID",getCurUser().getProviderId());		  //获取当前录入人ID
		pd.put("LRR_NAME",getCurUser().getProviderName());		  //获取当前录入人
		pd.put("APPLY_DOCTOR", getCurUser().getProviderName());	  //申请医生
		pd.put("APPLY_DOCTOR_ID", getCurUser().getProviderId());//申请医生ID
		mv.addObject("pd", pd);
		mv.setViewName("gp/checkApplication/checkApplication_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		checkApplicationService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = checkApplicationService.findById(pd);	//根据ID读取
		List<Patient> patientList = patientService.listAllPatients(pd);	//患者
		mv.setViewName("gp/checkApplication/checkApplication_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		mv.addObject("patientList", patientList);
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(){
		logBefore(logger, Jurisdiction.getUsername()+"删除检查申请信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			checkApplicationService.del(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		logBefore(logger, Jurisdiction.getUsername()+"批量删除症状信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				checkApplicationService.del(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
}

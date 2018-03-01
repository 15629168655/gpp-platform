package com.tbyf.controller.gp.gmpatient;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import com.tbyf.entity.enums.EnumAllergy;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.gmpatient.GmpatientManager;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 患者过敏信息管理
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/gmpatient")
public class GmPatientController extends BaseController{
	
	String menuUrl = "gmpatient/list.do"; //菜单地址(权限用)
	
	@Resource(name="gmpatientService")
	private GmpatientManager gmpatientService;
	@Resource(name="patientService")
	private PatientManager patientService;
	
	/**
	 * 患者过敏信息列表
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
		String allergy = pd.getString("ALLERGY");					//过敏源检索条件
		if(null != allergy && !"".equals(allergy)){
			pd.put("ALLERGY", allergy.trim());
		}else{
			pd.put("ALLERGY", null);
		}
		pd.put("enumAllergy", EnumAllergy.toMap());
		page.setPd(pd);
		/**
		 * 点击过敏管理
		 * 分页显示过敏信息
		 */
		List<PageData> varList = gmpatientService.list(page);
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		mv.setViewName("gp/gmpatient/gmpatient_list");
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
		String greated_time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		pd.put("ID", this.get32UUID());					//主键
		pd.put("ORG_CODE", getCurUser().getOrgCode());
		pd.put("REGION_CODE", getCurUser().getRegionCode());
		gmpatientService.save(pd);
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
		Date nowDate = new Date();
		pd.put("enumAllergy", EnumAllergy.toMap());
		pd.put("OPERATOR_ID",getCurUser().getProviderId());	//获取当前录入人ID
		pd.put("OPERATOR_NAME",getCurUser().getProviderName());		//获取当前录入人
		mv.addObject("pd", pd);
		mv.setViewName("gp/gmpatient/gmpatient_edit");
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
		gmpatientService.edit(pd);
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
		pd = gmpatientService.findById(pd);	//根据ID读取
		pd.put("enumAllergy", EnumAllergy.toMap());
		mv.addObject("pd", pd);
		mv.setViewName("gp/gmpatient/gmpatient_edit");
		mv.addObject("msg", "edit");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "delete")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		gmpatientService.delete(pd);
		out.write("success");
		out.close();
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
				gmpatientService.deleteAll(ids);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
		
}

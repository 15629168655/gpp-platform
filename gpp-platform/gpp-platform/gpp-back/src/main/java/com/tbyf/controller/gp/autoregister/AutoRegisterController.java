package com.tbyf.controller.gp.autoregister;

import com.tbyf.controller.base.*;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.autoregister.impl.AutoRegisterService;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.service.hm.departments.*;
import com.tbyf.util.*;

import net.sf.json.JSONArray;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping(value="/autoRegister")
public class AutoRegisterController extends BaseController {
    
	@Resource(name="autoRegisterService")
	private AutoRegisterService autoRegisterService;
	@Resource(name="departmentsService")
	private DepartmentsManager departmentsService;
	@Resource(name="patientService")
	private PatientManager patientService;
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = autoRegisterService.queryPage(page);
			mv.setViewName("gp/autoRegister/autoRegister_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	@RequestMapping(value="/toAddPage")
	public ModelAndView toAddPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/autoRegister/autoRegister_add");
		return mv;
	}
	@RequestMapping(value="/saveObject")
	public ModelAndView saveObject(){
		logBefore(logger, Jurisdiction.getUsername()+"新增挂号信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String GHRQ = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String GHBM=this.get32UUID();
		pd.put("GHRQ", GHRQ);
		pd.put("GHBM", GHBM);
		pd.put("GTHBZ", "1");
		pd.put("XGBZ", 0);//修改标志
		pd.put("YLYL1", "0");//就诊情况
		pd.put("YLJGDM", getCurUser().getOrgCode());
		try {
			autoRegisterService.saveObj(pd);
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**退号
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/updateObject")
	@ResponseBody
	public Object updateObject(){
		logBefore(logger, Jurisdiction.getUsername()+"退号");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("GTHBZ", "2");
			autoRegisterService.editObj(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	@RequestMapping(value="/getDepartData")
	@ResponseBody
	public ModelAndView getDepartData(Model model){
		logBefore(logger, Jurisdiction.getUsername()+"获取科室菜单");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//		Session session = Jurisdiction.getSession();
		try {
			JSONArray arr = JSONArray.fromObject(departmentsService.listAllDep(getCurUser().getOrgCode()));
			String json = arr.toString();
			json = json.replaceAll("DEP_ID", "id").replaceAll("PARENT_DEP_ID", "pId").replaceAll("DEP_NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("pd", pd);	
			mv.setViewName("gp/autoRegister/departData");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping(value="/getPersonData")
	@ResponseBody
	public ModelAndView getPersonData(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取患者信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件(姓名、健康卡号、证件号)
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("YLJGDM", getCurUser().getOrgCode());
		page.setPd(pd);
		List<PageData>	patientList = patientService.list(page);	//列出patient列表
		mv.setViewName("gp/autoRegister/patientData");
		mv.addObject("patientList", patientList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 编辑
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEditPage")
	public ModelAndView toEditPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=autoRegisterService.queryDataById(pd);
		mv.addObject("pd", pd);
		mv.setViewName("gp/autoRegister/autoRegister_edit");
		return mv;
	}
	@RequestMapping(value="/editObject")
	public ModelAndView editObject(){
		logBefore(logger, Jurisdiction.getUsername()+"新增挂号信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			autoRegisterService.editObject(pd);
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
	
 
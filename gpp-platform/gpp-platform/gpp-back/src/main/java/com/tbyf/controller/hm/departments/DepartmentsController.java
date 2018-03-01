package com.tbyf.controller.hm.departments;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.hm.departments.Departments;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.departments.DepartmentsManager;
import com.tbyf.service.hm.organization.OrganizationManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.ObjectExcelView;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

import net.sf.json.JSONArray;

/** 
 * 说明：科室管理
 * 创建人：
 * 创建时间：2016-06-24
 */
@Controller
@RequestMapping(value="/departments")
public class DepartmentsController extends BaseController {
	
	String menuUrl = "departments/list.do"; //菜单地址(权限用)
	@Resource(name="departmentsService")
	private DepartmentsManager departmentsService;
	@Resource(name="organizationService")
	private OrganizationManager organizationService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Departments");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ISLEAF","1");
		pd.put("DEPARTMENTS_ID", this.get32UUID());	//主键
		departmentsService.save(pd);
		//当在叶子节点下新增节点时，将原来的叶子节点的ISLEAF变为0
		if(!Boolean.valueOf(pd.getString("isParent")))
		{
			PageData pd1 = new PageData();
			pd1.put("DEP_ID",pd.getString("PARENT_DEP_ID"));
			pd1.put("ISLEAF","0");
			departmentsService.changeToParent(pd1);
		}		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String DEPARTMENTS_ID,@RequestParam String PARENT_DEP_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Departments");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
	    pd.put("DEPARTMENTS_ID", DEPARTMENTS_ID);
	    String DEP_ID = departmentsService.findById(pd).getString("DEP_ID");
		String errInfo = "success";
		if(departmentsService.listSubDepByPARENT_DEP_ID(DEP_ID).size() > 0){//判断是否有子级，是：不允许删除
    		errInfo = "false";
		}
		if("success".equals(errInfo)){
			departmentsService.delete(pd);	//执行删除
			//如果父节点只有一个子节点，则将父节点变为叶节点
			if(Tools.notEmpty(PARENT_DEP_ID))
			{
				PageData pd1 = new PageData();
				pd1.put("DEP_ID",PARENT_DEP_ID);
				pd1.put("ISLEAF","1");
				departmentsService.changeToParent(pd1);
			}
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Departments");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		departmentsService.edit(pd);
		if(Tools.notEmpty(pd.getString("add_success")) && pd.getString("add_success").equals("edit_PARENT_DEP_ID")) //edit页面修改上级机构代码
		{
			//如果修改的是无兄弟叶节点
			if(departmentsService.listSubDepByPARENT_DEP_ID(pd.getString("OLD_PARENT_DEP_ID")).size() == 0)
			{
				//将节点原来的父节点改为叶节点
				PageData pd1 = new PageData();
				pd1.put("DEP_ID",pd.getString("OLD_PARENT_DEP_ID"));
				pd1.put("ISLEAF","1");
				departmentsService.changeToParent(pd1);
			}
			PageData pd2 = new PageData();
			pd2.put("DEP_ID",pd.getString("PARENT_DEP_ID"));
			//如果修改到的节点原来是叶节点，就将其改为父节点
			//if(departmentsService.findByDEP_ID(pd2).getString("ISLEAF").equals("1"))
			if(!Boolean.valueOf(pd.getString("isParent")))
			{
				PageData pd3 = new PageData();
				pd3.put("DEP_ID",pd.getString("PARENT_DEP_ID"));
				pd3.put("ISLEAF","0");
				departmentsService.changeToParent(pd3);
			}
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**科室选择弹窗
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseKS")
	public ModelAndView chooseKS(@RequestParam String ORG_CODE)throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData>  departments = departmentsService.findByORG_CODE(ORG_CODE);
		 
		mv.addObject("size",departments.size());
		mv.addObject("orgCode", ORG_CODE);			//传入机构管理编码，作为查询条件
		mv.setViewName("hm/departments/departments_chooseKS");
		return mv;
	}
	
	
	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")	
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
	    pd = departmentsService.findById(pd);	//根据ID读取
	    mv.addObject("pd", pd);	
		mv.setViewName("hm/departments/departments_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")	
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ORG_CODE = null == pd.getString("ORG_CODE")?"":pd.getString("ORG_CODE").toString();
		pd.put("ORG_CODE", ORG_CODE);					//机构管理编码
		mv.addObject("ORG_CODE", ORG_CODE);			//传入机构管理编码，作为查询条件
		mv.addObject("pd", pd);	
		mv.setViewName("hm/departments/departments_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**判断科室标识是否存在
	 * @return
	 */
	@RequestMapping(value="/hasDEP_ID")
	@ResponseBody
	public Object hasDEP_ID(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(departmentsService.findByDEP_ID(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Departments");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String DEP_ID = null == pd.get("DEP_ID")?"":pd.get("DEP_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			DEP_ID = pd.get("id").toString();
		}
		pd.put("DEP_ID", DEP_ID);					//上级ID
		page.setPd(pd);
		List<PageData>	varList = departmentsService.list(page);	//列出Dictionaries列表
		mv.addObject("pd", departmentsService.findByDEP_ID(pd));		//传入上级所有信息
		mv.addObject("DEP_ID", DEP_ID);			//上级ID
		mv.setViewName("hm/departments/departments_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		return mv;	

	}
	
	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllDep")
	public ModelAndView listAllDep(Model model)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(Const.TREE_TOP_NODE,null,null));
			String json = array.toString();
			mv.addObject("treeTopJson", json);
			//设置跳转路径
			mv.setViewName("hm/departments/departments_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}	
	
	/**
	 * 引用Tree 不含有点击编辑或查询的URL
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/depTree")
	@ResponseBody
	public String disTree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		JSONArray array=JSONArray.fromObject(departmentsService.getDepTree(id));
		String json = array.toString();
//		json=json.replaceAll("DEP_ID", "id").replaceAll("ORG_CODE", "org_code").replaceAll("DEP_NAME", "name").replaceAll("ISPARENT","isParent").replaceAll("PARENT_DEP_ID","parent_dep_id");
		return json;
	}
	
	/**
	 * 机构管理Tree 含有点击编辑或查询的url
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/treeData")
	@ResponseBody
	public String depTreeData(HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(id,"departments","list"));
		String json = array.toString();
//		json=json.replaceAll("DEP_ID", "id").replaceAll("ORG_CODE", "org_code").replaceAll("DEP_NAME", "name").replaceAll("ISPARENT","isParent").replaceAll("PARENT_DEP_ID","parent_dep_id");
		return json;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

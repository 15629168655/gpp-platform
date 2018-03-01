package com.tbyf.controller.hm.departmentinfo;

import com.tbyf.controller.base.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.departmentinfo.*;
import com.tbyf.service.hm.departments.*;
import com.tbyf.util.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.annotation.*;
import java.io.*;
import java.text.*;
import java.util.*;

/** 
 * 说明：科室信息
 * 创建人：
 * 创建时间：2016-07-07
 */
@Controller
@RequestMapping(value="/departmentinfo")
public class DepartmentInfoController extends BaseController {
	
	String menuUrl = "departmentinfo/list.do"; //菜单地址(权限用)
	@Resource(name="departmentinfoService")
	private DepartmentInfoManager departmentinfoService;
	@Resource(name="departmentsService")
	private DepartmentsManager departmentsService;



	/**科室选择弹窗
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseDep")
	public ModelAndView chooseDep(@RequestParam String ORG_CODE)throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData>  departments = departmentsService.findByORG_CODE(ORG_CODE);
		mv.addObject("size",departments.size());
		mv.addObject("orgCode", ORG_CODE);			//传入机构管理编码，作为查询条件
		mv.setViewName("hm/departmentinfo/departmentinfo_chooseDep");
		return mv;
	}

	/**判断科室编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasC")
	@ResponseBody
	public Object hasC(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(departmentinfoService.findByDEP_CODE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}


	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增DepartmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DEPARTMENTINFO_ID", this.get32UUID());	//主键
		departmentinfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除DepartmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		departmentinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改DepartmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		departmentinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表DepartmentInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = departmentinfoService.list(page);	//列出DepartmentInfo列表
		mv.setViewName("hm/departmentinfo/departmentinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
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
		mv.setViewName("hm/departmentinfo/departmentinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = departmentinfoService.findById(pd);	//根据ID读取
		mv.setViewName("hm/departmentinfo/departmentinfo_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除DepartmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			departmentinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出DepartmentInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("科室名称");	//1
		titles.add("科室编码");	//2
		titles.add("医护人员数");	//3
		titles.add("在岗数");	//4
		titles.add("床位数");	//5
		titles.add("空置床位数");	//6
		titles.add("负责人");	//7
		titles.add("电话");	//8
		titles.add("简介");	//9
		titles.add("排序号");	//10
		titles.add("医院编码");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = departmentinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("DEP_NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("DEP_CODE"));	//2
			vpd.put("var3", varOList.get(i).get("NURSE_NUM").toString());	//3
			vpd.put("var4", varOList.get(i).get("ON_GUARD_NUM").toString());	//4
			vpd.put("var5", varOList.get(i).get("BED_NUM").toString());	//5
			vpd.put("var6", varOList.get(i).get("FREE_BED_NUM").toString());	//6
			vpd.put("var7", varOList.get(i).getString("PERSON_IN_CHARGE"));	//7
			vpd.put("var8", varOList.get(i).getString("TEL"));	//8
			vpd.put("var9", varOList.get(i).getString("DESCRIBTION"));	//9
			vpd.put("var10", varOList.get(i).get("SORT_NUM").toString());	//10
			vpd.put("var11", varOList.get(i).getString("ORG_CODE"));	//11
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

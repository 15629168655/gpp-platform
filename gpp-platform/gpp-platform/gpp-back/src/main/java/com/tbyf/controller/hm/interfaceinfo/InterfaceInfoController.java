package com.tbyf.controller.hm.interfaceinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.*;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.interfaceinfo.InterfaceInfoManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.ObjectExcelView;
import com.tbyf.util.PageData;

/** 
 * 说明：接口信息管理
 * 创建人：
 * 创建时间：2016-07-06
 */
@Controller
@RequestMapping(value="/interfaceinfo")
public class InterfaceInfoController extends BaseController {
	
	String menuUrl = "interfaceinfo/list.do"; //菜单地址(权限用)
	@Resource(name="interfaceinfoService")
	private InterfaceInfoManager interfaceinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增InterfaceInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INTERFACEINFO_ID", this.get32UUID());	//主键
		pd.put("BUILD_TIME",new Date());
		pd.put("ALTER_TIME",new Date());
		pd.put("OPERATOR",getCurUser().getName());
		interfaceinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除InterfaceInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		interfaceinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改InterfaceInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BUILD_TIME",new Date());
		pd.put("ALTER_TIME",new Date());
		pd.put("OPERATOR",getCurUser().getName());
		interfaceinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断接口名称是否存在
	 * @return
	 */
	@RequestMapping(value="/hasInterfaceName")
	@ResponseBody
	public Object hasInterfaceName(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(interfaceinfoService.findByInterName(pd) != null){
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
		logBefore(logger, Jurisdiction.getUsername()+"列表InterfaceInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = interfaceinfoService.list(page);	//列出InterfaceInfo列表
		mv.setViewName("hm/interfaceinfo/interfaceinfo_list");
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
		pd.put("enumModule", EnumModule.toMap());
		pd.put("enumSubmissinWay", EnumSubmissinWay.toMap());
		pd.put("enumParameterType", EnumParameterType.toMap());
		pd.put("enumRespondType", EnumRespondType.toMap());
		mv.setViewName("hm/interfaceinfo/interfaceinfo_edit");
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
		pd = interfaceinfoService.findById(pd);	//根据ID读取
		pd.put("enumModule", EnumModule.toMap());
		pd.put("enumSubmissinWay", EnumSubmissinWay.toMap());
		pd.put("enumParameterType", EnumParameterType.toMap());
		pd.put("enumRespondType", EnumRespondType.toMap());
		mv.setViewName("hm/interfaceinfo/interfaceinfo_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去显示详情
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/showInfo")
		public ModelAndView showInfo()throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			pd = interfaceinfoService.findById(pd);	//根据ID读取
			pd.put("enumModule", EnumModule.toMap());
			pd.put("enumSubmissinWay", EnumSubmissinWay.toMap());
			pd.put("enumParameterType", EnumParameterType.toMap());
			pd.put("enumRespondType", EnumRespondType.toMap());
			mv.setViewName("hm/interfaceinfo/interfaceinfo_show");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除InterfaceInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			interfaceinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出InterfaceInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("模块");	//1
		titles.add("接口名称");	//2
		titles.add("接口URL");	//3
		titles.add("提交方式");	//4
		titles.add("参数内容类型");	//5
		titles.add("参数内容");	//6
		titles.add("响应内容类型");	//7
		titles.add("响应内容");	//8
		titles.add("接口描述");	//9
		titles.add("接口版本");	//10
		titles.add("生成时间");	//11
		titles.add("修改时间");	//12
		titles.add("操作人");	//13
		dataMap.put("titles", titles);
		List<PageData> varOList = interfaceinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MODULE"));	//1
			vpd.put("var2", varOList.get(i).getString("INTERFACE_NAME"));	//2
			vpd.put("var3", varOList.get(i).getString("INTERFACE_URL"));	//3
			vpd.put("var4", varOList.get(i).getString("SUBMISSION_WAY"));	//4
			vpd.put("var5", varOList.get(i).getString("PARAMETER_TYPE"));	//5
			vpd.put("var6", varOList.get(i).getString("PARAMETER_CONTENT"));	//6
			vpd.put("var7", varOList.get(i).getString("RESPOND_TYPE"));	//7
			vpd.put("var8", varOList.get(i).getString("RESPOND_CONTENT"));	//8
			vpd.put("var9", varOList.get(i).getString("INTER_DESCRIBE"));	//9
			vpd.put("var10", varOList.get(i).getString("INTER_VERSION"));	//10
			vpd.put("var11", varOList.get(i).getString("BUILD_TIME"));	//11
			vpd.put("var12", varOList.get(i).getString("ALTER_TIME"));	//12
			vpd.put("var13", varOList.get(i).getString("OPERATOR"));	//13
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

package com.tbyf.controller.gp.element;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumElementType;
import com.tbyf.entity.gp.Ysfl;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.element.ElementManager;
import com.tbyf.service.gp.ysfl.YsflManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


/** 
 * 类名称：ElementController
 * 修改时间：2016年10月19日
 * 作者：聂方
 * @version
 */

@Controller
@RequestMapping(value="/element")
public class ElementController extends BaseController {
	
	String menuUrl = "element/list.do"; //菜单地址(权限用)
	
	@Resource(name="elementService")
	private ElementManager elementService;
	
	@Resource(name="ysflService")
	private YsflManager ysflService;
	
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
		pd.put("enumElementType", EnumElementType.toMap()); // 类型
		String ZDM = pd.getString("ZDM");	// 字段名 检索条件
		if(null != ZDM && !"".equals(ZDM)){
			pd.put("ZDM", ZDM.trim());
		}
		String XSMC = pd.getString("XSMC");	// 显示名称 检索条件
		if(null != XSMC && !"".equals(XSMC)){
			pd.put("XSMC", XSMC.trim());
		}
		String LX = pd.getString("LX");	 //类型检索条件
		if(null != LX && !"".equals(LX)){
			pd.put("LX", LX.trim());
		}else{
			pd.put("LX", null);
		}
		page.setPd(pd);
		List<PageData>	elementList = elementService.list(page);	//列表
		mv.setViewName("gp/element/element_list");
		mv.addObject("elementList", elementList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增元素页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumElementType", EnumElementType.toMap()); // 类型
		List<Ysfl> ysflList = ysflService.listAllYsfl(pd);	//元素分类
		mv.setViewName("gp/element/element_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("ysflList", ysflList);
		return mv;
	}
	
	/**保存
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增元素");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//ID
		if(null == elementService.findById(pd)){  //判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		elementService.save(pd);           //执行保存
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改元素页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = elementService.findById(pd);  	//根据ID读取
		pd.put("enumElementType", EnumElementType.toMap()); // 类型

		if(pd.get("SCSJ")!=null){
		    String a =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(pd.get("SCSJ")); 
		    pd.put("SCSJ", a);
		}else{
			pd.put("SCSJ", "");
		}
		if(pd.get("XGSJ")!=null){
		    String b =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(pd.get("XGSJ")); 
		    pd.put("XGSJ", b);
		}else{
			pd.put("XGSJ", "");
		}
		mv.setViewName("gp/element/element_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改元素");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		elementService.edit(pd);	//执行修改
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
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除元素");
		PageData pd = new PageData();
		pd = this.getPageData();
		elementService.delete(pd);
		out.write("success");
		out.close();
	}
	
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除元素");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String IDS = pd.getString("IDS");
			if(null != IDS && !"".equals(IDS)){
				String ArrayIDS[] = IDS.split(",");
				elementService.deleteAll(ArrayIDS);
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

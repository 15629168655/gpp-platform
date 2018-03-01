package com.tbyf.controller.gp.payservice;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.payservice.PayServiceManager;
import com.tbyf.service.system.dictionaries.impl.DictionariesService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 收费项目
 * @author lh	
 *
 */
@Controller
@RequestMapping(value="/payservice")
public class PayServiceController extends BaseController{
	
	@Resource(name="payservice")
	private PayServiceManager payservice;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	/**
	 * 收费项目信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page, HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"收费项目列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("BM", request.getParameter("ID"));
		//System.out.println(pd);
		page.setPd(pd);
		List<PageData> varList = payservice.list(page);
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		mv.setViewName("gp/payservice/payservice_list");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest request) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("FLBM", request.getParameter("FLBM"));
		mv.addObject("pd", pd);
		mv.setViewName("gp/payservice/payservice_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String sj = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		pd.put("ID", this.get32UUID());	//主键
		User user = this.getCurrentUser();
		pd.put("CZY", user.getName());  //操作员
		pd.put("XGSJ", sj);
		payservice.save(pd);
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
		pd = payservice.findById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		mv.setViewName("gp/payservice/payservice_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		payservice.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		PageData pd = new PageData();
		pd = this.getPageData();
		payservice.delete(pd);
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
				payservice.deleteAll(ids);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**
	 * 显示菜单列表ztree(菜单管理)
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "/treeData")
//	@ResponseBody
//	public String treeData(HttpServletRequest request,
//			HttpServletResponse response, Model model) throws Exception {
//		logBefore(logger, Jurisdiction.getUsername() + "获取字典信息");
//		String DICTIONARIES_ID = "199cabb7ce6d48b0a4860ba22c886890";
//		List<Dictionaries> listDepart = dictionariesService.listSubDictByParentId(DICTIONARIES_ID);
//		JSONArray array = JSONArray.fromObject(listDepart);
//		String json = array.toString();
//		json = json.replaceAll("DICTIONARIES_ID", "id")
//				.replaceAll("PARENT_ID", "pId")
//				.replaceAll("NAME", "name")
//				.replaceAll("subDict", "nodes")
//				.replaceAll("hasDict", "checked")
//				.replaceAll("treeurl", "url");
//		// model.addAttribute("zTreeNodes", json);
//		// mv.addObject("DICTIONARIES_ID",DICTIONARIES_ID);
//		// mv.addObject("pd", pd);
//		return json;
//	}
	
	
	/**
	 * 显示菜单列表ztree(菜单管理)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/treeData")
	@ResponseBody
	public String treeData(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String PARENT_ID = request.getParameter("id");
		List<Dictionaries> list =  payservice.treeData(PARENT_ID);
		JSONArray array=JSONArray.fromObject(list);
		String json = array.toString();
		json = json.replaceAll("DICTIONARIES_ID", "id")
				.replaceAll("PARENT_ID", "pId")
				.replaceAll("NAME", "name")
				.replaceAll("subDict", "nodes")
				.replaceAll("hasDict", "isParent")
				.replaceAll("treeurl", "url");
		System.out.println(json);
		return json;
	}
	
	/**
	 * 显示列表   ztree
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goTree")
	@ResponseBody
	public ModelAndView goTree(Model model,String BM) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd.put("BM", BM);
			mv.addObject("pd",pd);
		//设置跳转路径
		mv.setViewName("gp/payservice/payservice_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
}

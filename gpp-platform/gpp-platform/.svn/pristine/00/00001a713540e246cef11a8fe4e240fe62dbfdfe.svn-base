package com.tbyf.controller.gp.lcxm;

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
import com.tbyf.entity.enums.EnumLcxmQY;
import com.tbyf.entity.gp.Lcxm;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.lcxm.LcxmManager;
import com.tbyf.service.gp.lcxmdzb.impl.LcxmdzbService;
import com.tbyf.service.gp.payservice.PayServiceManager;
import com.tbyf.service.system.dictionaries.impl.DictionariesService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/** 
 * 说明：临床项目
 * 创建人：
 * 创建时间：2016-06-22
 */
@Controller
@RequestMapping(value="/lcxm")
public class LcxmController extends BaseController {
	
	String menuUrl = "lcxm/listAll.do"; //菜单地址(权限用)
	@Resource(name="lcxmService")
	private LcxmManager lcxmService;
	
	@Resource(name="lcxmdzbService")
	private LcxmdzbService lcxmdzbService;
	
	@Resource(name="payservice")
	private PayServiceManager payservice;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	/**
	 * 显示列表   ztree
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAll")
	@ResponseBody
	public ModelAndView goTree(Model model,String LCXM) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd.put("LCXM", LCXM);
			mv.addObject("pd",pd);
		//设置跳转路径
		mv.setViewName("gp/lcxm/lcxm_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 显示菜单列表ztree(菜单管理)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/treeData")
	@ResponseBody
	public String treeData(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String ID = request.getParameter("ID");
		List<Lcxm> lcxmList =  lcxmService.treeData(ID);
		
		JSONArray array=JSONArray.fromObject(lcxmList);
		String json = array.toString();
//		String json = arr.replaceAll("ID", "id").replaceAll("PID", "pId").replaceAll("MC", "name").replaceAll("isParent", "isParent");
		return json;
	}
	
	/**去新增临床项目的菜单页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("EnumLcxmQY", EnumLcxmQY.toMap());
		mv.setViewName("gp/lcxm/lcxm_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增临床项目");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", String.valueOf(Integer.parseInt(lcxmService.findMaxId(pd).get("ID").toString())+1));	//主键
		lcxmService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去编辑临床项目的菜单页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = lcxmService.findById(pd);	//读取此ID的菜单数据
		pd.put("EnumLcxmQY", EnumLcxmQY.toMap());
		mv.setViewName("gp/lcxm/lcxm_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改临床项目菜单");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		lcxmService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param ID
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Organization");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		try{
			if(lcxmService.treeData(pd.getString("ID")).size() > 0){//判断是否有子菜单，是：不允许删除
				errInfo = "false";
			}else{
				lcxmService.delete(pd);	//执行删除
				errInfo = "success";
			}
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断输入的编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasBM")
	@ResponseBody
	public Object hasBM(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			String id = pd.getString("ID");			
			String BMNew = pd.getString("BM");					
			if(lcxmService.findByBM(pd) != null){
				errInfo = "error";
			}
			if(null != id && !"".equals(id)){								//若id为空，则说明是新增
				PageData pd1 = lcxmService.findById(pd);
				String BMOld = pd1.getString("BM");
				if(BMOld.equals(BMNew)){									//修改信息时，判断输入的编码是否跟原本保存的BM一致
					errInfo = "success";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/*******************************************以下为临床项目对照表信息*********************************************/
	/**
	 * 显示右边临床项目对照表列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pd = this.getPageData();
			String keywords = pd.getString("keywords");				//关键词检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<PageData>	list = lcxmdzbService.list(page);				//对照表
			mv.setViewName("gp/lcxmdzb/lcxmdzb_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**删除临床项目对照表信息
	 * @param ID
	 * @throws Exception
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		logBefore(logger, Jurisdiction.getUsername()+"删除临床项目对照表信息");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String LCXM = "";
		try{
			LCXM = lcxmdzbService.findById(pd).getString("LCXM");
			lcxmdzbService.delete(pd);	//执行删除
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("LCXM", LCXM);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		String LCXM = "";
		try {
			String D = ids[0];
			pd.put("ID", D);
			LCXM = lcxmdzbService.findById(pd).getString("LCXM");
			for(String id:ids){
				pd.put("ID", id);
				lcxmdzbService.delete(pd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("LCXM", LCXM);
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**
	 * 显示列表   ztree
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddSfxm")
	@ResponseBody
	public ModelAndView goAddSfxm(Model model,String BM) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd.put("BM", BM);
			mv.addObject("pd",pd);
		//设置跳转路径
			mv.setViewName("gp/lcxm/lcxm_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 显示菜单列表ztree(菜单管理)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/goTreeData")
	@ResponseBody
	public String goTreeData(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String PARENT_ID = request.getParameter("id");
		List<Dictionaries> list =  lcxmService.goTreeData(PARENT_ID);
		JSONArray array=JSONArray.fromObject(list);
		String json = array.toString();
		json = json.replaceAll("DICTIONARIES_ID", "id")
				.replaceAll("PARENT_ID", "pId")
				.replaceAll("NAME", "name")
				.replaceAll("subDict", "nodes")
				.replaceAll("hasDict", "checked")
				.replaceAll("treeurl", "url");
		return json;
	}
	
	
	/**
	 * 收费项目列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sfxmlist")
	public ModelAndView sfxmlist(Page page) throws Exception{
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
		List<PageData> varList = payservice.list(page);
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		mv.setViewName("gp/lcxm/goPayservice_list");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
    }
	

	/**根据选中的收费信息更新临床项目对照表
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddAll")
	@ResponseBody
	public Object goAddAll(){
		logBefore(logger, Jurisdiction.getUsername()+"根据选中的收费信息更新临床项目对照表");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		String SFXMName = "";//用来存重复的收费项目名称
		try {
			for(String id:ids){
				/* pd是页面传进的参数                          p1是通过页面选中的ID查询收费表得到的数据              p2是更新对照表所需的数据*/
				pd.put("ID", id);//此ID是收费项目选取页面传进来的ID用来查询收费项目表
				PageData pd1 = payservice.findById(pd);
				String BM = pd1.getString("BM"); //得到收费表中的BM
				String LCXM = (String) pd.get("msg");//临床项目表中的编码，对应临床项目对照表中的临床项目(从点击主页面左边临床项目树的节点开始，数次辗转前端后台，带了十万八千里过来的编码)
				pd.put("SFXM", BM);//收费表中的BM对应临床项目对照表中的收费项目（字段名变来变去我也晕了）
				pd.put("LCXM", LCXM);
				PageData isNull = lcxmdzbService.findBySFXM(pd);//通过选中的收费项目编码和临床项目查询临床项目对照表中该临床项目是否已存在该收费项目
				if(isNull == null){					
					PageData pd2 = new PageData();
					pd2.put("ID", this.get32UUID());//此ID是用来更新临床项目对照表
					pd2.put("LCFLDM", "X");//TODO 不确定字段
					pd2.put("LCXM", LCXM);//临床项目
					pd2.put("SFXM", BM);//收费项目
					pd2.put("SFXMMC", pd1.getString("MC"));//收费项目名称
					pd2.put("GG", pd1.getString("GG"));//规格
					pd2.put("DW", pd1.getString("GG"));//TODO 暂时写成规格和单位是一样的
					pd2.put("SL", "1");
					pd2.put("JFGZ", "计价");//计费规则
					lcxmdzbService.save(pd2);
				} else {
					SFXMName += pd1.getString("MC")+";";
				}
			}
			map.put("SFXMName", SFXMName);
			map.put("BM", pd.get("msg"));//将编码传入页面，用于刷新页面
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AppUtil.returnObject(new PageData(), map);	
	}
	
	/**去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEditSL")
	public ModelAndView goEditSL() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = lcxmdzbService.findById(pd);					//根据ID读取
			mv.setViewName("gp/lcxmdzb/lcxmdzb_edit");
			mv.addObject("msg", "editSL");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改保存基层卫生提醒
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editSL")
	public ModelAndView editSL() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改收费项目数量");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		lcxmdzbService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
}

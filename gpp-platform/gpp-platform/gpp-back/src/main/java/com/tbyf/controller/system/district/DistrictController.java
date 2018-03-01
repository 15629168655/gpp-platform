package com.tbyf.controller.system.district;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.system.district.DistrictManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

import net.sf.json.JSONArray;

/**
 * 行政区划 控制器
 * @author LiuWenHao
 *
 */
@Controller
@RequestMapping(value="/district")
public class DistrictController extends BaseController {
	String menuUrl="district/list.do";//菜单地址（权限用）
	@Resource(name="districtService")
	private DistrictManager districtService;
	
	/**
	 * 删除
	 * @param guid
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String REGICODE) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除District");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd.put("REGICODE", REGICODE);
		String errInfo = "success";
		if(districtService.listSubDistByFid(REGICODE).size() > 0){//判断是否有子级，是：不允许删除
			errInfo = "false";
		}/*else{
			pd = districtService.findById(pd);//根据ID读取
			if(null != pd.get("TBSNAME") && !"".equals(pd.getString("TBSNAME"))){
				String[] table = pd.getString("TBSNAME").split(",");
				for(int i=0;i<table.length;i++){
					pd.put("thisTable", table[i]);
					try {
						if(Integer.parseInt(districtService.findFromTbs(pd).get("zs").toString())>0){//判断是否被占用，是：不允许删除(去排查表检查字典表中的编码字段)
							errInfo = "false";
							break;
						}
					} catch (Exception e) {
							errInfo = "false2";
							break;
					}
				}
			}
		}*/
		if("success".equals(errInfo)){
			districtService.delete(pd);	//执行删除
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
		logBefore(logger, Jurisdiction.getUsername()+"修改district");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("REGICODE", pd.get("bianma"));
		districtService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
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
			String REGICODE = pd.getString("REGICODE");
			pd = districtService.findById(pd);	//根据ID读取
			mv.addObject("pd", pd);					//放入视图容器
			pd.put("REGICODE",pd.get("P_REGICODE").toString());			//用作上级信息
			mv.addObject("pds", districtService.findById(pd));				//传入上级所有信息
			mv.addObject("REGICODE", pd.get("P_REGICODE").toString());	//传入上级ID，作为子ID用
			pd.put("P_REGICODE", pd.get("P_REGICODE").toString());
			pd.put("bianma", REGICODE);							//复原本ID
			mv.setViewName("system/district/district_edit");
			mv.addObject("msg", "edit");
			return mv;
		}	
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasBianma")
	@ResponseBody
	public Object hasBianma(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(districtService.findById(pd) != null){
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
		logBefore(logger, Jurisdiction.getUsername()+"新增District");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String FINANCELEVEL ="1";
		if(null != pd.get("FINANCELEVEL")&&!"".equals(pd.get("FINANCELEVEL"))){
			FINANCELEVEL = String.valueOf(Integer.parseInt(pd.get("FINANCELEVEL").toString()) +1) ;
		}
		pd.put("REGICODE", pd.get("bianma"));	//主键
		pd.put("FINANCELEVEL",FINANCELEVEL);
		pd.put("ORDERNUM", 0);
		districtService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
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
		String REGICODE = null == pd.get("REGICODE")?"":pd.get("REGICODE").toString();
		pd.put("REGICODE", REGICODE);					//上级ID
		mv.addObject("pds",districtService.findById(pd));		//传入上级所有信息
		mv.addObject("REGICODE", REGICODE);			//传入ID，作为子级ID用
		mv.setViewName("system/district/district_edit");
		mv.addObject("msg", "save");
		return mv;
	}	
	
	
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表District");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String REGICODE= null ==pd.getString("REGICODE")?"":pd.getString("REGICODE").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			REGICODE = pd.get("id").toString();
		}
		pd.put("REGICODE", REGICODE);//上级ID 行政区划代码
		page.setPd(pd);
		List<PageData> varList=districtService.list(page);//列出行政区划列表
		mv.addObject("pd", districtService.findById(pd));//传入上级所有信息
		mv.addObject("REGICODE", REGICODE);
		mv.setViewName("system/district/district_list");
		mv.addObject("varList",varList);
		mv.addObject("QX",Jurisdiction.getHC());					//按钮权限
	return mv;	
	}
	
	/**
	 * 显示列表   ztree
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllDis")
	public ModelAndView listAllDis(Model model) throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			JSONArray array=JSONArray.fromObject(districtService.packageTreeDate(Const.TREE_TOP_NODE));
			String json = array.toString();
			mv.addObject("treeTopJson", json);
		//设置跳转路径
		mv.setViewName("system/district/district_ztree");
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
	@RequestMapping(value = "/disTree")
	@ResponseBody
	public String disTree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		JSONArray array=JSONArray.fromObject(districtService.getDisTree(id));
		String json = array.toString();
		//json=json.replaceAll("guid", "id").replaceAll("sjxzqhdm", "pId").replaceAll("xzqhmc", "name").replaceAll("hasDist", "isParent").replaceAll("treeurl", "url");
		return json;
	}
	/**
	 * 区划管理Tree 含有点击编辑或查询的url
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
		JSONArray array=JSONArray.fromObject(districtService.packageTreeDate(id));
		String json = array.toString();
		//json=json.replaceAll("guid", "id").replaceAll("sjxzqhdm", "pId").replaceAll("xzqhmc", "name").replaceAll("hasDist", "isParent").replaceAll("treeurl", "url");
		return json;
	}
}

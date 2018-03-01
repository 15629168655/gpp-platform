package com.tbyf.controller.gp.ysfl;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.gp.Ysfl;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.ysfl.YsflManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
/** 
 * 类名称：YsflController 元素分类
 * 创建人：lizk
 * 创建时间：2016年10月19日
 * @version
 */
@Controller
@RequestMapping(value="/ysfl")
public class YsflController extends BaseController {

	String menuUrl = "ysfl/list.do"; //菜单地址(权限用)
	@Resource(name="ysflService")
	private YsflManager ysflService;
	
	/**
	 * 显示元素分类菜单列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			String ID = (null == pd.get("ID") || "".equals(pd.get("ID").toString()))?"":pd.get("ID").toString();
			pd.put("PId", ID);
			String keywords = pd.getString("keywords");					//检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<Ysfl> menuList = ysflService.listSubMenuByParentId(page);
			pd.put("ID", ID);
			mv.addObject("pd", ysflService.getMenuById(pd));	//传入父菜单所有信息
			mv.addObject("ID", ID);
			mv.addObject("MSG", null == pd.get("MSG")?"list":pd.get("MSG").toString()); //MSG=change 则为编辑或删除后跳转过来的
			mv.addObject("menuList", menuList);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			mv.setViewName("gp/ysfl/ysfl_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 请求新增菜单页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String ID = (null == pd.get("ID") || "".equals(pd.get("ID").toString()))?"0":pd.get("ID").toString();//接收传过来的上级菜单ID,如果上级为顶级就取值“0”
			pd.put("ID",ID);
			mv.addObject("pds", ysflService.getMenuById(pd));	//传入父菜单所有信息
			mv.addObject("ID", ID);								//传入菜单ID，作为子菜单的父菜单ID用
			mv.addObject("MSG", "add");							//执行状态 add 为添加
			mv.setViewName("gp/ysfl/ysfl_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}	
	
	/**
	 * 保存元素分类菜单信息
	 * @param ysfl
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Ysfl ysfl)throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"保存元素分类菜单");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			ysfl.setID(String.valueOf(Integer.parseInt(ysflService.findMaxId(pd).get("ID").toString())+1));
			ysflService.saveMenu(ysfl); //保存菜单
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("redirect:/ysfl/list.do?MSG=change&ID="+ysfl.getPID()); //保存成功跳转到列表页面
		return mv;
	}
	
	/**
	 * 请求编辑菜单页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(String id)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("ID",id);				//接收过来的要修改的ID
			pd = ysflService.getMenuById(pd);	//读取此ID的菜单数据
			mv.addObject("pd", pd);				//放入视图容器
			pd.put("ID",pd.get("PID").toString());			//用作读取父菜单信息
			mv.addObject("pds", ysflService.getMenuById(pd));			//传入父菜单所有信息
			mv.addObject("ID", pd.get("PID").toString());	//传入父菜单ID，作为子菜单的父菜单ID用
			mv.addObject("MSG", "edit");
			pd.put("ID",id);			//复原本菜单ID
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			mv.setViewName("gp/ysfl/ysfl_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存编辑元素分类
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(Ysfl ysfl)throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改元素分类菜单");
		ModelAndView mv = this.getModelAndView();
		try{
			ysflService.edit(ysfl);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("redirect:/ysfl/list.do?MSG=change&ID="+ysfl.getPID()); //保存成功跳转到列表页面
		return mv;
	}
	
	/**
	 * 删除元素分类菜单(逻辑删除)
	 * @param ID
	 * @param out
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String ID)throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除元素分类菜单");
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "";
		try{
			if(ysflService.treeData(ID).size() > 0){//判断是否有子菜单，是：不允许删除
				errInfo = "false";
			}else{
				ysflService.deleteMenuById(ID);
				errInfo = "success";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	

	/**
	 * 显示菜单列表ztree(菜单管理)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/treeData")
	@ResponseBody
	public String treeData(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		List<Ysfl> ysflList =  ysflService.treeData(id);
		JSONArray array=JSONArray.fromObject(ysflList);
		String json = array.toString();
//		String json = arr.replaceAll("ID", "id").replaceAll("PID", "pId").replaceAll("MC", "name").replaceAll("isParent", "isParent");
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
	public ModelAndView goTree(Model model,String id) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd.put("ID", id);
			mv.addObject("pd",pd);
		//设置跳转路径
		mv.setViewName("gp/ysfl/ysfl_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

//	/**根据角色权限获取本权限的菜单列表(递归处理)
//	 * @param menuList：传入的总菜单
//	 * @param roleRights：加密的权限字符串
//	 * @return
//	 */
//	public List<Menu> readMenu(List<Menu> menuList,String roleRights){
//		for(int i=0;i<menuList.size();i++){
//			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
//			if(menuList.get(i).isHasMenu() && "1".equals(menuList.get(i).getMENU_STATE())){	//判断是否有此菜单权限并且是否隐藏
//				this.readMenu(menuList.get(i).getSubMenu(), roleRights);					//是：继续排查其子菜单
//			}else{
//				menuList.remove(i);
//				i--;
//			}
//		}
//		return menuList;
//	}
	
}

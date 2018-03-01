
package com.tbyf.controller.gp.bookingaccredit;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAccreditState;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumSex;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.bookingaccredit.BookingAccreditMannger;
import com.tbyf.service.hm.organization.OrganizationManager;
import com.tbyf.service.hm.yhry.YhryManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Constants;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

import net.sf.json.JSONArray;


/**
 * 
 * @author zanxc
 *预约授权模块
 */
@Controller
@RequestMapping(value="/bookingAccredit")
public class BookingAccreditController extends BaseController{

	String menuUrl = "bookingAccredit/list.do"; //菜单地址(权限用)
	@Resource(name="bookingAccreditService")
    private BookingAccreditMannger bookingAccreditService;
	@Resource(name="yhryService")
	private YhryManager yhryService;
	@Resource(name="organizationService")
	private OrganizationManager organizationService;
	/**显示医生预约授权详情
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示医生预约授权详情");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("HIG_PRIVIDE_ID", this.getCurrentUser().getProviderId());
		pd.put("STATE", EnumAccreditState.NORMAL.getCode());
		page.setPd(pd);
		mv.addObject("ACCREDITSTATE", EnumAccreditState.toMap());
		List<PageData>	list = bookingAccreditService.list(page);  //列
		mv.setViewName("gp/bookingaccredit/bookingaccredit_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加用户授权");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		//将name转化成数组
		String [] indexString = pd.get("IDS").toString().split(",");
		String [] nameString = pd.get("NAMES").toString().split(",");
		String nowDate = Tools.date2Str(new Date());
		if(!pd.containsKey("HIG_PRIVIDE_ID")) {
			pd.put("HIG_PRIVIDE_ID", this.getCurrentUser().getProviderId());//上级医生ID
			pd.put("HIG_PRIVIDE_NAME", this.getCurrentUser().getProviderName());//上级医生名称
		}
		pd.put("OPERATION_NAME", this.getCurUser().getUserName());
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("STATE", Integer.toString(EnumAccreditState.NORMAL.getCode()));//添加状态正常
		for(int i = 0; i < indexString.length; i ++) {//批量保存
			pd.put("BOOKING_ACCREDIT_ID", this.get32UUID());//ID
			pd.put("PUBLIC_PRIVIDE_ID", indexString[i]);//公卫医生ID
			pd.put("PUBLIC_PRIVIDE_NAME", nameString[i]);//公卫医生名称
			bookingAccreditService.save(pd);//
			pd.remove("BOOKING_ACCREDIT_ID");
			pd.remove("PUBLIC_PRIVIDE_ID");
			pd.remove("PUBLIC_PRIVIDE_NAME");
		}
		pd.put("msg", "ok");
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(pd, map);
	}
	/**停用授权
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"停用授权");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("STATE", EnumAccreditState.STOP.getCode());
		bookingAccreditService.update(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**获取医护人员列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/yhrylist")
	public ModelAndView yhrylist(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表yhry");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String org_code = pd.getString("ORG_CODE");
		if(null != org_code && !"".equals(org_code)){
		pd.put("ORG_CODE", org_code);
		}
		pd.put("HIG_PRIVIDE_ID", this.getCurrentUser().getProviderId());//上级医生
		pd.put("next_code", Const.NEXT_ORG_CODE);//下级医生机构编码前缀
		pd.put("enumSex", EnumSex.toMap()); // 性别
		page.setPd(pd);
		//通过ORG_CODE获得机构下的医护人员列表
		List<PageData> varList = yhryService.yhrylist(page);
		mv.setViewName("gp/bookingaccredit/yhry_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("ISLEAF",pd.getString("ISLEAF"));
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 显示列表   ztree
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllYhry")
	public ModelAndView listAllYhry(Model model) throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(Const.TREE_TOP_NODE,null,null));
			String json = array.toString();
			mv.addObject("treeTopJson", json);
			//设置跳转路径
			mv.setViewName("gp/bookingaccredit/yhry_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
	}
		return mv;
	}
	
	/**
	 * 带链接的树
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/treeData")
	@ResponseBody
	public String depTreeData(HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(id,request.getParameter("type"),request.getParameter("action")));
		String json = array.toString();
		//json=json.replaceAll("guid", "id").replaceAll("sjxzqhdm", "pId").replaceAll("xzqhmc", "name").replaceAll("hasDist", "isParent").replaceAll("treeurl", "url");
		return json;
	}
}

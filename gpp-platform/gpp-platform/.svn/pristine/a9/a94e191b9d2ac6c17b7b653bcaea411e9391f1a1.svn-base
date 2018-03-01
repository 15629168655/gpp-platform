package com.tbyf.controller.gp.jmxx;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAgreement;
import com.tbyf.entity.enums.EnumIsComplete;
import com.tbyf.entity.enums.EnumIsIndependence;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.GetGrdaUrl;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 居民信息管理
 * @author lizk
 *2016-09-03
 */
@Controller
@RequestMapping(value="/jmxx")
public class JmxxController extends BaseController {
	
	String menuUrl = "jmxx/listJmxx.do"; //菜单地址(权限用)
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	
	
	Integer eaD = EnumAgreement.DELETE.getCode();//枚举，删除状态
	Integer eaE = EnumAgreement.EFFECTIVE.getCode();//枚举，有效状态
	/**显示居民信息
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listJmxx")
	public ModelAndView listJxmm(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("STATE", eaD);
			/**
			 * 重点人群列表枚举显示
			 */
			page.setPd(pd);
			List<PageData>	jmxxList = jmxxService.listAlljmxx(page);				//居民列表
			mv.setViewName("gp/jmxx/jmxx_list");
			mv.addObject("jmxxList", jmxxList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**去新增用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAddJmxx")
	public ModelAndView goAddU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumIsComplete", EnumIsComplete.toMap()); 	//是否认证
		pd.put("EnumIsIndependence", EnumIsIndependence.toMap());//是否独立
		mv.setViewName("gp/jmxx/jmxx_edit");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**判断身份证号是否存在
	 * @return
	 */
	@RequestMapping(value="/hasI")
	@ResponseBody
	public Object hasI(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			String user_agent_id = pd.getString("USER_AGENT_ID");			//新增或编辑页面传过来的user_agent_id
			String id_numberNew = pd.getString("ID_NUMBER");				//新增或编辑时，页面编码框传过来的身份证号
			if(jmxxService.jmxxByIdcard(pd) != null){
				errInfo = "error";
			}
			if(null != user_agent_id && !"".equals(user_agent_id)){			//若user_agent_id为空，则说明是新增，不需要通过user_agent_id查找
				PageData pd1 = jmxxService.findById(pd);					//根据user_agent_id读取
				String id_numberOld = pd1.getString("ID_NUMBER");			//通过user_agent_id从数据库获取到的身份证
				if(id_numberOld.equals(id_numberNew)){						//修改居民信息时，判断身份证框中的值跟原来的是否一样
					errInfo = "success";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断医保卡号是否存在
	 * @return
	 */
	@RequestMapping(value="/hasM")
	@ResponseBody
	public Object hasM(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			String user_agent_id = pd.getString("USER_AGENT_ID");			//新增或编辑页面传过来的user_agent_id
			String mi_cardNew = pd.getString("MI_CARD");					//新增或编辑时，页面编码框传过来的身份证号
			if(jmxxService.jmxxByMi_card(pd) != null){
				errInfo = "error";
			}
			if(null != user_agent_id && !"".equals(user_agent_id)){			//若user_agent_id为空，则说明是新增，不需要通过user_agent_id查找
				PageData pd1 = jmxxService.findById(pd);					//根据user_agent_id读取
				String mi_cardOld = pd1.getString("MI_CARD");				//通过user_agent_id从数据库获取到的身份证
				if(mi_cardOld.equals(mi_cardNew)){							//修改居民信息时，判断身份证框中的值跟原来的是否一样
					errInfo = "success";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**保存新增居民信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveU")
	public ModelAndView saveU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增居民信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//		pd.put("STATE", eaE);
		jmxxService.saveU(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去修改居民信息页面
	 * @return
	 */
	@RequestMapping(value="/goEditJmxx")
	public ModelAndView goEditJmxx(){
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"编辑居民信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = jmxxService.findById(pd);					//根据ID读取
			pd.put("EnumIsComplete", EnumIsComplete.toMap()); 	//是否认证
			pd.put("EnumIsIndependence", EnumIsIndependence.toMap());//是否独立
			mv.setViewName("gp/jmxx/jmxx_edit");
			mv.addObject("msg", "editJmxx");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改居民信息
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editJmxx")
	public ModelAndView editJmxx(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改居民信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//System.out.println(pd);
		jmxxService.editJmxx(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除居民信息
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteJmxx")
	public void deleteJmxx(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除居民信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", eaD);
		jmxxService.deleteJmxx(pd);
		out.write("success");
		out.close();
	}
	
	
	/**批量删除居民信息
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAllJmxx")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除居民信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("user_agent_ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("USER_AGENT_ID", id);
				pd.put("STATE", eaD);
				jmxxService.deleteJmxx(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**去诊疗信息页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goClinicalInfo")
	public ModelAndView goClinicalInfo(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"诊疗信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd = referralService.findById(pd);	//根据ID读取 转诊申请
		pd.put("CARDID", request.getParameter("CARDID"));
		pd.put("USER_AGENT_ID ", request.getParameter("USER_AGENT_ID"));
		//System.out.println(pd);
		String healthRecordUrl = "";
		if(pd.get("CARDID")!=null) healthRecordUrl = GetGrdaUrl.getGrdaUrl(pd.getString("CARDID"));
		mv.addObject("healthRecordUrl", healthRecordUrl);
		mv.setViewName("hm/referral/clinical_info");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * @author zanxc
	 * 显示居民详情
	 */
	@RequestMapping(value="/showInfo")
	public ModelAndView showInfo(HttpServletRequest request)throws Exception {
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"居民详情信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = jmxxService.findById(pd);					//根据ID读取居民的基本信息
			pd.put("EnumIsComplete", EnumIsComplete.toMap()); 	//是否认证
			pd.put("EnumIsIndependence", EnumIsIndependence.toMap());//是否独立
		    // jzxx  = jmxxService.findById(pd);// 居民的就诊信息
			mv.setViewName("gp/jmxx/jmxx_info");
			mv.addObject("msg", "list");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}		
		return mv;
	}
	/**
	 * 去居民自测档案
	 *  @author zanxc
	 */
	@RequestMapping(value="/goSelfTestFile")
	public ModelAndView goSelfTestFile(HttpServletRequest request)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"居民自测档案");
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/jmxx/selfTestFile_info");
		mv.addObject("pd", pd);
		return mv;
	}

}
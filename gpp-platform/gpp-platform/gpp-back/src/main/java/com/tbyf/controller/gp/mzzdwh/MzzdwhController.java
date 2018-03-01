package com.tbyf.controller.gp.mzzdwh;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumMzzdwhCFB;
import com.tbyf.entity.enums.EnumMzzdwhCRB;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jbzd.impl.JbzdService;
import com.tbyf.service.gp.mzzdwh.MzzdwhManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 门诊诊断维护
 * @author lizk
 *2016-09-03
 */
@Controller
@RequestMapping(value="/mzzdwh")
public class MzzdwhController extends BaseController {
	
	String menuUrl = "mzzdwh/listZdxx.do"; //菜单地址(权限用)
	@Resource(name="mzzdwhService")
	private MzzdwhManager mzzdwhService;
	@Resource(name="jbzdService")
	private JbzdService jbzdService;
	
	/**门诊诊断维护列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listZdxx")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"门诊诊断维护列表");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumMzzdwhCRB", EnumMzzdwhCRB.toMap());	//是否传染病在页面列表显示
		pd.put("enumMzzdwhCFB", EnumMzzdwhCFB.toMap());	//是否尘肺病病在页面列表显示
		pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构ID
		page.setPd(pd);
		List<PageData>	zdxxList = mzzdwhService.zdxxlist(page); //列出诊断信息列表
		mv.setViewName("gp/mzzdwh/mzzdwh_list");
		mv.addObject("zdxxList", zdxxList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**点击新增弹出录入页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAddDis(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumMzzdwhCRB", EnumMzzdwhCRB.toMap());	//是否传染病在页面列表显示
		pd.put("enumMzzdwhCFB", EnumMzzdwhCFB.toMap());	//是否尘肺病病在页面列表显示
		mv.setViewName("gp/mzzdwh/zdxq_add");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**弹出疾病字典页面点击录入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddJbzd")
	public ModelAndView goAddJbzd(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = jbzdService.jbzdlist(page);  //列出疾病字典列表，用于显示在新增页面选取

		mv.setViewName("gp/mzzdwh/zdxq_add_list");
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**判断录入的疾病信息是否已存在
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/luRuJbzd")
	@ResponseBody
	public Object saveAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"判断录入的疾病信息是否已存在");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String bm = pd.getString("BM");
		if(null != bm && !"".equals(bm)){
			PageData pd1 = new PageData();
			pd1.put("BM",bm);
			pd1.put("ORG_CODE", getCurUser().getOrgCode()); //单位机构
			if(mzzdwhService.findByBM(pd1) != null)		//	查询门诊诊断字典表，判断选中的疾病是否存在
			{
				pd.put("msg", "no");											
			}
		}
		return pd;
	}
	
	/**保存新增门诊诊断维护信息
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveMzzd")
	public ModelAndView saveObject() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增门诊诊断维护信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CZY", getCurUser().getName());     	//操作员
		pd.put("GUID", this.get32UUID());	//guid
		pd.put("ORG_CODE",getCurUser().getOrgCode());	//单位机构
		mzzdwhService.saveMzzd(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
}

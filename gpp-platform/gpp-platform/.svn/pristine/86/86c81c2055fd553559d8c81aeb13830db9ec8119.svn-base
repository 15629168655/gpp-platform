package com.tbyf.controller.gp.mzblmb;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumMzblmbLX;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzblmb.impl.MzblmbService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/** 
 * 说明：门诊病历模板
 * 创建人：lizk
 * 创建时间：2017-02-14
 */
@Controller
@RequestMapping(value="/mzblmb")
public class MzblmbController extends BaseController {

	String menuUrl = "mzblmb/list.do"; //菜单地址(权限用)

	@Resource(name="mzblmbService")
	private MzblmbService mzblmbService;
	
	/**显示左侧门诊病历列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"门诊病历列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			List<PageData>	varList = mzblmbService.list(page);
			pd.put("EnumMzblmbLX", EnumMzblmbLX.toMap()); 	//类型（0：个人、1：公共）
			mv.addObject("varList", varList);
			mv.setViewName("gp/mzblmb/mzblmb_list");
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**显示右侧门诊病历内容
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/mzbl")
	public ModelAndView mzbl(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"门诊病历列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(!"add".equals(pd.getString("msg"))){//如果是新增就不执行查询操作
				if(null == pd.getString("ID") || "".equals(pd.getString("ID"))){
					page.setPd(pd);
					List<PageData>	varList = mzblmbService.list(page);
					if(varList.size() > 0){					
						pd.put("ID", varList.get(0).getString("ID"));	//第一次打开时，右边默认显示第一条信息	
						pd = mzblmbService.findByID(pd);
					}
				}else{
					pd = mzblmbService.findByID(pd);		
				}
				mv.addObject("msg", "edit");
			} else {
				mv.addObject("msg", "save");
			}
			pd.put("EnumMzblmbLX", EnumMzblmbLX.toMap()); 	//类型（0：个人、1：公共）	
			mv.setViewName("gp/mzblmb/mzblmb_mzbl");
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**修改门诊病历模板信息
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改门诊病历模板信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("LRRID", getCurUser().getUserId());//录入人ID
		mzblmbService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return new ModelAndView("redirect:/mzblmb/mzbl?success=success&ID="+pd.getString("ID")); //添加成功刷新
	}
	
	/**新增门诊病历模板
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "save")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增保存门诊病历模板信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		pd.put("ID", id);
		pd.put("LRRID", getCurUser().getProviderId());//录入人ID
		mzblmbService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return new ModelAndView("redirect:/mzblmb/mzbl?success=success&ID="+id); //添加成功刷新
	}
	
	/**删除门诊病历模板信息
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public ModelAndView del() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除门诊病历模板信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		mzblmbService.delete(pd);
		return new ModelAndView("redirect:/mzblmb/list?success=success"); //添加成功刷新
	}
	
}

package com.tbyf.controller.gp.inspect;

import com.tbyf.controller.base.*;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.inspect.impl.InspectService;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.util.*;


import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;
/**
 * 检验申请
 * @author zhangy
 *
 */

@Controller
@RequestMapping(value="/inspect")
public class InspectController extends BaseController {
    
	@Resource(name="inspectService")
	private InspectService inspectService;
	@Resource(name="providerService")
	private ProviderService providerService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = inspectService.queryPage(page);
			mv.setViewName("gp/inspect/inspect_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	@RequestMapping(value="/toAddPage")
	public ModelAndView toAddPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/inspect/add");
		return mv;
	}
	@RequestMapping(value="/saveObject")
	public ModelAndView saveObject() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增检验申请");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		
		pd.put("ID", id);
		pd.put("ORG_CODE", this.getCurUser().getOrgCode());
		pd.put("INSPECT_BH","BH_" +UUID.randomUUID().toString()+System.currentTimeMillis());
		pd.put("INSPECT_PRO_ID","PRO_ID_"+UUID.randomUUID().toString()+System.currentTimeMillis());
		pd.put("INPUT_ID", this.getCurUser().getUserId());
		pd.put("INPUT_NAME", this.getCurUser().getUserName());
		pd.put("STAUTS","0");
		inspectService.saveObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delObject")
	@ResponseBody
	public Object delObject(){
		logBefore(logger, Jurisdiction.getUsername()+"删除检验申请信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			inspectService.editSta(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		logBefore(logger, Jurisdiction.getUsername()+"批量删除检验申请");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				inspectService.editSta(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	@RequestMapping(value="/toEditPage")
	public ModelAndView toEditPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData data=inspectService.queryDataById(pd);
		mv.addObject("pd",data);
		mv.setViewName("gp/inspect/edit");
		return mv;
	}
	@RequestMapping(value="/saveEdit")
	public ModelAndView saveEdit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		inspectService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 医生列表
	 */
	@RequestMapping(value="/getDocData")
	public ModelAndView getDocData(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> list = providerService.listPage(page);	
		mv.addObject("list", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	
		mv.setViewName("gp/inspect/docData");
		return mv;
	}
	@RequestMapping(value="/listMZLS")
	public ModelAndView listMZLS(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = inspectService.queryMZJZlistPage(page);
			mv.setViewName("gp/inspect/mzlsData");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	@RequestMapping(value="/queryMZJZ")
	 @ResponseBody
	public Object queryMZJZ() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = inspectService.queryMZJZByID(pd);
			map.put("data", pd);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return AppUtil.returnObject(new PageData(), map);
    }
}
	
 
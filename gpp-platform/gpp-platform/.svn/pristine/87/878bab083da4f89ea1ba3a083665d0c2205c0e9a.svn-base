package com.tbyf.controller.gp.bloodsugar;

import com.tbyf.controller.base.*;
import com.tbyf.plugin.Page;
import com.tbyf.util.*;


import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.tbyf.service.gp.bloodsugar.impl.BloodSugarService;
import javax.annotation.*;

import java.util.*;
/**
 * 门诊测血糖
 * @author zhangy
 *
 */

@Controller
@RequestMapping(value="/bloodSugar")
public class BloodSugarController extends BaseController {
    
	@Resource(name="bloodSugarService")
	private BloodSugarService bloodSugarService;
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = bloodSugarService.queryPage(page);
			mv.setViewName("gp/bloodSugar/bloodSugar_list");
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
		mv.setViewName("gp/bloodSugar/bloodSugar_add");
		return mv;
	}
	@RequestMapping(value="/saveObject")
	public ModelAndView saveObject() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增门诊测血糖信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		pd.put("ID", id);
		pd.put("INPUT_ID", getCurUser().getUserId());
		pd.put("INPUT_NAME", getCurUser().getUserName());
		pd.put("ORG_CODE", getCurUser().getOrgCode());
		pd.put("REGION_CODE", getCurUser().getRegionCode());
		bloodSugarService.saveObj(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除症状信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			bloodSugarService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除症状信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				bloodSugarService.delete(pd);
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
		PageData data=bloodSugarService.queryDataById(pd);
		mv.addObject("data",data);
		mv.setViewName("gp/bloodSugar/bloodSugar_edit");
		return mv;
	}
	@RequestMapping(value="/saveEdit")
	public ModelAndView saveEdit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改门诊测血糖信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		bloodSugarService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
}
	
 
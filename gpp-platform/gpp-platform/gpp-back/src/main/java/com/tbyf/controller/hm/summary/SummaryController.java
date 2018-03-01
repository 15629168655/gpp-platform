package com.tbyf.controller.hm.summary;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.summary.SummaryManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;



@Controller
@RequestMapping(value="/summary")
public class SummaryController extends BaseController {
    
	@Resource(name="summaryService")
	private SummaryManager summaryService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = summaryService.queryPage(page);
			mv.setViewName("hm/summary/summary_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	@RequestMapping(value="/toView")
	public ModelAndView view(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdJmxx = new PageData();
		pd = this.getPageData();
		try {
			pdJmxx = jmxxService.findById(pd);
			pd= summaryService.findById(pd);
			mv.setViewName("hm/summary/summary_view");
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			mv.addObject("pdJmxx", pdJmxx);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
}
	
 
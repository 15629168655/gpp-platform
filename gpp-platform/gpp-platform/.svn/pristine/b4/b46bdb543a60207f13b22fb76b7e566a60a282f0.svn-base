package com.tbyf.controller.hm.statreport;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.abel533.echarts.Option;
import com.tbyf.controller.base.BaseController;
import com.tbyf.service.hm.statreport.StatreportManager;

/**
 * 转诊统计
 * @author YM
 *
 */
@Controller
@RequestMapping(value="/statreport")
public class StatReportController extends BaseController{
	@Resource(name="statreportService")
	private StatreportManager statreportService;
	
	/**
	 * 机构转诊统计
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/org_referral_stat", method = RequestMethod.GET)
    public ModelAndView showOrderShow(HttpServletRequest request, Model model) {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("hm/statreport/org_referral_stat");
		return mv;
    }
	
	@RequestMapping("/removecauses")
	public
	@ResponseBody
	Option removecauses() throws Exception {
	    try {
	    	return statreportService.selectRemoveCauses();
	    } catch (Exception e) {
	    }
	    return null;
	}
}

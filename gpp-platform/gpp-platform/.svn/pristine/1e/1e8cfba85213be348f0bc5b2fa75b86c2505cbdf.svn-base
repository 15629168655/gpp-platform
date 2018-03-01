package com.tbyf.controller.hm.lisIndicators;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.lisIndicators.LisIndicatorsManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 类名称：LisIndicatorsController 修改时间：2016年10月27日 作者：聂方
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/lisIndicators")
public class LisIndicatorsController extends BaseController {

	String menuUrl = "lisIndicators/list.do"; // 菜单地址(权限用)

	@Resource(name = "lisIndicatorsService")
	private LisIndicatorsManager lisIndicatorsService;

	@Resource(name = "jmxxService")
	private JmxxManager jmxxService;
	/**
	 * 列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String JCRXM = pd.getString("JCRXM"); // 检索条件
		if (null != JCRXM && !"".equals(JCRXM)) {
			pd.put("JCRXM", JCRXM.trim());
		}
		page.setPd(pd);
		List<PageData> List = lisIndicatorsService.list(page); // 列表
		mv.setViewName("hm/lisindicators/lisindicators_list");
		mv.addObject("List", List);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 去显示详情页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/showInfo")
	public ModelAndView showInfo() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdJmxx = new PageData();
		pd = this.getPageData();
		pdJmxx = jmxxService.findById(pd);
		pd = lisIndicatorsService.findById(pd); // 根据ID读取
		mv.setViewName("hm/lisindicators/lisindicators_show");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("pdJmxx", pdJmxx);
		return mv;
	}

	/**
	 * 从实验室报告页面跳转至查看相应检验结果标准
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/getIndicators")
	public ModelAndView getIndicators(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String BGDH = pd.getString("BGDH"); // 根据报告单号检索
		if (null != BGDH && !"".equals(BGDH)) {
			pd.put("BGDH", BGDH.trim());
		}
		page.setPd(pd);
		List<PageData> Listbybgdh = lisIndicatorsService.listbybgdh(page); // 列表
		mv.setViewName("hm/lisindicators/lisindicators_list");
		mv.addObject("List", Listbybgdh);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

}

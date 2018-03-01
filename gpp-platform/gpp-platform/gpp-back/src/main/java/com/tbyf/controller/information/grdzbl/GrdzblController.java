package com.tbyf.controller.information.grdzbl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumGrdzblType;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.grdzbl.GrdzblManager;
import com.tbyf.util.PageData;


/**
 * 信息管理-个人电子病历
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/grdzbl")
public class GrdzblController extends BaseController {
		
	@Resource(name="gedzblService")
	private GrdzblManager gedzblService;
	
	/**
	 * 信息管理-个人电子病历
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
		String keywords = pd.getString("keywords");			//关键字
			pd.put("keywords", keywords);
		String createdStart = pd.getString("start_time");	//提交时间起
		String createdEnd = pd.getString("end_time");		//提交时间止
		if(createdStart != null && !"".equals(createdStart)){
			pd.put("start_time", createdStart.trim());
		}
		if(createdEnd != null && !"".equals(createdEnd)){
			pd.put("end_time", createdEnd.trim());
		} 
		pd.put("EnumGrdzblType", EnumGrdzblType.toMap());
		page.setPd(pd);
		List<PageData> varList = gedzblService.list(page); // 列出健康资讯列表
		mv.setViewName("information/grdzbl/grdzbl_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 查看页面
	 */
	@RequestMapping(value="/toView")
	public ModelAndView toView(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		pd = gedzblService.findById(pd);
		pd.put("EnumGrdzblType", EnumGrdzblType.toMap());
		mv.addObject("pd", pd);
		mv.setViewName("information/grdzbl/grdzbl_view");
		return mv;
	}
}

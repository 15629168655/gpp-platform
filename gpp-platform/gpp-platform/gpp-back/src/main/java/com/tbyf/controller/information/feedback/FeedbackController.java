package com.tbyf.controller.information.feedback;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumTreated;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.feedback.FeedbackManager;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 信息管理-意见反馈
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/feedback")
public class FeedbackController extends BaseController{
		
	String menuUrl = "feedback/list.do"; //菜单地址
	
	@Resource(name="feedbackService")
	private FeedbackManager feedbackService;
	
	/**
	 * 意见反馈列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String state = pd.getString("STATE");
		if(null != state && !"".equals(state)){
			pd.put("STATE", state.trim());
		}else{
			pd.put("STATE", null);
		}
		pd.put("EnumTreated", EnumTreated.toMap());	 //处理意见状态
		page.setPd(pd);
		List<PageData> varList = feedbackService.list(page);
		mv.setViewName("information/feedback/feedback_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;	
	}
	
	/**
	 * 处理意见反馈信息
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				
		pd.put("CLR", user.getName());			//获取登录人姓名
		pd.put("STATE", EnumTreated.TREATED.getCode().toString());	//状态更新为已处理
		feedbackService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 处理意见反馈页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = feedbackService.findById(pd);	//根据ID读取
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				
		pd.put("CLR", user.getName());			//获取登录人姓名
		pd.put("STATE", EnumTreated.toMap());  //处理意见状态
		mv.addObject("pd", pd);
		mv.setViewName("information/feedback/feedback_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
}

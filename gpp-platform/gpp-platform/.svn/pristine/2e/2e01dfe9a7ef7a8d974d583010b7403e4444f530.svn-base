package com.tbyf.controller.gp.agreementsh;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAgreementApply;
import com.tbyf.entity.enums.EnumAgreementType;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.agreementapply.AgreementManager;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 签约审核
 * @author ad
 *
 */

@Controller
@RequestMapping(value="/agreementsh")
public class AgreementShController extends BaseController{
	
	/**
	 * 预约申请
	 */
	@Resource(name="agreementService")
	private AgreementManager agreementService;
	
	
	/**
	 * 显示预约申请列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String createdStart = pd.getString("createdStart");	//开始时间
		String createdEnd = pd.getString("createdEnd");		//结束时间
		if(createdStart != null && !"".equals(createdStart)){
			pd.put("createdStart", createdStart.trim());
		}
		if(createdEnd != null && !"".equals(createdEnd)){
			pd.put("createdEnd", createdEnd.trim());
		} 
		pd.put("enumApply", EnumAgreementApply.toMap());
		
		User user = this.getCurrentUser();
		
		pd.put("orgId", user.getOrgCode());
		page.setPd(pd);
		List<PageData> varList = agreementService.listAllys(page);
		mv.setViewName("gp/agreementsh/agreementsh_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
	
		return mv;	
	}
	
	/**
	 * 审核信息
	 * 通过
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"审核申请表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/**
		 * 状态
		 */
		String shbj = pd.getString("flag");
		pd.put("STATUS", shbj);
		agreementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**
	 * 通过id查看申请表信息
	 * 审核页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		/**
		 * 读取session中的用户信息(单独用户信息)
		 */
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				
		String name = user.getName();
		String username = user.getUserName();
		pd = agreementService.findById(pd);	//根据ID读取
		String gmt_audit = df.format(new Date());
		pd.put("EnumAgreementApply", EnumAgreementApply.toMap());
		pd.put("EnumAgreementType", EnumAgreementType.toMap());
		pd.put("AUDITOR_ID",username);
		pd.put("AUDITOR_NAME",name);
		pd.put("GMT_AUDIT",gmt_audit);
		mv.setViewName("gp/agreementsh/agreementsh_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 删除(状态编辑为作废)
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"申请审核作废");
		PageData pd = new PageData();
		pd = this.getPageData();
		agreementService.delete(pd);
		out.write("success");
		out.close();
	}
}

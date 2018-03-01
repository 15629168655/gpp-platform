package com.tbyf.controller.gp.agreementchange;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.agreementchange.AgreementchangeManager;
import com.tbyf.service.gp.agreementsevice.AgreementseviceManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 签约管理-变更管理
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/agreementChange")
public class AgreementChangeController extends BaseController{
	
	String menuUrl = "agreementChange/list.do"; //菜单地址(权限用)
	
	@Resource(name="agreementserviceService")
	private AgreementseviceManager agreementservicsService;
	@Resource(name="agreementChangeService")
	private AgreementchangeManager agreementChangeService;
	
	/**
	 * 列表
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
		page.setPd(pd);
		/**
		 * 点击签约变更管理
		 * 分页显示变更信息
		 */
		List<PageData> varList = agreementservicsService.listChange(page);  
		mv.setViewName("gp/agreementchange/agreementchange_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**
	 * 审核通过
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"审核");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "save")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String AUDITOR_COMMENT = pd.getString("AUDITOR_COMMENT");
		String flag =  pd.getString("flag");
		if(flag =="2" || flag.equals("2")){
			//审核退回
			PageData changePd = new PageData();
			changePd.put("ID", pd.getString("ID"));
			changePd.put("STATUS",flag);		//状态 	通过
			changePd.put("AUDITOR_ID",this.getCurUser().getUserId());//审批人 取当前登录用户
			changePd.put("AUDITOR_NAME",this.getCurUser().getUserName());
			changePd.put("AUDITOR_COMMENT",AUDITOR_COMMENT);
			changePd.put("GMT_AUDIT", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			agreementservicsService.updateChangeApply(changePd);
		}else if(flag =="1" || flag.equals("1")){
			pd = agreementservicsService.findChangeApplyById(pd);
			String service_pack_old = pd.getString("SERVICE_PACK");		//旧服务包
			//审核通过
			PageData changePd = new PageData();
			changePd.put("ID", pd.getString("ID"));
			changePd.put("STATUS",flag);		//状态 	通过
			changePd.put("AUDITOR_ID",this.getCurUser().getUserId());//审批人 取当前登录用户
			changePd.put("AUDITOR_NAME",this.getCurUser().getUserName());
			changePd.put("AUDITOR_COMMENT",AUDITOR_COMMENT);
			changePd.put("GMT_AUDIT", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			agreementservicsService.updateChangeApply(changePd);
			//新增签约变更表
			PageData createdPd = new PageData();
			createdPd.put("ID",this.get32UUID());
			createdPd.put("AGREEMENT_ID",pd.getString("AGREEMENT_ID"));		//协议ID
			createdPd.put("SERVICE_PACK_OLD",service_pack_old);						//旧服务包
			createdPd.put("SERVICE_PACK",pd.getString("SERVICE_PACK"));		//服务包
			createdPd.put("OPERATOR_ID",pd.getString("APPLICANT_ID"));		//申请人
			createdPd.put("OPERATOR_NAME",pd.getString("APPLICANT_NAME"));
			createdPd.put("GMT_CHANGE",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));		//申请时间
			agreementChangeService.created(createdPd);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**
	 * 审核页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = agreementservicsService.findChangeApplyById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementchange/agreementchange_edit");
		return mv;
	}
	/**
	 * 变更历史纪录
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listLogs")
	public ModelAndView listLogs(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> varList = agreementservicsService.logslistPage(page);  
		mv.setViewName("gp/agreementchange/logs_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	/**
	 * 作废
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "delete")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATUS","3");
		pd.put("AUDITOR_ID", this.getCurUser().getUserId());
		pd.put("AUDITOR_NAME", this.getCurUser().getUserName());
		agreementservicsService.delApply(pd);
		out.write("success");
		out.close();
	}
	/**
	 * 编辑页面
	 */
	@RequestMapping(value="/toeditObj")
	public ModelAndView toeditObj() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = agreementservicsService.findChangeApplyById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementchange/agreementchange_editObj");
		return mv;
	}
	/**
	 * 保存编辑
	 */
	@RequestMapping(value="/editObj")
	public ModelAndView editObj() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		agreementChangeService.edit(pd);	
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
}

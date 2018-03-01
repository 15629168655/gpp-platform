package com.tbyf.controller.gp.agreementapply;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAgreement;
import com.tbyf.entity.enums.EnumAgreementApply;
import com.tbyf.entity.enums.EnumAgreementType;
import com.tbyf.entity.enums.EnumTaskStatus;
import com.tbyf.entity.enums.EnumJobSource;
import com.tbyf.entity.enums.EnumJobType;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.agreementapply.AgreementManager;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.service.hm.yhry.YhryManager;
import com.tbyf.util.Constants;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 签约申请
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/agreementApply")
public class AgreementApplyController extends BaseController{
	
	//调用医护人员方法
	@Resource(name="yhryService")
	private YhryManager yhryService;
	@Resource(name="agreementService")
	private AgreementManager agreementService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	@Resource(name="providerService")
	private ProviderService providerService;
	
	@Resource(name="taskService")
	private TaskManager taskService;
	
	Integer UNTREATED = EnumTaskStatus.UNTREATED.getCode();//任务状态枚举，未处理
	Integer SYSTEM = EnumJobSource.SYSTEM.getCode();       //任务来源枚举，系统
	Integer AGREEMENT = EnumJobType.AGREEMENT.getCode();   //任务类型枚举，签约
	/**
	 * 列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumAgreementApply", EnumAgreementApply.toMap());
		pd.put("EnumAgreementType", EnumAgreementType.toMap());
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementapply/agreementapply_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"生成签约申请表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		String sqsj = pd.getString("GMT_CREATED");
		String sqrid = pd.getString("APPLICANT_ID");
		String sqrname = pd.getString("APPLICANT_NAME");
		String sqrphone = pd.getString("APPLICANT_PHONE");
		String ysid = pd.getString("GEN_PRACTITIONER_ID");
		String ysname = pd.getString("GEN_PRACTITIONER_NAME");
		String yscode = pd.getString("GEN_PRACTITIONER_CODE");
		String jgid = pd.getString("ORG_CODE");
		pd.put("ID", this.get32UUID());
		//获取签约医生的机构 区划代码
		User user = this.getCurrentUser();
		String region = user.getRegionCode();
		pd.put("ORG_CODE", jgid);
		pd.put("REGION_CODE", user.getRegionCode());
		pd.put("STATUS", "0");
		
		//发出签约申请同时生成任务
		PageData pd1 = new PageData();
		pd1 = this.getPageData();
		pd1.put("ID", this.get32UUID());
		pd1.put("JOB_NAME", "预约申请—"+sqrname);                                 	//任务名称
		pd1.put("JOB_CONTENT", sqrname+"在"+sqsj+"发起预签约申请，联系电话："+sqrphone);	//任务内容
		pd1.put("JOB_TYPE", AGREEMENT);	                                            //任务类型
		pd1.put("JOB_SOURCE", SYSTEM);	                                            //任务来源
		pd1.put("MEMBER_ID", sqrid);	                                            //申服务对象ID
		pd1.put("MEMBER_NAME", sqrname);	                                        //服务对象姓名
		pd1.put("STATUS",UNTREATED);                                                 //任务状态
		pd1.put("DOCTOR_ID", ysid);	                                                //执行医生ID
		pd1.put("DOCTOR_NAME", ysname);	                                            //执行医生姓名
		pd1.put("DOCTOR_CODE", yscode);                                             //执行医生CODE
		pd1.put("ORG_CODE", jgid);	                                                //执行医生姓名
		pd1.put("REGION_CODE", region);                                             //区划编码
		pd1.put("OPERATOR_ID", Constants.ADMIN_USER_ID);	                //操作人ID
		pd1.put("OPERATOR_NAME", Constants.ADMIN_NAME);	                                    //操作人姓名
		
		agreementService.save(pd);
		taskService.saveQy(pd1);
		mv.setViewName("gp/agreementapply/agreementapply_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	
	/**
	 * 获取居民信息列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/getJMXX")
	public ModelAndView getJMXX(Page page){
		
		Integer eaD = EnumAgreement.DELETE.getCode();//枚举，删除状态
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("STATE", eaD);
			page.setPd(pd);
			List<PageData>	jmxxList = jmxxService.listAlljmxx(page);			//居民列表
			mv.setViewName("gp/agreementapply/choose_jmxx_Data");
			mv.addObject("jmxxList", jmxxList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}

}

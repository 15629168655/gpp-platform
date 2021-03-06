package com.tbyf.controller.gp.agreementsevice;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.entity.enums.EnumAgreementService;
import com.tbyf.entity.enums.EnumAttachmentType;
import com.tbyf.entity.enums.EnumIsSign;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.system.User;
import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.agreementsevice.AgreementseviceManager;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.service.gp.servicePack.impl.ServicePackService;
import com.tbyf.service.gp.team.TeamManager; 
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.DateUtil;
import com.tbyf.util.FileDownload;
import com.tbyf.util.FileSizeFormatUtil;
import com.tbyf.util.FileUpload;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**
 * 签约管理-签约
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/agreementService")
public class AgreementseviceController extends BaseController{
		
	String menuUrl = "agreementService/list.do"; //菜单地址(权限用)
 
	@Resource(name="agreementserviceService")
	private AgreementseviceManager agreementservicsService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	@Resource(name="providerService")
	private ProviderService providerService;
	@Resource(name="teamService")
	private TeamManager teamService;
	
	@Value("${system.attachment.realDir}")
	String attachmentRealDir;
	@Value("${tomcat.attachmentDir.virtualDir}")
	String attachmentVirtualDir; 
	/**
	 * 服务包
	 */
	@Resource(name="servicePackService")
	private ServicePackService servicePackService;
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	Date date = new Date();  
    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //日期格式
  //上传文件类型
  	private Integer QYXY = EnumAttachmentType.QYXY.getCode();
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
		String id_card = pd.getString("ID_CARD");				//身份证检索条件
		if(null != id_card && !"".equals(id_card)){
			pd.put("ID_CARD", id_card.trim());
		}
		String mi_card = pd.getString("MI_CARD");				//医保卡检索条件
		if(null != mi_card && !"".equals(mi_card)){
			pd.put("MI_CARD", mi_card.trim());
		}
		String start = pd.getString("start");
		if(null != start && !"".equals(start)){
			pd.put("GMT_SIGNED", start.trim());
		}
		String end = pd.getString("end");
		if(null != end && !"".equals(end)){
			pd.put("GMT_SIGNED", end.trim());
		}
		String status = pd.getString("STATUS");					//状态检索条件
		if(null != status && !"".equals(status)){
			pd.put("STATUS", status.trim());
		}else{
			pd.put("STATUS", null);
		}
		User user = this.getCurrentUser();
		
		pd.put("orgId", user.getOrgCode());
		pd.put("enumService", EnumAgreementService.toMapNoDELETE());
		page.setPd(pd);
		/**
		 * 点击签约管理
		 * 分页显示签约信息
		 */
		List<PageData> varList = agreementservicsService.list(page);
		mv.setViewName("gp/agreementservice/agreementservice_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**
	 * 保存
	 * @param 
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(MultipartHttpServletRequest request, @RequestParam(value = "FILE", required = false) MultipartFile file) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String flag =  pd.getString("s");//签约状态
		pd.put("USER_AGENT_ID", request.getParameter("MEMBER_ID"));//居民ID
		if(null == flag){
			pd.put("IS_SIGN", EnumIsSign.NO.getCode());//签约状态改为已签约
			pd.put("STATUS", "0");//保存状态
		}else if(flag == "1" || flag.equals("1")){
			pd.put("IS_SIGN", EnumIsSign.YES.getCode());//签约状态改为已签约
			pd.put("STATUS", "1");
		}
		pd.put("ORG_CODE", this.getCurUser().getOrgCode());//机构编码
		pd.put("REGION_CODE", this.getCurrentUser().getRegionCode());//区划编码
		String id  = this.get32UUID();
		pd.put("ID",id);	//主键
		pd.put("APPLICANT_CODE", UUID.randomUUID().toString());//协议编码
		pd.put("GEN_PRACTITIONER_ID", this.getCurUser().getProviderId());//签约医生ID
		pd.put("GEN_PRACTITIONER_CODE", this.getCurUser().getProviderCode());//签约医生CODE
		pd.put("GEN_PRACTITIONER_NAME", this.getCurUser().getProviderName());//签约医生姓名
		pd.put("GEN_PRACTITIONER_PHONE", this.getCurUser().getTelecom());//签约医生电话
		//签约医生团队ID
		PageData param= new PageData();
		param.put("TEAM_MEMBER_ID", this.getCurUser().getProviderId());
		List<PageData> list =teamService.findByTeamMemberId(param);
		if(null !=list){
			pd.put("TEAM_ID", list.get(0).getString("TEAM_ID"));
			pd.put("GROUP_ID", list.get(0).getString("TEAM_ID"));
		}else{
			pd.put("GROUP_ID", ""); 
			pd.put("TEAM_ID", ""); 
		}
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, attachmentRealDir, uuid );
				String attachmentVirtualPath = attachmentVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID", uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", QYXY);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("FILE_URL", attachmentVirtualPath);
				pd.put("FILE_ID", uuid);
			}
		}else{
			pd.put("FILE_URL", "");
			pd.put("FILE_ID", "");
		}
		
		pd.put("AGREEMENT_NAME", request.getParameter("AGREEMENT_NAME"));
		String st = String.valueOf(request.getParameter("GMT_START"))+" "+DateUtil.DEFAULT_HMS_START;
		String et =String.valueOf(request.getParameter("GMT_END"))+" "+DateUtil.DEFAULT_HMS_END;
		pd.put("GMT_START", st);
		pd.put("GMT_END",et );
		pd.put("MEMBER_ID", request.getParameter("MEMBER_ID"));
		pd.put("MEMBER_NAME",request.getParameter("MEMBER_NAME"));
		pd.put("ID_CARD",request.getParameter("ID_CARD"));
		pd.put("MI_CARD",request.getParameter("MI_CARD"));
		pd.put("MEMBER_PHONE",request.getParameter("MEMBER_PHONE"));
		pd.put("ADDRESS",request.getParameter("ADDRESS"));
		pd.put("SERVICE_PACK", request.getParameter("SERVICE_PACK"));
		pd.put("GMT_SIGNED", request.getParameter("GMT_SIGNED"));//签约时间
		pd.put("OPERATOR_ID", this.getCurUser().getProviderId());//操作人ID 
		pd.put("OPERATOR_NAME", this.getCurUser().getProviderName()); //操作人姓名
		agreementservicsService.saveObj(pd);//保存签约
		//更新居民表的签约状态
		jmxxService.editJmxxSign(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT_QY", EnumStatus.ENABLE.getCode());			//枚举 ，状态--启用（只有启用状态下的服务包在签约的时候才可以选取）
		page.setPd(pd);
		List<PageData> varList = servicePackService.PackBM(page);
		pd.put("PACKList", varList);
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_add");
		mv.addObject("msg", "save");
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
		pd.put("ZT_QY", EnumStatus.ENABLE.getCode());
		page.setPd(pd);
		List<PageData> varList = servicePackService.PackBM(page);
		pd = agreementservicsService.findById(pd);
		pd.put("PACKList", varList);
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_view");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(MultipartHttpServletRequest request, @RequestParam(value = "FILE", required = false) MultipartFile file) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ID = request.getParameter("ID");
		String TEAM_ID = request.getParameter("TEAM_ID");
		pd.put("ID", ID);
		/**
		 * 修改居民信息、签约信息
		 * 点击鉴定
		 * 协议状态改为 签约
		 */
		String flag =  pd.getString("s");//签约状态
		if(null == flag){
			pd.put("STATUS", "1");
			pd.put("USER_AGENT_ID", request.getParameter("MEMBER_ID"));
			pd.put("IS_SIGN", EnumIsSign.YES.getCode());//签约状态改为已签约
			pd.put("GROUP_ID", TEAM_ID);
			jmxxService.editJmxxSign(pd);
		}else if(flag == "1" || flag.equals("1")){
			pd.put("USER_AGENT_ID", request.getParameter("MEMBER_ID"));
			pd.put("IS_SIGN", EnumIsSign.NO.getCode());//签约状态改为已签约
			pd.put("GROUP_ID", TEAM_ID);
			jmxxService.editJmxxSign(pd);
			pd.put("STATUS", "0");//保存状态
		}
		String start = request.getParameter("GMT_START");
		String end = request.getParameter("GMT_END");
		if(start.length()==10){
			start=start+" "+DateUtil.DEFAULT_HMS_START;
		}
		if(end.length()==10){
			end =end+" "+DateUtil.DEFAULT_HMS_END;
		}
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, attachmentRealDir, uuid );
				String attachmentVirtualPath = attachmentVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID", uuid);	//主键
				attachmentPd.put("BUSINESS_ID", ID);
				attachmentPd.put("TYPE", QYXY);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("FILE_URL", attachmentVirtualPath);
				pd.put("FILE_ID", uuid);
			}
		}else{
			pd.put("FILE_URL", "");
			pd.put("FILE_ID", "");
		}
		pd.put("GMT_START", start);
		pd.put("GMT_END",end);
		agreementservicsService.updateObject(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = agreementservicsService.findById(pd);	//根据ID读取
		/**
		 * 如果状态为签约
		 * 则无法编辑
		 */
		pd.put("ZT_QY", EnumStatus.ENABLE.getCode());			//枚举 ，状态--启用（只有启用状态下的服务包在签约的时候才可以选取）
		page.setPd(pd);
		List<PageData> varList = servicePackService.PackBM(page);
		pd.put("PACKList", varList);
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "delete")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		/**
		 * 只有协议为保存状态下
		 * 才能删除  逻辑删除
		 */
		pd.put("STATUS","9");
		agreementservicsService.editStatus(pd);
		out.write("success");
		out.close();
	}
	
		/**批量删除
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/deleteAll")
		@ResponseBody
		public Object deleteAll() throws Exception{
			logBefore(logger, Jurisdiction.getUsername()+"批量删除Yhry");
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
			PageData pd = new PageData();		
			Map<String,Object> map = new HashMap<String,Object>();
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				agreementservicsService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
			return AppUtil.returnObject(pd, map);
		}
	
	/**
	 * 通过居民身份证
	 * 获取居民信息显示
	 * @throws Exception 
	 */
	@RequestMapping(value="/idcardSearch")
	@ResponseBody
	public Object idcardSearch() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
			pd = this.getPageData();
			String id_card = pd.getString("ID_CARD");
			if(null != id_card && !"".equals(id_card)){
				pd.put("ID_NUMBER",id_card);
			}
			PageData jmxxpd = jmxxService.jmxxByIdcard(pd);
			if(jmxxpd != null){ 
				errInfo = "error";
			}
			map.put("MEMBER_NAME",jmxxpd.getString("USER_NAME"));
			map.put("MEMBER_PHONE",jmxxpd.getString("TELEPHONE"));
			map.put("MI_CARD",jmxxpd.getString("MI_CARD"));
			map.put("ADDRESS",jmxxpd.getString("ADDRESS"));
			map.put("MEMBER_ID", jmxxpd.getString("MEMBER_ID"));
			map.put("result", errInfo);				//返回结果
			
			return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 通过医保卡号
	 * 获取居民信息显示
	 * @throws Exception 
	 */
	@RequestMapping(value="/micardSearch")
	@ResponseBody
	public Object micardSearch() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
			pd = this.getPageData();
			String mi_card = pd.getString("MI_CARD");
			if(null != mi_card && !"".equals(mi_card)){
				pd.put("mi_card",mi_card);
			}
			PageData jmxxpd = jmxxService.jmxxByMi_card(pd);
			if(jmxxpd != null){
				errInfo = "error";
			}
			map.put("MEMBER_NAME",jmxxpd.getString("USER_NAME"));
			map.put("MEMBER_PHONE",jmxxpd.getString("TELEPHONE"));
			map.put("ID_CARD",jmxxpd.getString("ID_NUMBER"));
			map.put("ADDRESS",jmxxpd.getString("ADDRESS"));
			map.put("result", errInfo);				//返回结果
			return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**
	 * 解约
	 */
	@RequestMapping(value="/jieyue")
	public ModelAndView jieyue() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"解约");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_AGENT_ID",  pd.get("MEMBER_ID"));
		pd.put("IS_SIGN", EnumIsSign.NO.getCode());//签约状态改为已签约
		pd.put("GROUP_ID", "");
		jmxxService.editJmxxSign(pd);
		agreementservicsService.jieyue(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 解约页面
	 */
	@RequestMapping(value="/toJieYue")
	public ModelAndView toJieYue() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = agreementservicsService.findById(pd);	//根据ID读取
		/**
		 * 如果状态为解约
		 * 则无法编辑
		 */
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_jieyue");
		return mv;
	}
	/**
	 * 生成续约历史表
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "createRenew")
	public ModelAndView createRenew() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		pd = this.getPageData();
		pd = agreementservicsService.findById(pd);	//根据ID读取需要续约的信息
		/**
		 * 如果状态为签约
		 * 则无法编辑
		 */
		pd.put("ZT_QY", EnumStatus.ENABLE.getCode());			//枚举 ，状态--启用（只有启用状态下的服务包在签约的时候才可以选取）
		Page page = new Page();
		page.setPd(pd);
		List<PageData> varList = servicePackService.PackBM(page);
		pd.put("PACKList", varList);
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_renew");
		return mv;
	}
	
	/**
	 * 续约
	 */
	@RequestMapping(value="/renew")
	public ModelAndView renew(MultipartHttpServletRequest request, @RequestParam(value = "FILE", required = false) MultipartFile file) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"续约");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String id = request.getParameter("ID");
		//续约 上传新的协议。
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, attachmentRealDir, uuid );
				String attachmentVirtualPath = attachmentVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID", uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", QYXY);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("FILE_URL", attachmentVirtualPath);
				pd.put("FILE_ID", uuid);
			}
		} 
		pd.put("ID", id);
		PageData sevicePd = agreementservicsService.findById(pd);
		String start =request.getParameter("GMT_START")+" "+DateUtil.DEFAULT_HMS_START;;
		String end =request.getParameter("GMT_END")+" "+DateUtil.DEFAULT_HMS_END;;
		String signed = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String modify =request.getParameter("GMT_MODIFIED");
		String SERVICE_PACK = request.getParameter("SERVICE_PACK");
		
		pd.put("GMT_START", start);
		pd.put("GMT_END", end);
		pd.put("AGREEMENT_NAME", request.getParameter("AGREEMENT_NAME"));
		pd.put("MEMBER_PHONE", request.getParameter("MEMBER_PHONE"));
		pd.put("ADDRESS", request.getParameter("ADDRESS"));
		pd.put("GMT_SIGNED", signed);
		pd.put("SERVICE_PACK",SERVICE_PACK);
		pd.put("STATUS","1");//更改状态为签约
		agreementservicsService.edit(pd);
		//增加续约记录
		PageData renewPd = new PageData();
	    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //日期格式
		renewPd.put("ID", this.get32UUID());
		renewPd.put("AGREEMENT_NAME", sevicePd.getString("AGREEMENT_NAME"));
		renewPd.put("APPLICANT_CODE", sevicePd.getString("APPLICANT_CODE"));
		renewPd.put("TEAM_ID", sevicePd.getString("MEMBER_ID")==null?"":sevicePd.getString("TEAM_ID"));
		renewPd.put("GEN_PRACTITIONER_ID", sevicePd.getString("GEN_PRACTITIONER_ID"));
		renewPd.put("GEN_PRACTITIONER_NAME", sevicePd.getString("GEN_PRACTITIONER_NAME"));
		renewPd.put("GEN_PRACTITIONER_PHONE", sevicePd.getString("GEN_PRACTITIONER_PHONE"));
		renewPd.put("ORG_CODE",sevicePd.getString("ORG_CODE"));
		renewPd.put("REGION_CODE", sevicePd.getString("REGION_CODE"));
		renewPd.put("GMT_START",sdf.format(sevicePd.getObject("GMT_START")));
		renewPd.put("GMT_END",sdf.format(sevicePd.getObject("GMT_END"))); 
		renewPd.put("GMT_SIGNED",sdf.format(sevicePd.getObject("GMT_SIGNED")));
		renewPd.put("MEMBER_ID", sevicePd.getString("MEMBER_ID")==null?"":sevicePd.getString("MEMBER_ID"));
		renewPd.put("MEMBER_NAME", sevicePd.getString("MEMBER_NAME")==null?"":sevicePd.getString("MEMBER_NAME"));
		renewPd.put("MI_CARD", sevicePd.getString("MI_CARD")==null?"":sevicePd.getString("MI_CARD"));
		renewPd.put("ID_CARD", sevicePd.getString("ID_CARD"));
		renewPd.put("MEMBER_PHONE",  sevicePd.getString("MEMBER_PHONE")==null?"":sevicePd.getString("MEMBER_PHONE"));
		renewPd.put("ADDRESS", sevicePd.getString("ADDRESS")==null?"":sevicePd.getString("ADDRESS"));
		renewPd.put("FILE_URL",sevicePd.getString("FILE_URL")==null?"":sevicePd.getString("FILE_URL"));
		renewPd.put("FILE_ID",sevicePd.getString("FILE_ID")==null?"":sevicePd.getString("FILE_ID"));
		modify =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		renewPd.put("GMT_MODIFIED",modify);
		renewPd.put("SERVICE_PACK",sevicePd.getString("SERVICE_PACK"));
		pd.put("USER_AGENT_ID",  pd.get("MEMBER_ID"));
		pd.put("IS_SIGN", EnumIsSign.YES.getCode());//签约状态改为已签约
		pd.put("GROUP_ID", renewPd.get("TEAM_ID"));
		jmxxService.editJmxxSign(pd);
		agreementservicsService.renew(renewPd);  //新增续约历史表信息
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**
	 * 生成变更申请
	 */
	@RequestMapping(value="/tochange")
	public ModelAndView tochange() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"变更");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ID = pd.getString("ID");
		String start =pd.getString("GMT_START")+" "+DateUtil.DEFAULT_HMS_START;;
		String end =pd.getString("GMT_END")+" "+DateUtil.DEFAULT_HMS_END;;
		pd.put("GMT_START", start);
		pd.put("GMT_END", end);
		pd.put("STATUS",2);
		agreementservicsService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 变更申请页面
	 */
	@RequestMapping(value="/change")
	public ModelAndView change() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT_QY", EnumStatus.ENABLE.getCode());			//枚举 ，状态--启用（只有启用状态下的服务包在签约的时候才可以选取）
		Page page = new Page();
		page.setPd(pd);
		List<PageData> varList = servicePackService.PackBM(page);
		pd = agreementservicsService.findById(pd);	//根据ID读取
		pd.put("PACKList", varList);
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_change");
		return mv;
	}
	
	/**
	 * 转签保存
	 * 更新服务协议表
	 * 新增一条转签历史表信息
	 */
	@RequestMapping(value="/totransfer")
	public ModelAndView totransfer(){
		logBefore(logger, Jurisdiction.getUsername()+"转签");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		/**
		 * 获取当前操作人的信息
		 */
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				
		String name = user.getName();
		String username = user.getUserName();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String modify = pd.getString("GMT_MODIFIED");//修改时间
		/**
		 *通过ID查询转签之前的
		 *医生团队ID、签约医生ID、签约医生姓名、签约医生电话
		 */
		try {
			PageData servicepd = agreementservicsService.findById(pd);
			pd.put("STATUS",5);		//更新状态
			/**
			 * 更新服务协议表记录
			 * 录入转签原因、签约医生
			 * 新增转签历史表信息
			 */
			pd.put("GMT_SIGNED", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			agreementservicsService.updatetransfer(pd);
			PageData transferPd = new PageData();
			transferPd.put("ID",this.get32UUID());
			transferPd.put("AGREEMENT_ID",servicepd.getString("APPLICANT_CODE"));
			transferPd.put("TEAM_ID","xxxxxxxxxxxxxx");
//			transferPd.put("TEAM_ID",servicepd.getString("TEAM_ID"));			//旧签约医生团队
			transferPd.put("GEN_PRACTITIONER_ID",servicepd.getString("GEN_PRACTITIONER_ID"));		//旧签约医生ID
			transferPd.put("GEN_PRACTITIONER_NAME",servicepd.getString("GEN_PRACTITIONER_NAME"));	//旧签约医生姓名
			transferPd.put("GEN_PRACTITIONER_PHONE",servicepd.getString("GEN_PRACTITIONER_PHONE")); //旧签约医生电话
			transferPd.put("OPERATOR_ID",username);	//操作人姓名ID
			transferPd.put("OPERATOR_NAME",name);	//操作人姓名
			modify =sdf.format(date); 
			transferPd.put("GMT_TRANSFER",modify);	//操作时间
			transferPd.put("REMARK", pd.getString("REMARK")); //转签原因
			agreementservicsService.transfer(transferPd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 转签页面
	 */
	@RequestMapping(value="/transfer")
	public ModelAndView transfer() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = agreementservicsService.findById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		mv.setViewName("gp/agreementservice/agreementservice_transfer");
		return mv;
	}
	/**
	 * 获取居民信息列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/getJMXX")
	public ModelAndView getJMXX(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("STATE", 2);
			page.setPd(pd);
			List<PageData>	jmxxList = jmxxService.listAlljmxx(page);				//居民列表
			mv.setViewName("gp/agreementservice/jmxxData");
			mv.addObject("jmxxList", jmxxList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 签约医生列表
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
		mv.setViewName("gp/agreementservice/docData");
		return mv;
	}
	/**
	 * 下载附件协议
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getDocObj")
	@ResponseBody
	public Object getDocObj() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = providerService.queryDataById(pd);
		map.put("data", pd);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/downLoadFile")
	public void downLoadFile(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"下载附件");
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData servicepd = agreementservicsService.findById(pd);
		String ATTACHMENT_ID = servicepd.getString("FILE_URL");
		pd.put("ATTACHMENT_ID", ATTACHMENT_ID);
		PageData attahmentPd = attachmentService.findById(pd);
		String fileName = attahmentPd.getString("NAME");
		String fileContentType = attahmentPd.getString("CONTENTTYPE");
		String extName = fileName.substring(fileName.lastIndexOf("."));
		String realPath = attachmentRealDir + ATTACHMENT_ID+extName;
//		File file = new File(realPath);
		fileName=ATTACHMENT_ID+extName;
		FileDownload.fileDownload(response, realPath, fileName);
	}
	
}

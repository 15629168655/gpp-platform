package com.tbyf.controller.gp.xywh;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAttachmentType;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.xywh.XywhManager;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.FileSizeFormatUtil;
import com.tbyf.util.FileUpload;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**
 * 协议信息
 * @author lizk
 *2016-09-12
 */
@Controller
@RequestMapping(value="/xywh")
public class XywhController extends BaseController {
	
	
	String menuUrl = "xywh/listXywh.do"; //菜单地址(权限用)
	@Resource(name="xywhService")
	private XywhManager xywhService;
	
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	
	@Value("${system.attachment.realDir}")
	String attachmentRealDir;
	@Value("${tomcat.attachmentDir.virtualDir}")
	String attachmentVirtualDir;
	
	Integer eaS = EnumStatus.SAVE.getCode();  //枚举，保存状态
	Integer eaE = EnumStatus.ENABLE.getCode();//枚举，启用状态
	Integer eaT = EnumStatus.DISABLE.getCode();//枚举，停用状态
	Integer eaD = EnumStatus.DELETE.getCode();//枚举，删除状态
	
	  //上传文件类型
  	private Integer XYWH = EnumAttachmentType.XYWH.getCode();
  	
	/**显示协议信息列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listXywh")
	public ModelAndView listJxmm(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("status", eaD);
			pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构ID
			page.setPd(pd);
			List<PageData>	xywhList = xywhService.listAllxyxx(page);   //协议信息
			pd.put("EnumStatus", EnumStatus.toMap());
			mv.setViewName("gp/xywh/xywh_list");
			mv.addObject("xywhList", xywhList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**去新增协议页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAddXywh")
	public ModelAndView goAddXywh() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/xywh/xywh_add");
		mv.addObject("msg", "saveXywh");
		return mv;
	}
	
	/**保存协议信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveXywh")
	public ModelAndView saveXywh(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增协议信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		String agreement_name = request.getParameter("AGREEMENT_NAME");    //协议名称
		String versions = request.getParameter("VERSIONS");				   //历史版本
		if(null != request.getParameter("APPLICANT_CONTENT") && !"".equals(request.getParameter("APPLICANT_CONTENT"))){			
			byte[] APPLICANT_CONTENT = request.getParameter("APPLICANT_CONTENT").getBytes();//将blob类型转换
			pd.put("APPLICANT_CONTENT", APPLICANT_CONTENT);//协议内容
		}
		pd.put("AGREEMENT_NAME", agreement_name);
		pd.put("VERSIONS", versions);
		pd.put("ID", id);
		pd.put("STATUS", eaS);
		pd.put("ORG_CODE", getCurUser().getOrgCode()); //机构编码
		pd.put("OPERATOR_ID", getCurUser().getProviderId());//TODO 操作人ID （不确定，待处理）
		pd.put("OPERATOR_NAME", getCurUser().getProviderName());//TODO 操作人 （不确定，待处理）
		xywhService.saveXywh(pd);
		
		if(attachments != null && attachments.length > 0){
			uploadAttachments(attachments, id);
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEditXywh")
	@ResponseBody
	public ModelAndView goEditXywh(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData pd1 = xywhService.findById(pd);					//根据ID读取
			Object APPLICANT_CONTENT = pd1.get("APPLICANT_CONTENT");
			String str = null;  
	        byte[] inbyte=null;  
	        if(APPLICANT_CONTENT instanceof Blob){  
	            Blob blob = (Blob) APPLICANT_CONTENT;  
	            if (blob != null) {  
	                inbyte = blob.getBytes(1, (int) blob.length());  
	            }  
	            str =new String (inbyte);  
	        }  
	     //  return str;  
		//	System.out.println(str+"AAAAAAAAAA");
	        pd1.put("APPLICANT_CONTENT", str);//将blob类型转换，在页面显示
			List<PageData> listPd = attachmentService.findByBusinessID(pd);
			mv.addObject("listPd", listPd);
			mv.setViewName("gp/xywh/xywh_add");
			mv.addObject("msg", "editXywh");
			mv.addObject("pd", pd1);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改协议信息
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editXywh")
	public ModelAndView edit(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改协议信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String id = request.getParameter("ID");
		String agreement_name = request.getParameter("AGREEMENT_NAME");    //协议名称
		String versions = request.getParameter("VERSIONS");				   //历史版本
		byte[] APPLICANT_CONTENT = request.getParameter("APPLICANT_CONTENT").getBytes();//将blob类型转换
		pd.put("APPLICANT_CONTENT", APPLICANT_CONTENT);//协议内容
		pd.put("ID", id);
		pd.put("AGREEMENT_NAME", agreement_name);
		pd.put("VERSIONS", versions);
		pd.put("ORG_CODE", getCurUser().getOrgCode()); //机构编码
		pd.put("OPERATOR_ID", getCurUser().getProviderId());//TODO 操作人ID （不确定，待处理）
		pd.put("OPERATOR_NAME", getCurUser().getProviderName());//TODO 操作人 （不确定，待处理）
		xywhService.editXywh(pd);						//更新协议表
		
		if(attachments != null && attachments.length > 0){  //上传新的附件
			uploadAttachments(attachments, id);
		}
		
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**启用协议
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/goqy")
	public void goqy(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"启用协议");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATUS", eaE);		//启用状态
		xywhService.qyXywh(pd);
		out.write("success");
		out.close();
	}
	
	/**停用协议
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/goty")
	public void goty(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"停用协议");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATUS", eaT);		//停用用状态
		xywhService.qyXywh(pd);
		out.write("success");
		out.close();
	}
	
	/**删除协议信息
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteXywh")
	public void deleteJmxx(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除协议信息");
		PageData pd = new PageData();
		pd = this.getPageData();
//		PageData pd1 = xywhService.findById(pd);					//根据ID查询状态是否为保存状态（只有状态为保存状态才能删除）
//		Object status = pd1.get("STATUS");
//		if(status.equals("0")){
			pd.put("STATUS", eaD);
			xywhService.deleteXywh(pd);
//			out.write("success");
//		} else {
//			out.write("error");
//		}
		
		out.close();
	}
	
	/**批量删除协议信息
	 * @return
	 */
	/**
	@RequestMapping(value="/deleteAllXywh")
	@ResponseBody
	public Object deleteAllJmxx() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除用户信息");
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		PageData pd = this.getPageData();	
		PageData resultPd = new PageData();
		String ids = pd.getString("ids");	
		String canDelIds = "";									//定义可以删除的id
		String unDelIds = "";									//不能删除的id
		
		try {
			String idsArray[] = ids.split(",");
			resultPd = xywhService.findByIdArray(idsArray);			//查询可以删除协议的id(只有保存状态的协议才能删除)
			if(resultPd != null){
				canDelIds = resultPd.get("DELIDS").toString();
				String delIDsArray[] = canDelIds.split(",");
				xywhService.deleteAllXywh(delIDsArray);					//删除
				
				for (String id : idsArray) {
					if(canDelIds.indexOf(id) == -1){
						unDelIds += id+",";
					}
				}
				
			}else{
				unDelIds = ids;
			}
			
			if(unDelIds!=""){
				String unDelIDsArray[] = unDelIds.split(",");
				pd = xywhService.findByIdForName(unDelIDsArray);		//查询不以删除协议的'协议名称'(只有保存状态的协议才能删除)，在前台做出提示
				pd.put("msg", "no");
			}else{
				pd.put("msg", "ok");
			}
			
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	*/
	
	/**
	 * 上传附件
	 * @param attachments
	 * @param businessid
	 * @throws Exception
	 */
	public void uploadAttachments (MultipartFile[] attachments,String id) throws Exception{
		for(int i = 0;i<attachments.length;i++){
			MultipartFile attachment = attachments[i];
			if(!attachment.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(attachment, attachmentRealDir, uuid );
				String attachmentVirtualPath = attachmentVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID", uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", XYWH);
				attachmentPd.put("NAME", attachment.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(attachment.getSize()));
				attachmentPd.put("CONTENTTYPE", attachment.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
			}
		}
	}

}

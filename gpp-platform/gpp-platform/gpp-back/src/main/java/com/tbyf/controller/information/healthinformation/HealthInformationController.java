package com.tbyf.controller.information.healthinformation;

import java.io.BufferedReader;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAttachmentType;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.enums.EnumHealthType;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.healthinformation.HealthInformationManager;
import com.tbyf.service.information.healthinformation.HealthInformationTypeManager;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.Const;
import com.tbyf.util.FileDownload;
import com.tbyf.util.FileSizeFormatUtil;
import com.tbyf.util.FileUpload;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**
 * 健康资讯
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/healthinformation")
public class HealthInformationController extends BaseController{
		
	@Resource(name="healthService")
	private HealthInformationManager healthService;
	@Resource(name="healthTypeService")
	private HealthInformationTypeManager healthTypeService;
	@Value("${system.photo.realDir}")
	String photoRealDir;
	@Value("${tomcat.photo.virtualDir}")
	String photoVirtualDir; 
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;  
	//上传文件类型
  	private Integer XWZX = EnumAttachmentType.XWZX.getCode();
	
	/**
	 * 信息管理-健康资讯
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
		String keywords = pd.getString("keywords");
			pd.put("keywords", keywords);
		String createdStart = pd.getString("start_time");	//开始时间
		String createdEnd = pd.getString("end_time");		//结束时间
		if(createdStart != null && !"".equals(createdStart)){
			pd.put("start_time", createdStart.trim());
		}
		if(createdEnd != null && !"".equals(createdEnd)){
			pd.put("end_time", createdEnd.trim());
		} 
		pd.put("TYPESTATUS", EnumStatus.ENABLE.getCode());
		List<PageData> TYPEList= healthTypeService.typeSelect(pd);
		pd.put("TYPEList", TYPEList);//类型
		pd.put("EnumStatus", EnumStatus.toMap()); //状态（0：保存；1：启用；2：停用；9：删除）
		page.setPd(pd);
		List<PageData> varList = healthService.list(page); // 列出健康资讯列表
		mv.setViewName("information/healthinformation/health_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 后天发布资讯
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(MultipartHttpServletRequest request, @RequestParam(value = "FILE", required = false) MultipartFile file) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String id = this.get32UUID();
		pd.put("ID", id);					//主键
		pd.put("SJ", df.format(new Date()));	//开始时间
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				
		pd.put("FBR", user.getName());			//获取登录人姓名
		pd.put("MC", request.getParameter("MC"));
		pd.put("TYPE", request.getParameter("TYPE"));
		pd.put("STATE", request.getParameter("STATE"));
		pd.put("LY", request.getParameter("LY"));
		pd.put("LLL", 0);
		String remark = request.getParameter("REMARK");  
		pd.put("REMARK", remark);
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, photoRealDir, uuid );
				String attachmentVirtualPath = photoVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID",  uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", XWZX);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("IMAGE_URL", attachmentVirtualPath);
				pd.put("IMAGE_ID", uuid);
			}
		}else{
			pd.put("IMAGE_URL", "");
			pd.put("IMAGE_ID", "");
		}
		healthService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 发布资讯页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd.put("TYPESTATUS", EnumStatus.ENABLE.getCode());
		page.setPd(pd);
		List<PageData> TYPEList= healthTypeService.typeSelect(pd);
		pd.put("TYPEList", TYPEList);
		pd.put("FBR", user.getName());			//获取登录人姓名
		pd.put("SJ", df.format(new Date()));	//时间
		pd.put("EnumStatus", EnumStatus.toMap()); //状态（0：保存；1：启用；2：停用；9：删除）
		mv.addObject("pd", pd);
		mv.setViewName("information/healthinformation/health_add");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(MultipartHttpServletRequest request, @RequestParam(value = "FILE", required = false) MultipartFile file) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", request.getParameter("ID"));
		pd.put("MC", request.getParameter("MC"));
		pd.put("TYPE", request.getParameter("TYPE"));
		pd.put("STATE", request.getParameter("STATE"));
		pd.put("LY", request.getParameter("LY"));
		
		String remark = request.getParameter("REMARK");
		pd.put("REMARK", remark);
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, photoRealDir, uuid );
				String attachmentVirtualPath = photoVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID",  uuid);	//主键
				attachmentPd.put("BUSINESS_ID", request.getParameter("ID"));
				attachmentPd.put("TYPE", XWZX);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("IMAGE_URL", attachmentVirtualPath);
				pd.put("IMAGE_ID", uuid);
			}
		}else{
			pd.put("IMAGE_URL", "");
			pd.put("IMAGE_ID", "");
		}
		
		healthService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = healthService.findById(pd);	//根据ID读取
		Object REMARK = pd.get("REMARK");
		String str = null;  
        if(REMARK instanceof Clob){  //Clob转换为String
        	Clob clob = (Clob) REMARK;  
            if (clob != null) {  
               Reader read = clob.getCharacterStream();
               BufferedReader br = new BufferedReader(read);
               String s = br.readLine();
               StringBuffer sb = new StringBuffer();
               while(s!=null){
            	   sb.append(s);
            	   s=br.readLine();
               }
               str = sb.toString();
            }  
        }  
        pd.put("REMARK", str);//将blob类型转换，在页面显示
        pd.put("TYPESTATUS", EnumStatus.ENABLE.getCode());
		List<PageData> TYPEList= healthTypeService.typeSelect(pd);
		pd.put("TYPEList", TYPEList);//类型
		pd.put("EnumStatus", EnumStatus.toMap()); //状态（0：保存；1：启用；2：停用；9：删除）
		mv.addObject("pd", pd);

		mv.setViewName("information/healthinformation/health_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
	
}

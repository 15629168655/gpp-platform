package com.tbyf.controller.information.gggl;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAttachmentType;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.gggl.GgglManager;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.Const;
import com.tbyf.util.DateUtil;
import com.tbyf.util.DelAllFile;
import com.tbyf.util.FileSizeFormatUtil;
import com.tbyf.util.FileUpload;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.PathUtil;
import com.tbyf.util.Tools;
	

/**
 * 广告管理
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/gggl")
public class GgglController extends BaseController{
	
	
	@Resource(name="ggglService")
	private GgglManager ggglService;

	@Value("${system.photo.realDir}")
	String photoRealDir;
	@Value("${tomcat.photo.virtualDir}")
	String photoVirtualDir; 
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;  
	//上传文件类型
  	private Integer GGGL = EnumAttachmentType.GGGL.getCode();
	
		
	/**
	 * 广告管理列表
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
		String createdStart = pd.getString("start_time");	//开始时间
		String createdEnd = pd.getString("end_time");		//结束时间
		if(createdStart != null && !"".equals(createdStart)){
			pd.put("start_time", createdStart.trim());
		}
		if(createdEnd != null && !"".equals(createdEnd)){
			pd.put("end_time", createdEnd.trim());
		} 
		page.setPd(pd);
		List<PageData> varList = ggglService.list(page); // 列出广告列表
		mv.setViewName("information/gggl/gggl_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(MultipartHttpServletRequest request, @RequestParam(value = "FILE", required = false) MultipartFile file) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		pd.put("ID", id);					//主键
		pd.put("DJS", 0);
		pd.put("MC",request.getParameter("MC"));
		pd.put("GG_TYPE",request.getParameter("GG_TYPE"));
		pd.put("URL",request.getParameter("URL"));
		pd.put("START_TIME",request.getParameter("START_TIME"));
		pd.put("END_TIME",request.getParameter("END_TIME"));
		pd.put("QY",request.getParameter("QY"));
		pd.put("PX",request.getParameter("PX"));
		pd.put("CREATE_TIME", DateUtil.getTime());
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, photoRealDir, uuid );
				String attachmentVirtualPath = photoVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID",  uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", GGGL);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("IMG_URL", attachmentVirtualPath);
				pd.put("IMG", uuid);
			}
		}else{
			pd.put("IMG_URL", "");
			pd.put("IMG", "");
		}
		ggglService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		pd.put("START_TIME", df.format(new Date()));	//开始时间
//		pd.put("END_TIME", df.format(new Date()));		//结束时间
		mv.addObject("pd", pd);
		mv.setViewName("information/gggl/gggl_edit");
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
		String id = request.getParameter("ID");
		String mc = pd.getString("MC");
		pd = this.getPageData();
		//文件上传路径，保存到服务器项目下。
		if(file.getSize() !=0 ){
			if(!file.isEmpty()){
				String uuid = this.get32UUID();
				String realName = FileUpload.fileUp(file, photoRealDir, uuid );
				String attachmentVirtualPath = photoVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID",  uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", GGGL);
				attachmentPd.put("NAME", file.getOriginalFilename());
				attachmentPd.put("PATH", attachmentVirtualPath);
				attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
				attachmentPd.put("CONTENTTYPE", file.getContentType());
				attachmentPd.put("OPERATER", this.getCurUser().getUserId());	//上传人
				attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
				attachmentService.save(attachmentPd);
				pd.put("IMG_URL", attachmentVirtualPath);
				pd.put("IMG", uuid);
			}
		}else{
			pd.put("IMG_URL", "");
			pd.put("IMG", "");
		}

		pd.put("ID",request.getParameter("ID"));
		pd.put("MC",request.getParameter("MC"));
		pd.put("GG_TYPE",request.getParameter("GG_TYPE"));
		pd.put("URL",request.getParameter("URL"));
		pd.put("START_TIME",request.getParameter("START_TIME"));
		pd.put("END_TIME",request.getParameter("END_TIME"));
		pd.put("QY",request.getParameter("QY"));
		pd.put("PX",request.getParameter("PX"));
		ggglService.edit(pd);
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
		pd = ggglService.findById(pd);	//根据ID读取
		mv.addObject("pd", pd);
		mv.setViewName("information/gggl/gggl_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		PageData pd = new PageData();
		pd = this.getPageData();
		ggglService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**删除图片
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deltp")
	public void deltp(PrintWriter out) throws Exception {
		logBefore(logger, "删除图片");
		PageData pd = new PageData();
		pd = this.getPageData();
//		String PATH = pd.getString("URL");													 		//图片路径
//		DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("URL")); 	//删除图片
//		if(PATH != null){
			ggglService.delTp(pd);																//删除数据库中图片数据
//		}	
		out.write("success");
		out.close();
	}
}

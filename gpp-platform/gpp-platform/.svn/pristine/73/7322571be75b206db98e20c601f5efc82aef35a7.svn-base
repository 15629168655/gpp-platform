package com.tbyf.controller.system.attachment;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.tbyf.plugin.Page;
import com.tbyf.util.*;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.system.attachment.AttachmentManager;

/** 
 * 说明：附件上传
 * 创建人：
 * 创建时间：2016-06-24
 */
@Controller
@RequestMapping(value="/attachment")
public class AttachmentController extends BaseController {
	
	String menuUrl = "attachment/list.do"; //菜单地址(权限用)
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;

	@Value("${system.attachment.realDir}")
	String attachmentRealDir;
	@Value("${system.photo.realDir}")
	String photoRealDir;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Attachment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ATTACHMENT_ID", this.get32UUID());	//主键
		pd.put("OPERATER", "");	//上传人
		pd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
		attachmentService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Attachment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData attahmentPd = attachmentService.findById(pd);
		String fileName = attahmentPd.getString("NAME");
		String extName = fileName.substring(fileName.lastIndexOf("."));
		String realPath = attachmentRealDir + attahmentPd.getString("ATTACHMENT_ID") +"_"+ attahmentPd.getString("BUSINESS_ID")+extName;
		File file = new File(realPath);
		if(file.exists()){
			file.delete();
		}else {
			logBefore(logger, Jurisdiction.getUsername()+"删除时找不到附件["+realPath+"]");
		}
		file.deleteOnExit();
		attachmentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Attachment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		attachmentService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Attachment");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = attachmentService.list(page);	//列出Attachment列表
		mv.setViewName("SYS/attachment/attachment_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("SYS/attachment/attachment_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = attachmentService.findById(pd);	//根据ID读取
		mv.setViewName("SYS/attachment/attachment_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Attachment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			attachmentService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Attachment到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("业务Id");	//1
		titles.add("附件类型");	//2
		titles.add("附件名称");	//3
		titles.add("附件地址");	//4
		titles.add("附件大小");	//5
		titles.add("上传人");	//6
		titles.add("上传时间");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = attachmentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("BUSINESS_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("TYPE"));	//2
			vpd.put("var3", varOList.get(i).getString("NAME"));	//3
			vpd.put("var4", varOList.get(i).getString("PATH"));	//4
			vpd.put("var5", varOList.get(i).getString("SIZE"));	//5
			vpd.put("var6", varOList.get(i).getString("OPERATER"));	//6
			vpd.put("var7", varOList.get(i).getString("OPERATEDATE"));	//7
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}

	@RequestMapping(value = "/download")
	public void downloadAttachment(HttpServletResponse response) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData attahmentPd = attachmentService.findById(pd);
		String fileName = attahmentPd.getString("NAME");
		String fileContentType = attahmentPd.getString("CONTENTTYPE");
		String extName = fileName.substring(fileName.lastIndexOf("."));
		String path = attahmentPd.getString("PATH");
		if(path.indexOf("photoDir")!=-1){
			String realPath = photoRealDir + attahmentPd.getString("ATTACHMENT_ID")+extName;
			fileName=attahmentPd.getString("ATTACHMENT_ID")+extName;
			FileDownload.fileDownload(response, realPath, fileName);
		}else{
			String realPath = attachmentRealDir + attahmentPd.getString("ATTACHMENT_ID")+extName;
			fileName=attahmentPd.getString("ATTACHMENT_ID")+extName;
			FileDownload.fileDownload(response, realPath, fileName);
		}
		
//		File file = new File(realPath);
//		if(file.exists()){
//			FileInputStream fis =new FileInputStream(file);
//			OutputStream os = response.getOutputStream();
//			try {
//				response.setContentType(fileContentType);
//				response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("GBK"), "ISO-8859-1"));
//				byte[] buffer =new byte[1024];
//				int count;
//				while ((count = fis.read(buffer)) != -1) {
//					os.write(buffer, 0, count);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				os.flush();
//				os.close();
//				fis.close();
//			}
//		}else {
//			logBefore(logger, Jurisdiction.getUsername()+"下载时找不到附件["+realPath+"]");
//		}
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

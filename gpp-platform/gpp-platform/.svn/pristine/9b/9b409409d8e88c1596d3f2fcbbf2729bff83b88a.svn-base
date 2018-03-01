package com.tbyf.controller.app.appgrdzbl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAttachmentType;
import com.tbyf.entity.enums.EnumSfjlZT;
import com.tbyf.service.information.grdzbl.GrdzblManager;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.DateUtil;
import com.tbyf.util.FileSizeFormatUtil;
import com.tbyf.util.FileUpload;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

@Controller
@RequestMapping(value="/appGrdzbl")
public class IntGrdzblController extends BaseController{
	
	
	@Resource(name="gedzblService")
	private GrdzblManager gedzblService;
	
	@Value("${system.photo.realDir}")
	String attachmentRealDir;
	@Value("${tomcat.photo.virtualDir}")
	String attachmentVirtualDir;

	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	//上传文件类型
	private Integer JMTJ = EnumAttachmentType.JMTJ.getCode();
	 /**
     * app录入电子病历
     * @return
     */
    @RequestMapping(value="/saveGrdzblApp", method = RequestMethod.POST)
    @ResponseBody
    public Object saveGmPatientApp()
    {
        logBefore(logger, "app录入个人电子病历");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        String message = "";
        try{
        	pd = this.getPageData();
	        if(Tools.checkKey("TYPE", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("saveGrdzblApp", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());
	        	   pd.put("TJSJ", DateUtil.getTime());//提交时间
	        	   if(pd.containsKey("TP")&& !pd.get("TP").equals("")){
            		   PageData attpd = new PageData();
            		   attpd.put("ATTACHMENT_ID", pd.get("TP"));
            		   PageData attahmentPd = attachmentService.findById(attpd);
            		   pd.put("TP_URL", attahmentPd.get("PATH"));
            	   }else{
            		   pd.put("TP", "");
            		   pd.put("TP_URL", "");
            	   }
	        	   gedzblService.save(pd);
	               result = "01";
	               message = ResultMessageUtil.MESSAGE_1;
	           }else {
	               result = "03";
	               message = ResultMessageUtil.MESSAGE_3;
	           }
	        }else{
				result = "05";
	            message = ResultMessageUtil.MESSAGE_5;
	        }
        }catch (Exception e){
            message = ResultMessageUtil.MESSAGE_0;
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", "message");
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * 居民查询自己提交的电子病历接口
     * @return
     */
	@RequestMapping(value="/getGrdzblList",method = RequestMethod.GET)
	@ResponseBody
	public Object getGrdzblList(){
		logBefore(logger, "居民查询自己提交的电子病历列表接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message="";
		try{
			if(Tools.checkKey("TYPE", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("myGrdzbl", pd)){	//检查参数
					int pageSize=1;//页码
	        		int pageCount=10;//页数
	               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	               	}else{
	               		pd.put("pageStart", (pageSize-1)* pageCount+1);
	               		pd.put("pageEnd", pageSize * pageCount);
	               	}
	               	
					List<PageData> list = gedzblService.queryPageForApp(pd);
					map.put("pd",list);
					result ="01";
					message = ResultMessageUtil.MESSAGE_1;
				}else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			}else{
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		}catch (Exception e){
			message  = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
    
    /**
     * 居民查询自己提交的电子病历接口
     * @return
     */
//	 @RequestMapping(value="/getGrdzbl" , method = RequestMethod.GET)
	 @RequestMapping(value="/getGrdzbl")
	@ResponseBody
	public Object getGrdzbl(){
		logBefore(logger, "居民查询自己提交的电子病历接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message="";
		try{
			if(Tools.checkKey("TJRID", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("myGrdzbl", pd)){	//检查参数
					pd = gedzblService.findByTjrId(pd);
					map.put("pd", pd);
					if(pd==null){
						result = "02";
						message = ResultMessageUtil.MESSAGE_2;
					}else{
						result ="01";
						message = ResultMessageUtil.MESSAGE_1;
					}
				}else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			}else{
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
			message = ResultMessageUtil.MESSAGE_0;
		}finally{
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	 
	 /**
     * app删除个人电子病历
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appDelete", method = RequestMethod.GET)
    @ResponseBody
    public Object appDelete()
    {
        logBefore(logger, "APP删除个人电子病历");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		gedzblService.delete(pd);
	        		result = "01";
	        		message = ResultMessageUtil.MESSAGE_1;
	        	}else{
	        		result = "03";
	        		message = ResultMessageUtil.MESSAGE_3;
	        	}
        	}else{
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
            message = ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    } 
	 
	@RequestMapping(value = "/uploadImage")
	@ResponseBody
	public Object upFile(MultipartHttpServletRequest request,
			@RequestParam(value = "FILE", required = false) MultipartFile file)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String result ="00";
		String message ="";
		try {
			if(Tools.checkKey("FILE", request.getParameter("FKEY"))){	//检验请求key值是否合法  
				//文件上传路径，保存到服务器项目下。
				if(file.getSize() !=0 ){
					if(!file.isEmpty()){
						String uuid = this.get32UUID();
						String realName = FileUpload.fileUp(file, attachmentRealDir, uuid );
						String attachmentVirtualPath = attachmentVirtualDir + realName;
	
						PageData attachmentPd = new PageData();
						attachmentPd.put("ATTACHMENT_ID", uuid);	//主键
						attachmentPd.put("BUSINESS_ID", "");
						attachmentPd.put("TYPE", JMTJ);
						attachmentPd.put("NAME", file.getOriginalFilename());
						attachmentPd.put("PATH", attachmentVirtualPath);
						attachmentPd.put("SIZE", FileSizeFormatUtil.formatFileSize(file.getSize()));
						attachmentPd.put("CONTENTTYPE", file.getContentType());
						attachmentPd.put("OPERATER", request.getParameter("PERSON_ID"));	//上传人
						attachmentPd.put("OPERATEDATE", Tools.date2Str(new Date()));	//上传时间
						attachmentService.save(attachmentPd);
						PageData pd = new PageData();
						pd.put("FILE_ID", uuid);
						pd.put("FILE_URL", attachmentVirtualPath);
						map.put("pd", pd);
						result="01";
						message = ResultMessageUtil.MESSAGE_1;
					}else{
						result="00";
						message = ResultMessageUtil.MESSAGE_0;
					}
				} else { 
					result="00";
					message = ResultMessageUtil.MESSAGE_0;
				}
			}else{
				 result = "05";
					message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			message = ResultMessageUtil.MESSAGE_0;
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
}

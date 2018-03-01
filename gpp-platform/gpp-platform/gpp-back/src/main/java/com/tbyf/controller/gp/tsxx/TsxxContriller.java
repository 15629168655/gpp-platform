package com.tbyf.controller.gp.tsxx;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.tbyf.entity.enums.EnumTsxxJmbq;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.tsxx.TsxxManager;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.FileSizeFormatUtil;
import com.tbyf.util.FileUpload;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**
 * 健康宣教--推送消息
 * @author lizk
 *2017-02-22
 */
@Controller
@RequestMapping(value="/tsxx")
public class TsxxContriller extends BaseController {

	String menuUrl = "xywh/listXywh.do"; //菜单地址(权限用)
	@Resource(name="tsxxService")
	private TsxxManager tsxxService;
	
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	
	@Value("${system.photo.realDir}")
	String photoRealDir;
	@Value("${tomcat.photo.virtualDir}")
	String photoVirtualDir;
	
	/**显示协议信息列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	list = tsxxService.list(page);
			mv.setViewName("gp/tsxx/tsxx_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 获取枚举中的key可value
	 */
	@RequestMapping(value="/queryData")
    @ResponseBody
    public Object queryData()
    {
        logBefore(logger, "获取枚举中的key可value");
        Map<String,Object> data = new HashMap<String, Object>();	
        List<Integer> key = EnumTsxxJmbq.getKey();
		List<String> value = EnumTsxxJmbq.getValue();
		data.put("key", key);
		data.put("value", value);
        return AppUtil.returnObject(new PageData(), data);
    }
	
	/**去新增页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/tsxx/tsxx_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存新增信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveXywh(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增推送信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		String MC = request.getParameter("MC");     //名称
		String NR = request.getParameter("NR");		//内容
		if(null != request.getParameterValues("JMBQ") && !"".equals(request.getParameterValues("JMBQ"))){			
			String[] bq = request.getParameterValues("JMBQ");	//居民标签
			String JMBQ = "";
			for(String a : bq){
				JMBQ += a+",";
			}
			pd.put("JMBQ", JMBQ);
		}
		pd.put("MC", MC);
		pd.put("NR", NR);
		pd.put("ID", id);
		pd.put("LLL", "0");//浏览量
		pd.put("DZL", "0");//点赞量
		pd.put("OPERATOR_NAME", getCurUser().getProviderName());// 操作人
		tsxxService.save(pd);
		
		if(attachments != null && attachments.length > 0){
			uploadAttachments(attachments, id);
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去查看详情页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toSee")
	public ModelAndView toSee() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pd1 = new PageData();
		pd = this.getPageData();
		pd1 = this.getPageData();
		String jmbqs = "";//居民标签
		try {
			int LLL = Integer.parseInt(pd.getString("LLL"))+1;
			pd = tsxxService.findById(pd);				//根据ID读取
			List<String> value = EnumTsxxJmbq.getValue();
			if(null != pd.getString("JMBQ") && !"".equals(pd.getString("JMBQ"))){		
				String BMBQ[] = pd.getString("JMBQ").split(",");
				for (String i : BMBQ) {
					int j = Integer.parseInt(i);
					jmbqs += value.get(j-1)+",";
					pd.put("JMBQ", jmbqs);
				}
			}
			List<PageData> listPd = attachmentService.findByBusinessID(pd);
			mv.addObject("listPd", listPd);
			mv.setViewName("gp/tsxx/tsxx_toSee");
			mv.addObject("pd", pd);
//			pd1.put("ID", pd.getString("ID"));
			pd1.put("LLL", LLL);//每次查看浏览量+1
			tsxxService.updateLLL(pd1);//每次查看时浏览量+1
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**点赞
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/dianZ")
	public ModelAndView dianZ() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		int DZL = Integer.parseInt(pd.getString("DZL"))+1;
		pd.put("DZL", DZL);//点赞量+1
		tsxxService.updateDZL(pd);
		return new ModelAndView("redirect:/tsxx/list?success=success"); //添加成功刷新
	}
	
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
				String realName = FileUpload.fileUp(attachment, photoRealDir, uuid + "_" + id);
				String attachmentVirtualPath = photoVirtualDir + realName;

				PageData attachmentPd = new PageData();
				attachmentPd.put("ATTACHMENT_ID", uuid);	//主键
				attachmentPd.put("BUSINESS_ID", id);
				attachmentPd.put("TYPE", "referral");
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

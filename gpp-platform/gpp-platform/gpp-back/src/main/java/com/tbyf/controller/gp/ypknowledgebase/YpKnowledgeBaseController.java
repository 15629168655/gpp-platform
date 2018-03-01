package com.tbyf.controller.gp.ypknowledgebase;

import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.rowset.serial.SerialBlob;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsRecommend;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.ypknowledgebase.YpKnowledgeBaseManager;
import com.tbyf.service.system.dictionaries.impl.DictionariesService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


/**
 * 药品知识库
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/ypKnowledgeBase")
public class YpKnowledgeBaseController extends BaseController{
	
	@Resource(name="ypKnowledgeBaseService")
	private YpKnowledgeBaseManager ypKnowledgeBaseService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	/**
	 * 药品知识库列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String allergy = pd.getString("IS_RECOMMEND");					//过敏源检索条件
		if(null != allergy && !"".equals(allergy)){
			pd.put("IS_RECOMMEND", allergy.trim());
		}else{
			pd.put("IS_RECOMMEND", null);
		}
		pd.put("EnumIsRecommend", EnumIsRecommend.toMap());
		page.setPd(pd);
		List<PageData> list = ypKnowledgeBaseService.list(page);
		mv.setViewName("gp/ypKnowledgeBase/ypKnowledgeBase_list");
		mv.addObject("list", list);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
    }
	/**
	 * 增加
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add")
	public ModelAndView toAddPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/ypKnowledgeBase/ypKnowledgeBase_edit");
		return mv;
	}
	
	/**
	 * 保存
	 * @param request
	 * @param attachments
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveObject(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增药品信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		String yptype = request.getParameter("YP_TYPE");
		String yptypemc = request.getParameter("YP_TYPE_MC");
		String remark = request.getParameter("REMARK");
		String is_recommend = request.getParameter("IS_RECOMMEND");
		String first = request.getParameter("FIRST");
		byte[] bytes = null;  
		bytes = remark.getBytes("GBK");  
		pd.put("ID", id);
		pd.put("YP_TYPE", yptype);
		pd.put("YP_TYPE_MC", yptypemc);
		pd.put("REMARK", bytes);
		pd.put("IS_RECOMMEND",is_recommend);
		pd.put("FIRST", first);
		ypKnowledgeBaseService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 获取tree数据
	 * @return 
	 */
	@RequestMapping(value="/getTreeData")
	@ResponseBody
	public ModelAndView getTreeData(Model model){
		logBefore(logger, Jurisdiction.getUsername()+"获取字典信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String DICTIONARIES_ID = "bbdea4d7009249f992ce1dc27f1488a8";
		try {
			JSONArray arr = JSONArray.fromObject(dictionariesService.listAllDict(DICTIONARIES_ID));
			String json = arr.toString();
			json = json.replaceAll("DICTIONARIES_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDict", "nodes").replaceAll("hasDict", "checked").replaceAll("treeurl", "");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DICTIONARIES_ID",DICTIONARIES_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("gp/ypKnowledgeBase/treeData");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		logBefore(logger, Jurisdiction.getUsername()+"删除症状信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			ypKnowledgeBaseService.delete(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		logBefore(logger, Jurisdiction.getUsername()+"批量删除症状信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("id", id);
				ypKnowledgeBaseService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**
	 * 编辑页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update")
	public ModelAndView toEditPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData data=ypKnowledgeBaseService.findById(pd);
		/**
		 * 将oracle.sql.blob转换成String 
		 * 在编辑页面显示
		 */
		Object REMARK = data.get("REMARK");
		String str = null;  
        byte[] inbyte=null;  
        if(REMARK instanceof Blob){  
            Blob blob = (Blob) REMARK;  
            if (blob != null) {  
                inbyte = blob.getBytes(1, (int) blob.length());  
            }  
            str =   new String(blob.getBytes(1, (int) blob.length()),"GBK");
        }  
        data.put("REMARK", str);//将blob类型转换，在页面显示
		mv.addObject("data",data);
		mv.setViewName("gp/ypKnowledgeBase/ypKnowledgeBase_toEdit");
		return mv;
	}
	/**
	 * 编辑
	 * @param request
	 * @param attachments
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改药品信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String modify_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String id = request.getParameter("ID");
		String yptype = request.getParameter("YP_TYPE");
		String yptypemc = request.getParameter("YP_TYPE_MC");
		String remark = request.getParameter("REMARK");
		String is_recommend = request.getParameter("IS_RECOMMEND");
		String first = request.getParameter("FIRST");
		byte[] bytes = null;  
		bytes = remark.getBytes("GBK");  
		pd.put("ID", id);
		pd.put("YP_TYPE", yptype);
		pd.put("YP_TYPE_MC", yptypemc);
		pd.put("REMARK", bytes);
		pd.put("IS_RECOMMEND",is_recommend);
		pd.put("FIRST", first);
		pd.put("MODIFY_TIME", modify_time);
		ypKnowledgeBaseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
}

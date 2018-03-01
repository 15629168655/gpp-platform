package com.tbyf.controller.gp.zzknowledgebase;

import com.tbyf.controller.base.*;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.zzknowledgebase.impl.ZzKnowledgeBaseService;
import com.tbyf.service.system.dictionaries.impl.DictionariesService;
import com.tbyf.util.*;

import net.sf.json.JSONArray;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.*;

import java.sql.Blob;
import java.util.*;

/**
 * 症状知识库
 * @author zhangy
 *
 */
@Controller
@RequestMapping(value="/zzKnowledgeBase")
public class ZzKnowledgeBaseController extends BaseController {
    
	@Resource(name="zzKnowledgeBaseService")
	private ZzKnowledgeBaseService zzKnowledgeBaseService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = zzKnowledgeBaseService.queryPage(page);
			for(PageData p:list){
				Object REMARK = p.get("REMARK");
				String str = null;  
		        if(REMARK instanceof Blob){  
		            Blob blob = (Blob) REMARK;  
		            if (blob != null) {  
		                str= new String(blob.getBytes((long)1, (int)blob.length()));
		            }  
		        }  
		        p.put("REMARK", str);
			}
			mv.setViewName("gp/zzKnowledgeBase/zzKnowledgeBase_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	@RequestMapping(value="/toAddPage")
	public ModelAndView toAddPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/zzKnowledgeBase/zzKnowledgeBase_add");
		return mv;
	}
	@RequestMapping(value="/saveObject")
	public ModelAndView saveObject() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增症状信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		byte[] REMARK = pd.getString("REMARK").getBytes();
		pd.put("ID", id);
		pd.put("REMARK", REMARK);
		zzKnowledgeBaseService.saveObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delObject")
	@ResponseBody
	public Object delObject(){
		logBefore(logger, Jurisdiction.getUsername()+"删除症状信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			zzKnowledgeBaseService.delete(pd);
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
				zzKnowledgeBaseService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
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
		String DICTIONARIES_ID = "5cf83becd5404a098dc9eb6ed3c741a7";
		try {
			JSONArray arr = JSONArray.fromObject(dictionariesService.listAllDict(DICTIONARIES_ID));
			String json = arr.toString();
			json = json.replaceAll("DICTIONARIES_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDict", "nodes").replaceAll("hasDict", "checked").replaceAll("treeurl", "");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DICTIONARIES_ID",DICTIONARIES_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("gp/zzKnowledgeBase/treeData");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
		
	}
	@RequestMapping(value="/toEditPage")
	public ModelAndView toEditPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData data=zzKnowledgeBaseService.queryDataById(pd);
		Object REMARK = data.get("REMARK");
		String str = null;  
        if(REMARK instanceof Blob){  
            Blob blob = (Blob) REMARK;  
            if (blob != null) {  
                str= new String(blob.getBytes((long)1, (int)blob.length()));
            }  
        }  
        data.put("REMARK", str);
		mv.addObject("data",data);
		mv.setViewName("gp/zzKnowledgeBase/zzKnowledgeBase_edit");
		return mv;
	}
	@RequestMapping(value="/saveEdit")
	public ModelAndView saveEdit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改疾病信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		byte[] REMARK = pd.getString("REMARK").getBytes();
		pd.put("REMARK", REMARK);
		zzKnowledgeBaseService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
}
	
 
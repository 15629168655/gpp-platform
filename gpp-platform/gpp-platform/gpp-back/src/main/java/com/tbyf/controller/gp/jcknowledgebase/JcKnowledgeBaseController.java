package com.tbyf.controller.gp.jcknowledgebase;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsRecommend;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jcKnowledgeBase.impl.JcKnowledgeBaseService;
import com.tbyf.service.system.dictionaries.impl.DictionariesService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 检查知识库
 * @author lizk
 * 2016-12-15
 *
 */
@Controller
@RequestMapping(value="/jcKnowledgeBase")
public class JcKnowledgeBaseController extends BaseController {
	
	@Resource(name="jcKnowledgeBaseService")
	private JcKnowledgeBaseService jcKnowledgeBaseService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	/**
	 * 检查知识库列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String FIRST = pd.getString("FIRST");	//检索条件
		if(null != FIRST && !"".equals(FIRST)){
			pd.put("FIRST", FIRST.toUpperCase().trim());
		}
		String IS_RECOMMEND = pd.getString("IS_RECOMMEND");			//是否推荐
		if(null != IS_RECOMMEND && !"".equals(IS_RECOMMEND)){
			pd.put("IS_RECOMMEND", IS_RECOMMEND.trim());
		}else{
			pd.put("IS_RECOMMEND", null);
		}
		pd.put("EnumIsRecommend", EnumIsRecommend.toMap());//是否推荐
		page.setPd(pd);
		try {
			List<PageData>	list = jcKnowledgeBaseService.queryPage(page);
			mv.setViewName("gp/jcknowledgebase/jcKnowledgeBase_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	
	/**
	 * 去新增页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toAddPage")
	public ModelAndView toAddPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//		pd.put("EnumIsRecommend_NO", EnumIsRecommend.NO.getCode()); 	//枚举，不推荐
//		pd.put("EnumIsRecommend_YES", EnumIsRecommend.YES.getCode()); 	//枚举，推荐
		mv.setViewName("gp/jcknowledgebase/jcKnowledgeBase_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
//		Map<String,Object> mapData = new HashMap<String, Object>();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String DICTIONARIES_ID = "06eead3cdea54c488b3f953568c0d85c";
		try {
			JSONArray arr = JSONArray.fromObject(dictionariesService.listAllDict(DICTIONARIES_ID));
			String json = arr.toString();
			json = json.replaceAll("DICTIONARIES_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDict", "nodes").replaceAll("hasDict", "checked").replaceAll("treeurl", "");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DICTIONARIES_ID",DICTIONARIES_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("gp/jcknowledgebase/jclx_tree");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
		
	}
	
	/**
	 * 新增保存检查知识库
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView saveObject() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增检查类型信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String FIRST = pd.getString("FIRST");	//首字母装换成大写
		if(null != FIRST && !"".equals(FIRST)){
			pd.put("FIRST", FIRST.toUpperCase().trim());
		}
		if(null != pd.getString("REMARK") && !"".equals(pd.getString("REMARK"))){			
			byte[] REMARK = pd.getString("REMARK").getBytes();//将blob类型转换
			pd.put("REMARK", REMARK);//内容
		}
		String ID = this.get32UUID();
		pd.put("ID", ID);
		jcKnowledgeBaseService.saveObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 去修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEditPage")
	public ModelAndView toEditPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData data=jcKnowledgeBaseService.queryDataById(pd);
		Object REMARK = data.get("REMARK");
		String str = null;  
        byte[] inbyte=null;  
        if(REMARK instanceof Blob){  
            Blob blob = (Blob) REMARK;  
            if (blob != null) {  
                inbyte = blob.getBytes(1, (int) blob.length());  
            }  
            str =new String (inbyte);  
        }  
//		pd.put("EnumIsRecommend_NO", EnumIsRecommend.NO.getCode()); 	//枚举，不推荐
//		pd.put("EnumIsRecommend_YES", EnumIsRecommend.YES.getCode()); 	//枚举，推荐
		mv.setViewName("gp/jcknowledgebase/jcKnowledgeBase_add");
        data.put("REMARK", str);//将blob类型转换，在页面显示
		mv.addObject("data",data);
		mv.setViewName("gp/jcknowledgebase/jcKnowledgeBase_add");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 修改保存检查知识库
	 * @param request
	 * @param attachments
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView saveEdit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改检查知识库信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String FIRST = pd.getString("FIRST");	//首字母装换成大写
		if(null != FIRST && !"".equals(FIRST)){
			pd.put("FIRST", FIRST.toUpperCase().trim());
		}
		if(null != pd.getString("REMARK") && !"".equals(pd.getString("REMARK"))){			
			byte[] REMARK = pd.getString("REMARK").getBytes();//将blob类型转换
			pd.put("REMARK", REMARK);//内容
		}
		jcKnowledgeBaseService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除检查知识库
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delObject")
	@ResponseBody
	public Object delObject(){
		logBefore(logger, Jurisdiction.getUsername()+"删除检查知识库");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			jcKnowledgeBaseService.delete(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "ERROR");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**批量删除检查知识库
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		logBefore(logger, Jurisdiction.getUsername()+"批量删除检查知识库");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				jcKnowledgeBaseService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "ERROR");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}

}

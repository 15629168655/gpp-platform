package com.tbyf.controller.gp.knowledgebase;

import com.tbyf.controller.base.*;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.knowledgebase.impl.KnowledgeBaseService;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.service.system.dictionaries.impl.DictionariesService;
import com.tbyf.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.*;

import java.sql.Blob;
import java.util.*;

/**
 * 疾病知识库
 * @author zhangy
 *
 */
@Controller
@RequestMapping(value="/knowledgeBase")
public class KnowledgeBaseController extends BaseController {
    
	@Resource(name="knowledgeBaseService")
	private KnowledgeBaseService knowledgeBaseService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = knowledgeBaseService.queryPage(page);
			mv.setViewName("gp/knowledgeBase/knowledgeBase_list");
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
		mv.setViewName("gp/knowledgeBase/knowledgeBase_add");
		return mv;
	}
	@RequestMapping(value="/saveObject")
	public ModelAndView saveObject(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增疾病信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		String _depart = request.getParameter("_depart");
		String[] str_depart=_depart.split("##");
		String _diseases = request.getParameter("_diseases");
		String[] str_diseases = _diseases.split("##");
		String is_recommend = request.getParameter("is_recommend");
		String diseases_name = request.getParameter("diseases_name");
		byte[] REMARK = request.getParameter("REMARK").getBytes();
		pd.put("ID", id);
		pd.put("DISEASES_NAME", diseases_name);
		pd.put("DEPART_CODE", str_depart[0]);
		pd.put("DEPART_NAME", str_depart[1]);
		pd.put("DISEASES_CLASS_CODE", str_diseases[0]);
		pd.put("DISEASES_CLASS_NAME", str_diseases[1]);
		pd.put("REMARK", REMARK);
		pd.put("IS_RECOMMEND",is_recommend);
		pd.put("DISEASES_CODE", request.getParameter("diseases_code"));
		pd.put("FIRST", request.getParameter("FIRST"));
		knowledgeBaseService.saveObj(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除疾病信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			knowledgeBaseService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除疾病信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("id", id);
				knowledgeBaseService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**
	 * 获取下拉菜单数据
	 * @return 科室菜单，疾病分类菜单
	 */
	@RequestMapping(value="/getSelectData")
	@ResponseBody
	public Object getSelectData(){
		logBefore(logger, Jurisdiction.getUsername()+"获取字典信息");
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			List<Dictionaries> listDepart=dictionariesService.listSubDictByParentId("e3d8efe8fafa4d2784008ac1a62eda45");
			List<Dictionaries> listDiseases=dictionariesService.listSubDictByParentId("dd0958b01dea4ac6aec998e120a5c2f9");
			if(null != listDepart){
				map.put("depart", listDepart);
			}
			if(null != listDiseases){
				map.put("diseases", listDiseases);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	@RequestMapping(value="/toEditPage")
	public ModelAndView toEditPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData data=knowledgeBaseService.queryDataById(pd);
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
		mv.setViewName("gp/knowledgeBase/knowledgeBase_edit");
		return mv;
	}
	@RequestMapping(value="/saveEdit")
	public ModelAndView saveEdit(MultipartHttpServletRequest request,@RequestParam(value="attachments",required=false) MultipartFile[] attachments) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改疾病信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = request.getParameter("id");
		String _depart = request.getParameter("_depart");
		String[] str_depart=_depart.split("##");
		String _diseases = request.getParameter("_diseases");
		String[] str_diseases = _diseases.split("##");
		byte[] REMARK = request.getParameter("REMARK").getBytes();
		String is_recommend = request.getParameter("is_recommend");
		String diseases_name = request.getParameter("diseases_name");
		pd.put("ID", id);
		pd.put("DISEASES_NAME", diseases_name);
		pd.put("DEPART_CODE", str_depart[0]);
		pd.put("DEPART_NAME", str_depart[1]);
		pd.put("DISEASES_CLASS_CODE", str_diseases[0]);
		pd.put("DISEASES_CLASS_NAME", str_diseases[1]);
		pd.put("REMARK", REMARK);
		pd.put("IS_RECOMMEND",is_recommend);
		pd.put("DISEASES_CODE", request.getParameter("diseases_code"));
		knowledgeBaseService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/getDiseaseData")
	public ModelAndView getDiseaseData(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取疾病信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String XM = pd.getString("XM");	//检索条件
		if(null != XM && !"".equals(XM)){
			pd.put("XM", XM.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = diseasecodeService.list(page);	
		mv.setViewName("gp/knowledgeBase/diseaseData");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
}
	
 
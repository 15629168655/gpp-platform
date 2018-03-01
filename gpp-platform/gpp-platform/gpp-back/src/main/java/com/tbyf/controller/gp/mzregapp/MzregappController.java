package com.tbyf.controller.gp.mzregapp;

import com.tbyf.controller.base.*;
import com.tbyf.entity.system.Dictionaries;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.knowledgebase.impl.KnowledgeBaseService;
import com.tbyf.service.gp.mzregapp.MzregappManager;
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
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * APP预约挂号
 * @author zhangy
 *
 */
@Controller
@RequestMapping(value="/regapp")
public class MzregappController extends BaseController {
	String menuUrl = "mzregapp/list.do"; //菜单地址(权限用)
	
	@Resource(name="mzregappService")
	private MzregappManager mzregappService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData>	list = mzregappService.list(page);
			mv.setViewName("gp/regapp/regapp_list");
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
		mv.setViewName("gp/regapp/regapp_add");
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView saveObject() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		pd.put("ID", id);
		pd.put("APPLYTYPE", "0");
		pd.put("STATUS", "0");
		mzregappService.save(pd);
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
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mzregappService.delete(pd);
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
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("id", id);
				mzregappService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**取消预约
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/cancel")
	@ResponseBody
	public Object cancel(){
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = this.getPageData();
		try {
			pd.put("APPLYTYPE", "1");
			mzregappService.cancel(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
}
	
 
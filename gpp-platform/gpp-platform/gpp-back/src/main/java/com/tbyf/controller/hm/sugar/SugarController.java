package com.tbyf.controller.hm.sugar;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumTimeSlot;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.sugar.SugarManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 血糖检测
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/sugar")
public class SugarController extends BaseController{
	
	String menuUrl = "sugar/list.do"; //菜单地址(权限用)
	@Resource(name="sugarService")
    private SugarManager sugarService;
	/**显示血糖列表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"显示血糖信息列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	list = sugarService.list(page);  //列表
			mv.setViewName("hm/sugar/sugar_list");
			mv.addObject("varList", list);
			pd.put("TIMEENUM", EnumTimeSlot.toMap());
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加一条血糖测试");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());					//主键
		sugarService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"血糖新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TIMEENUM", EnumTimeSlot.toMap());
		Date nowDate = new Date();
		pd.put("CREAT_TIME",nowDate);		  //获取当前录入人ID
		mv.addObject("pd", pd);
		mv.setViewName("hm/sugar/sugar_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"血糖编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		sugarService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"血糖编辑界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = sugarService.findById(pd);	//根据ID读取
		pd.put("TIMEENUM", EnumTimeSlot.toMap());
		mv.setViewName("hm/sugar/sugar_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(){
		logBefore(logger, Jurisdiction.getUsername()+"删除检查血糖");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		try {
			sugarService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删血糖信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("IDS"));
		String[] ids = str.split(",");
		try {
			
			sugarService.delAll(ids);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}

}

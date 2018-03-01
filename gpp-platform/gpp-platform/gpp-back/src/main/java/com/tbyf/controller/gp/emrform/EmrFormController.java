package com.tbyf.controller.gp.emrform;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumBloodPressure;
import com.tbyf.entity.enums.EnumErmForm;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.enums.EnumTySex;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.emrform.emrformManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 电子病历
 * 模板管理
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/emrform")
public class EmrFormController extends BaseController{
	
	String menuUrl = "emrform/list.do"; //菜单地址(权限用)
		
	@Resource(name="emrformService")
	private emrformManager emrformService;
	
	/**
	 * 模板管理信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("EnumErmForm", EnumErmForm.toMap());	//模板类型
		pd.put("EnumTySex", EnumTySex.toMap());		//适用性别
		pd.put("EnumMust", EnumBloodPressure.toMap());  //是否必须
		pd.put("EnumStatus", EnumStatus.toMap());  //是否必须
		page.setPd(pd);
		/**
		 * 点击模板管理
		 * 分页显示模板管理
		 */
		List<PageData> varList = emrformService.list(page);
		mv.setViewName("gp/emrform/emrform_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String TEMPLATE_TYPE = pd.getString("TEMPLATE_TYPE");
		pd.put("ID", this.get32UUID());					//主键
		pd.put("FID", "");
		if(TEMPLATE_TYPE.equals("0") ){
			pd.put("YWTYPE_ID", "");
		}else if(TEMPLATE_TYPE.equals("1")){
			pd.put("YWTYPE_ID", null == getCurUser().getDeptId()?"":getCurUser().getDeptId().toString());
		}else if(TEMPLATE_TYPE.equals("2")){
			pd.put("YWTYPE_ID", getCurUser().getUserId());
		}
//		pd.put("YSNR", "");
//		pd.put("ZHNR", "");
		pd.put("STATUS", "1");  	//状态(1:启用;2:停用;9:删除)
		emrformService.save(pd);
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
		pd.put("OPERATION_NAME",getCurUser().getName());		//获取当前录入人
		pd.put("EnumErmForm", EnumErmForm.toMap());	//模板类型
		pd.put("EnumTySex", EnumTySex.toMap());		//适用性别
		pd.put("EnumMust", EnumBloodPressure.toMap());  //是否必须
		mv.addObject("pd", pd);
		mv.setViewName("gp/emrform/emrform_add");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		PageData pd = new PageData();
		pd = this.getPageData();
		emrformService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		emrformService.edit(pd);
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
		pd = emrformService.findById(pd);	//根据ID读取
		pd.put("EnumErmForm", EnumErmForm.toMap());	//模板类型
		pd.put("EnumTySex", EnumTySex.toMap());		//适用性别
		pd.put("EnumMust", EnumBloodPressure.toMap());  //是否必须
		mv.addObject("pd", pd);
		mv.setViewName("gp/emrform/emrform_update");
		mv.addObject("msg", "edit");
		return mv;
	}
	/**
	 * 表单预览
	 * @return
	 */
	@RequestMapping(value="/toViewForm")
	public ModelAndView toViewForm(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = emrformService.findById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("gp/emrform/viewForm");
			mv.addObject("msg", "save");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 表单设计
	 * @return
	 */
	@RequestMapping(value="/getHtmlContent")
	@ResponseBody
	 public Object getHtmlContent(){
		 Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
	     pd = this.getPageData();
	     try {
			pd = emrformService.findById(pd);
			map.put("data", pd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return AppUtil.returnObject(new PageData(), map);
	 }
	@RequestMapping(value="/formDesiginer")
	@ResponseBody
	 public Object formDesiginer(){
		 Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
	     pd = this.getPageData();
	     Boolean flag =true;
	     try {
			emrformService.editForm(pd);
			
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
	     map.put("flag", flag);
		 return AppUtil.returnObject(new PageData(), map);
	 }
}

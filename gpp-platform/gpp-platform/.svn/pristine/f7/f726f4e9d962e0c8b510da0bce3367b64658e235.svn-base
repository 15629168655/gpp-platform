package com.tbyf.controller.gp.blfyypgl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumBlfyypglLB;
import com.tbyf.entity.enums.EnumBlfyypglState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.blfyypgl.impl.BlfyypglService;
import com.tbyf.service.gp.drug.impl.DrugService;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 不良反应药品管理
 * @author lizk
 *2016-09-28
 */
@Controller
@RequestMapping(value="/blfyypgl")
public class BlfyypglController extends BaseController {
	
	String menuUrl = "blfyypgl/list.do"; //菜单地址(权限用)

	@Resource(name="blfyypglService")
	private BlfyypglService blfyypglService;
	
	@Resource(name="patientService")
	private PatientManager patientService;
	
	@Resource(name="drugService")
	private DrugService drugService;
	
	Integer eaN = EnumBlfyypglState.NORMAL.getCode();//枚举，正常状态
	Integer eaD = EnumBlfyypglState.DELETE.getCode();//枚举，删除状态
	
	/**显示不良反应药品列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView listJxmm(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String category = pd.getString("category");					//状态检索条件
			if(null != category && !"".equals(category)){
				pd.put("category", category.trim());
			}else{
				pd.put("category", null);
			}
			pd.put("STATE", eaN);
			pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构编码
			pd.put("enumBlfyypglLB", EnumBlfyypglLB.toMap());  //类别
			page.setPd(pd);
			List<PageData>	list = blfyypglService.list(page);  //列表
			mv.setViewName("gp/blfyypgl/blfyypgl_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
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
		pd.put("enumBlfyypglLB", EnumBlfyypglLB.toMap());  //类别
		mv.setViewName("gp/blfyypgl/blfyypgl_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**弹出患者信息页面点击录入
	 * @param
	 * @throws Exception
	 
	@RequestMapping(value="/goluRuHZ")
	public ModelAndView goLuruHZ(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取患者信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String XM = pd.getString("XM");	//检索条件
		if(null != XM && !"".equals(XM)){
			pd.put("XM", XM.trim());
		}
		page.setPd(pd);
		List<PageData>	patientList = patientService.list(page);	//列出patient列表
		mv.setViewName("gp/blfyypgl/patient_list");
		mv.addObject("patientList", patientList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	*/
	/**弹出药品信息页面点击录入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goluRuYP")
	public ModelAndView goLuruYP(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取药品信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	list = drugService.list(page);	//列出药品列表
		mv.setViewName("gp/blfyypgl/drug_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**保存新增不良反应药品
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增不良反应药品信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());				//ID
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码
//		pd.put("INPUT_ID", getCurUser().getUSER_ID());		
		pd.put("INPUT_ID", getCurUser().getProviderId());	//录入人ID
//		pd.put("INPUT_NAME", getCurUser().getNAME());     	//录入人
		pd.put("INPUT_NAME", getCurUser().getProviderName());     	//录入人
		pd.put("STATE", eaN);						//状态(正常状态)
		blfyypglService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = blfyypglService.findById(pd);			//根据ID读取
			pd.put("enumBlfyypglLB", EnumBlfyypglLB.toMap());  //类别
			mv.setViewName("gp/blfyypgl/blfyypgl_add");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改不良反应药品
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改不良反应药品信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		blfyypglService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除不良反应药品
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除不良反应药品");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", eaD);						//状态(删除状态)
		blfyypglService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除不良反应药品
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除不良反应药品信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				pd.put("STATE", eaD);
				blfyypglService.delete(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

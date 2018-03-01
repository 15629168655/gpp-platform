package com.tbyf.controller.gp.skintest;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAllergicReaction;
import com.tbyf.entity.enums.EnumSkintestType;
import com.tbyf.entity.gp.drug.Drug;
import com.tbyf.entity.gp.patient.Patient;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.drug.DrugManager;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.service.gp.skintest.SkintestManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/** 
 * 类名称：SkintestController
 * 修改时间：2016年9月29日
 * 作者：聂方
 * @version
 */
@Controller
@RequestMapping(value="/skintest")
public class SkintestController extends BaseController{
	
	String menuUrl = "skintest/list.do"; //菜单地址(权限用)
	@Resource(name="skintestService")
	private SkintestManager skintestService;
	
	@Resource(name="patientService")
	private PatientManager patientService;
	
	@Resource(name="drugService")
	private DrugManager drugService;

	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception  
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码 检索条件限制
		pd.put("enumAllergicReaction", EnumAllergicReaction.toMap()); // 过敏反应
		pd.put("enumSkintestType", EnumSkintestType.toMap()); // 皮试类型

		String HZXM = pd.getString("HZXM");	//检索条件
		if(null != HZXM && !"".equals(HZXM)){
			pd.put("HZXM", HZXM.trim());
		}
		String PSYP = pd.getString("PSYP");	//检索条件
		if(null != PSYP && !"".equals(PSYP)){
			pd.put("PSYP", PSYP.trim());
		}
		String PSYMC = pd.getString("PSYMC");	//检索条件
		if(null != PSYMC && !"".equals(PSYMC)){
			pd.put("PSYMC", PSYMC.trim());
		}
		String PSLX = pd.getString("PSLX");	 //皮试类型检索条件
		if(null != PSLX && !"".equals(PSLX)){
			pd.put("PSLX", PSLX.trim());
		}else{
			pd.put("PSLX", null);
		}
		String GMFY = pd.getString("GMFY");	 //过敏反应检索条件
		if(null != GMFY && !"".equals(GMFY)){
			pd.put("GMFY", GMFY.trim());
		}else{
			pd.put("GMFY", null);
		}
		page.setPd(pd);
		List<PageData>	skintestList = skintestService.list(page);	//列出皮试列表
		mv.setViewName("gp/skintest/skintest_list");
		mv.addObject("skintestList", skintestList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
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
		pd.put("enumAllergicReaction", EnumAllergicReaction.toMap()); // 过敏反应
		pd.put("enumSkintestType", EnumSkintestType.toMap()); // 皮试类型
		List<Patient> patientList = patientService.listAllPatients(pd);	//患者
		List<Drug> drugList = drugService.listAllDrugs(pd);	//药品
		mv.setViewName("gp/skintest/skintest_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("patientList", patientList);
		mv.addObject("drugList", drugList);
		return mv;
	}
	
	/**保存
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增皮试");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//ID
		pd.put("ZT", 0);
		pd.put("LRRID", getCurUser().getProviderId());//录入人ID
		pd.put("LRR", getCurUser().getName()); //录入人
		if(null == skintestService.findById(pd)){  //判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		skintestService.save(pd);           //执行保存
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = skintestService.findById(pd);  	//根据ID读取
		List<Patient> patientList = patientService.listAllPatients(pd);	//患者
		List<Drug> drugList = drugService.listAllDrugs(pd);	//药品
		pd.put("enumAllergicReaction", EnumAllergicReaction.toMap()); // 过敏反应
		pd.put("enumSkintestType", EnumSkintestType.toMap()); // 皮试类型
		mv.setViewName("gp/skintest/skintest_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("patientList", patientList);
		mv.addObject("drugList", drugList);
		return mv;
	}
	
	/**
	 * 修改任务
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改皮试");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		skintestService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除任务
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除皮试");
		PageData pd = new PageData();
		pd = this.getPageData();
		skintestService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除皮试");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String IDS = pd.getString("IDS");
			if(null != IDS && !"".equals(IDS)){
				String ArrayIDS[] = IDS.split(",");
				skintestService.deleteAll(ArrayIDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}

}

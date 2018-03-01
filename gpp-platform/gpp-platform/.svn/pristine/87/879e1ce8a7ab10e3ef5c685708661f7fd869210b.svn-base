package com.tbyf.controller.gp.patient;

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
import com.tbyf.entity.enums.EnumAgreement;
import com.tbyf.entity.enums.EnumPatientKlx;
import com.tbyf.entity.enums.EnumPatientGsd;
import com.tbyf.entity.enums.EnumMarriage;
import com.tbyf.entity.enums.EnumPatientLxrgx;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.patient.PatientManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


/** 
 * 类名称：PatientController
 * 修改时间：2016年9月13日
 * 作者：聂方
 * @version
 */

@Controller
@RequestMapping(value="/patient")
public class PatientController extends BaseController {
	String menuUrl = "patient/list.do"; //菜单地址(权限用)
	
	@Resource(name="patientService")
	private PatientManager patientService;
	
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	
	Integer eaD = EnumAgreement.DELETE.getCode();//枚举，删除状态
	
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
		pd.put("YLJGDM", getCurUser().getOrgCode());	//机构编码 检索条件限制
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String Start = pd.getString("birthStart");	
		if(null != Start && !"".equals(Start)){
		pd.put("Start", Start.replace("-", ""));
		}
		String End = pd.getString("birthEnd");	
		if(null != End && !"".equals(End)){
		pd.put("End", End.replace("-", ""));
		}
		page.setPd(pd);
		List<PageData>	patientList = patientService.list(page);	//列出patient列表
		mv.setViewName("gp/patient/patient_list");
		mv.addObject("patientList", patientList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增患者页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("enumPatientKlx", EnumPatientKlx.toMap()); // 卡类型
		pd.put("enumPatientGsd", EnumPatientGsd.toMap()); // 归属地
		pd.put("enumMarriage", EnumMarriage.toMap()); // 婚姻状况
		pd.put("enumPatientLxrgx", EnumPatientLxrgx.toMap()); // 与联系人关系
		
		pd.put("dictCardType", dictionariesService.queryDictionary(Constants.DICT_CARDTYPE));	//身份证的类型
		pd.put("dictNationality", dictionariesService.queryDictionary(Constants.DICT_NATIONALITY));	//国籍信息
		pd.put("dictNation", dictionariesService.queryDictionary(Constants.DICT_NATION));	//名族
	
		mv.setViewName("gp/patient/patient_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存患者信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增患者信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//ID
		pd.put("XGBZ", "0");
		pd.put("YLJGDM", getCurUser().getOrgCode());	//医疗机构代码
		if(null == patientService.findById(pd)){  //判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		patientService.save(pd);           //执行保存
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
		pd = patientService.findById(pd);  	//根据ID读取
		if(pd.get("YWSCSJ")!=null){
		    String c =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(pd.get("YWSCSJ")); 
		    pd.put("YWSCSJ", c);
		}else{
			pd.put("YWSCSJ", "");
		}
		pd.put("enumPatientKlx", EnumPatientKlx.toMap()); // 卡类型
		pd.put("enumPatientGsd", EnumPatientGsd.toMap()); // 归属地
		pd.put("enumMarriage", EnumMarriage.toMap()); // 婚姻状况
		pd.put("enumPatientLxrgx", EnumPatientLxrgx.toMap()); // 与联系人关系
		
		pd.put("dictCardType", dictionariesService.queryDictionary(Constants.DICT_CARDTYPE));
		pd.put("dictNationality", dictionariesService.queryDictionary(Constants.DICT_NATIONALITY));
		pd.put("dictNation", dictionariesService.queryDictionary(Constants.DICT_NATION));

		mv.setViewName("gp/patient/patient_edit");
		
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改患者信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		patientService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除患者信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		patientService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除患者信息");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String IDS = pd.getString("IDS");
			if(null != IDS && !"".equals(IDS)){
				String ArrayIDS[] = IDS.split(",");
				patientService.deleteAll(ArrayIDS);
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

package com.tbyf.controller.gp.indexcommonchose;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAgreement;
import com.tbyf.entity.enums.EnumFitSex;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumSex;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.screeningquestionnarie.ScreeningQuestionnaireManager;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.departments.DepartmentsManager;
import com.tbyf.service.hm.organization.OrganizationManager;
import com.tbyf.service.hm.yhry.YhryManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.Const;
import com.tbyf.util.Constants;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

import net.sf.json.JSONArray;
/**指标选择列表选择
 * 
 * 
 * @author zanxc
 */
@Controller
@RequestMapping(value="/indexCommonChose")
public class IndexCommonChoseController extends BaseController{

	@Resource(name="departmentsService")
	private DepartmentsManager departmentsService;
	@Resource(name="organizationService")
	private  OrganizationManager organizationService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	@Resource(name="screeningQuestionnaireService")
    private ScreeningQuestionnaireManager screeningQuestionnaireService;
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	@Resource(name="yhryService")
	private YhryManager yhryService;
	/**单位机构的选择
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCompanyData")
	public ModelAndView getCompanyData(Model model) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取机构菜单");
		ModelAndView mv = this.getModelAndView();
		JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(Const.TREE_TOP_NODE,null,null));
		String json = array.toString();
		mv.addObject("treeTopJson", json);
		//设置跳转路径
		mv.setViewName("gp/indexcommonchose/getCompanyData");
		return mv;
	}
	@RequestMapping(value="/getDepartData")
	@ResponseBody
	public ModelAndView getDepartData(@RequestParam String ORG_CODE )throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取科室菜单");
		ModelAndView mv = this.getModelAndView();
		List<PageData>  departments = departmentsService.findByORG_CODE(ORG_CODE);
		mv.addObject("size",departments.size());
		mv.addObject("orgCode", ORG_CODE);			//传入机构管理编码，作为查询条件
		mv.setViewName("gp/indexcommonchose/departData");
		return mv;
	}
	/**科室选择弹窗
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseKS")
	public ModelAndView chooseKS()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取科室菜单");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ORG_CODE = pd.get("ORG_CODE").toString();
		List<PageData>  departments = departmentsService.findByORG_CODE(ORG_CODE);
		mv.addObject("size",departments.size());
		mv.addObject("orgCode", ORG_CODE);			//传入机构管理编码，作为查询条件
		mv.setViewName("gp/indexcommonchose/departData");
		return mv;
	}
	/**
	 * 问卷人
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getChooseYhryList")
	public ModelAndView getChooseYhryList(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取选择医生列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROVIDER_NAME = pd.getString("PROVIDER_NAME");	//查询条件：医生姓名
		if(null != PROVIDER_NAME && !"".equals(PROVIDER_NAME)){
			pd.put("keywords", PROVIDER_NAME.trim());
		}
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码
		pd.put("enumSex", EnumSex.toMap()); // 性别
		page.setPd(pd);
		List<PageData>	yhry = yhryService.yhrylist(page);
		mv.setViewName("hm/indexcommonchose/getChooseYhryList");
		mv.addObject("yhryList", yhry);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	/**
	 * 获取居民信息列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/getJMXX")
	public ModelAndView getJMXX(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取居民列表");
		Integer eaD = EnumAgreement.DELETE.getCode();//枚举，删除状态
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", eaD);
		page.setPd(pd);
		List<PageData>	jmxxList = jmxxService.listAlljmxx(page);			//居民列表
		mv.setViewName("gp/indexcommonchose/getJMXX");
		mv.addObject("jmxxList", jmxxList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 获取筛选调查表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/getScreening")
	public ModelAndView getScreening(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"筛选问卷列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	screeningList = screeningQuestionnaireService.list(page);  //列表
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型(性别)
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexcommonchose/getScreening");
		mv.addObject("screeningList", screeningList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
}

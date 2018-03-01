package com.tbyf.controller.gp.indexdiseaseadvice;

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
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.diseaseadvice.IndexDiseaseAdviceManager;
import com.tbyf.service.gp.index.residentquestionnarie.ResidentQuestionnaireManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.NumberToChineseUntil;
import com.tbyf.util.PageData;

/**指标组合管理
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexDiseaseAdvice")
public class IndexDiseaseAdviceController extends BaseController {
	String menuUrl = "indexDiseaseAdvice/createDis.do"; //菜单地址(权限用)
	@Resource(name="indexDiseaseAdviceService")
    private IndexDiseaseAdviceManager indexDiseaseAdviceService;//筛查建议
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;//疾病编码
	@Resource(name="residentQuestionnaireService")
	private ResidentQuestionnaireManager residentQuestionnaireService;//居民问卷
	/**显示诊断记录界面
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示诊断记录界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	list = indexDiseaseAdviceService.list(page);  //列表
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 生成诊断界面
	 */
	@RequestMapping(value="/fDis")
	public ModelAndView fDis(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示生成诊断记录界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INDEX_RESULT_ID", Const.DISEASE_ADVICE_BY_DOCTOR);//list显示不是添加的诊断
		page.setPd(pd);
		List<PageData>	list = indexDiseaseAdviceService.list(page);  //列表
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_f_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		return mv;
	}
	/**添加的诊断界面
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/createDis")
	public ModelAndView createDis(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加的诊断界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INDEX_RESULT_ID", Const.DISEASE_ADVICE_BY_DOCTOR);
		page.setPd(pd);
		List<PageData>	list = indexDiseaseAdviceService.datalistCreate(page);  //列表
		//判断问卷结果的ID是不是存在
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_create_dis");
		mv.addObject("varList", list);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 删除疾病的诊断
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除疾病诊断");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		indexDiseaseAdviceService.delete(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**
	 * 添加诊断界面
	 */
	@RequestMapping(value="/addDis")
	public ModelAndView addDis(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示添加诊断界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_edit_dis");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 保存诊断
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveDis")
	public ModelAndView saveDis() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存诊断");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());
		pd.put("INDEX_RESULT_ID", Const.DISEASE_ADVICE_BY_DOCTOR);
		indexDiseaseAdviceService.save(pd);  //保存
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 筛查建议的界面
	 */
	@RequestMapping(value="/screeningAdvice")
	public ModelAndView screeningAdvice(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示筛查建议");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	list = indexDiseaseAdviceService.list(page);  //列表
		List<PageData> listAdvice = new ArrayList<PageData>(); //得到疾病建议
		//遍历疾病列表得到相应的建议
		for(int i = 0; i < list.size(); i ++) {
			PageData li = list.get(i);
			li.put("JBBM", li.get("DISEASECODE_ID"));
			li.putAll(diseasecodeService.findByDiseaseCode(li));
			li.put("INDEX", NumberToChineseUntil.numberToChinese(i + 1));
			listAdvice.add(li);
		}
		//取得额外的建议
		pd.put("ID", pd.get("RESIDENT_QUESTIONNAIRE_ID"));
		pd = residentQuestionnaireService.findById(pd);
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_screening_list");
		mv.addObject("varList", listAdvice);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 生成的建议
	 */
	@RequestMapping(value="/createAdvice")
	public ModelAndView createAdvice(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示生成的建议");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		pd.put("INDEX_RESULT_ID", Const.DISEASE_ADVICE_BY_DOCTOR);
		List<PageData>	list = indexDiseaseAdviceService.list(page);  //列表
		List<PageData> listAdvice = new ArrayList<PageData>(); //得到疾病建议
		//遍历疾病列表得到相应的建议
		for(int i = 0; i < list.size(); i ++) {
			PageData li = list.get(i);
			li.put("JBBM", li.get("DISEASECODE_ID"));//获得疾病的编码
			li.putAll(diseasecodeService.findByDiseaseCode(li));
			li.put("INDEX", NumberToChineseUntil.numberToChinese(i + 1));
			listAdvice.add(li);
		}
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_screening_list");
		mv.addObject("varList", listAdvice);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 清空建议
	 */
	@RequestMapping(value="/addAdvice")
	public ModelAndView emptyAdvice(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加建议建议");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//取得额外的建议
		pd.put("ID", pd.get("RESIDENT_QUESTIONNAIRE_ID"));
		pd = residentQuestionnaireService.findById(pd);
		mv.setViewName("gp/indexdiseaseadvice/indexdiseaseadvice_add_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存建议
	 */
	@RequestMapping(value="/saveAdvice")
	public ModelAndView saveAdvice(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加建议建议");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		residentQuestionnaireService.update(pd);  //保存
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

}

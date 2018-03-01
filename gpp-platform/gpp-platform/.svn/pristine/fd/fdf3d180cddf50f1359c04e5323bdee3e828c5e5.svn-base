package com.tbyf.controller.gp.indexresidentquesresult;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumResultType;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumIsPositive;
import com.tbyf.entity.enums.EnumModelType;
import com.tbyf.entity.enums.EnumQuesState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.combination.IndexCombinationManager;
import com.tbyf.service.gp.index.combinationrelation.IndexCombinationRelationManager;
import com.tbyf.service.gp.index.diseaseadvice.IndexDiseaseAdviceManager;
import com.tbyf.service.gp.index.residentquestionnaireresult.ResidentQuestionnaireResultManager;
import com.tbyf.service.gp.index.residentquestionnarie.ResidentQuestionnaireManager;
import com.tbyf.service.gp.index.resultmodel.IndexResultModelManager;
import com.tbyf.service.gp.index.resultrange.IndexResultRangeManager;
import com.tbyf.service.gp.index.screeningcombination.QuestionnaireCombinationManager;
import com.tbyf.service.gp.index.screeningquestionnarie.ScreeningQuestionnaireManager;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.GetAgeByBirthDay;
import com.tbyf.util.GetGrdaUrl;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**
 * 居民问卷结果管理
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexResidentQuesResult")
public class IndexResidentQuesResultController extends BaseController{

	String menuUrl = "indexResidentQuesResult/list.do"; //菜单地址(权限用)
	@Resource(name="residentQuestionnaireService")
    private ResidentQuestionnaireManager residentQuestionnaireService;
	@Resource(name="screeningQuestionnaireService")
    private ScreeningQuestionnaireManager screeningQuestionnaireService;//筛选问卷
	@Resource(name="questionnaireCombinationService")
    private  QuestionnaireCombinationManager questionnaireCombinationService;//问卷组合
	@Resource(name="indexCombinationRelationService")
    private IndexCombinationRelationManager indexCombinationRelationService;//指标组合的关联
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;//数据字典
	@Resource(name="indexResultModelService")
	private IndexResultModelManager  indexResultModelService;//指标结果模板
	@Resource(name="indexResultRangeService")
	private IndexResultRangeManager indexResultRangeService;//指标结果范围
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;//居民信息
	@Resource(name="indexCombinationService")
	private IndexCombinationManager indexCombinationService;//指标组合
	@Resource(name="residentQuestionnaireResultService")//居民结果表
	private ResidentQuestionnaireResultManager residentQuestionnaireResultService;//居民问卷结果
	@Resource(name="indexDiseaseAdviceService")
    private IndexDiseaseAdviceManager indexDiseaseAdviceService;//筛查建议关联
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;//疾病编码
	/**显示居民问卷问卷表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listAll")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示居民问卷结果列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	list = residentQuestionnaireResultService.list(page);  //列表
		mv.addObject("RESULTTYPE", EnumResultType.toMap());//结果类型
		mv.addObject("ISPOSITIVE", EnumIsPositive.toMap());//是否呈阳性
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("ISGIVEUP", EnumIsPositive.toMap());//是否呈阳性
		mv.setViewName("gp/indexresidentquesresult/indexresidentquesresult_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存居民问卷结果");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	
		String nowDate = Tools.date2Str(new Date());
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		residentQuestionnaireResultService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"居民问卷结果新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("RESULTTYPE", EnumResultType.toMap());//结果类型
		mv.addObject("ISPOSITIVE", EnumIsPositive.toMap());//是否呈阳性
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("ISGIVEUP", EnumIsPositive.toMap());//是否呈阳性
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexresidentquesresult/indexresidentquesresult_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"居民问卷结果编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		residentQuestionnaireResultService.update(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"居民问卷结果编辑界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("RESULTTYPE", EnumResultType.toMap());//结果类型
		mv.addObject("ISPOSITIVE", EnumIsPositive.toMap());//是否呈阳性
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("ISGIVEUP", EnumIsPositive.toMap());//是否呈阳性
		pd = residentQuestionnaireResultService.findById(pd);	//根据ID读取
		mv.setViewName("gp/indexresidentquesresult/indexresidentquesresult_edit");
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
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除居民问卷结果");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.DEL.getCode());
		residentQuestionnaireResultService.delete(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量居民问卷结果");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("IDS"));
		String[] ids = str.split(",");
		residentQuestionnaireResultService.delAll(ids);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
	}
	/**显示问卷结果
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView showInfo(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示居民问卷结果");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	lists = residentQuestionnaireService.list(page);  //居民问卷列表
		
		List<PageData> listss = new ArrayList<PageData>();//带有居民信息的列表
		for(PageData li : lists) {
			li.put("USER_AGENT_ID", li.get("RESIDENT_ID"));
			PageData jmxx = jmxxService.findById(li); 
			li.put("USER_NAME", jmxx.get("USER_NAME"));
			li.put("SEX", jmxx.get("SEX"));
			li.put("AGE", GetAgeByBirthDay.getAgeByBirthDay(jmxx.get("BIRTHDAY_TIME").toString()));
			Page Data = new Page();
			li.put("RESIDENT_QUESTIONNAIRE_ID", li.get("ID"));
			Data.setPd(li);
			List<PageData> listResults = indexDiseaseAdviceService.list(Data);//居民问卷诊断列表
			String result = "";
			for(PageData listResult : listResults) {
				result += result.equals("") ? listResult.get("DISEASECODE_NAME") : "、" + listResult.get("DISEASECODE_NAME").toString();
			}
			li.put("RESULT", result);
			listss.add(li);
		}
		mv.setViewName("gp/indexresidentquesresult/indexresidentquesresult_list");
		mv.addObject("varList", listss);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
		
	}
	/**
	 * 生成报告
	 */
	@RequestMapping(value="/report")
	public ModelAndView report(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示居民问卷结果报告");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得居民的信息
		PageData pdJmxx = jmxxService.findById(pd);
		mv.addObject("pdJmxx", pdJmxx);
		PageData pdques = screeningQuestionnaireService.findById(pd);//获得问卷信息
		mv.addObject("pd", pd);
		mv.addObject("pdques", pdques);
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());//当前状态为删除状态
		pd.put("IS_FINISH", EnumQuesState.SUBMIT.getCode());//当前状态为问卷状态
		//问卷结果列表
		page.setPd(pd);
		List<PageData> quesResultList = residentQuestionnaireResultService.findByResidentQuesId(page);
		List<PageData> indexCombinationList = questionnaireCombinationService.findByScreeningId(pdques);//获得指标组合的ID列表	
		mv.addObject("indexCombinationList", indexCombinationList);
		//遍历指标组合得到每个组合的的指标(问卷)
		Map<String, List<PageData>> indexsMap = new HashMap<>();
		for(PageData indexCombination: indexCombinationList){
			
			//获得当前的指标组合的列表
			String indexCombinationId = indexCombination.getString("ID");
			List<PageData> indexpdList = indexCombinationRelationService.findByCombinationId(indexCombination);
			List<PageData> indexList = new ArrayList<PageData>();
			//给指标一个结果和描述
			for(PageData indexpd : indexpdList){
				for(PageData quesResult : quesResultList) {
					if(quesResult.getString("INDEX_ID").equals(indexpd.getString("ID"))) {
						
						if(indexpd.getString("RESULT_MODEL").equals(Integer.toString(EnumModelType.UPPULL.getCode())))	{
							PageData model = new PageData();//结果模板
							model.put("ID", quesResult.get("SCREENING_RESULT"));
							model = indexResultModelService.findById(model);
							indexpd.put("SCREENING_RESULT", model.get("MODEL_NAME"));
							indexpd.put("MESSAGE_CONTENT", model.get("MESSAGE_CONTENT"));
							break;
						}
						else {
							indexpd.put("SCREENING_RESULT", quesResult.get("SCREENING_RESULT"));
							break;
						}
						
					}
				}
				indexList.add(indexpd);
			}
			indexsMap.put(indexCombinationId, indexList);
		}
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("indexsMap",indexsMap);
		mv.addObject("quesResultList", quesResultList);
		mv.setViewName("gp/indexresidentquesresult/index_report");
		return mv;
		
	}
	/**
	 * 生成建议
	 */
	@RequestMapping(value="/suggestion")
	public ModelAndView suggestion(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示居民问卷生成建议");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexresidentquesresult/index_suggestion");
		return mv;
	}
	/**
	 * 调用健康档案接口
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/health")
	public ModelAndView health() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"调用居民的健康档案");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		String healthRecordUrl = "";
		if(pd.get("CARDID")!=null) healthRecordUrl = GetGrdaUrl.getGrdaUrl(pd.getString("CARDID"));
		mv.addObject("healthRecordUrl", healthRecordUrl);
		mv.setViewName("gp/indexresidentquesresult/health");
		return mv;
	}

}

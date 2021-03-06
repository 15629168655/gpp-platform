package com.tbyf.controller.gp.indexresidentques;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumFitSex;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumIsLimitAge;
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
import com.tbyf.service.gp.index.score.IndexScoreManager;
import com.tbyf.service.gp.index.screeningcombination.QuestionnaireCombinationManager;
import com.tbyf.service.gp.index.screeningquestionnarie.ScreeningQuestionnaireManager;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.DecimalConversion;
import com.tbyf.util.GetAgeByBirthDay;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**居民指标问卷
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexResidentQuse")
public class IndexResidentQuesController extends BaseController{

	String menuUrl = "indexResidentQuse/list.do"; //菜单地址(权限用)
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
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseaseCodeService;//疾病编码
	@Resource(name="indexDiseaseAdviceService")
	private IndexDiseaseAdviceManager indexDiseaseAdviceService;//疾病建议关联
	@Resource(name="indexScoreService")
	private IndexScoreManager indexScoreService;//评分等级
	
	/**显示居民问卷问卷表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示居民问卷列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	list = residentQuestionnaireService.list(page);  //列表
		List<PageData> listss = new ArrayList<PageData>();//带有居民信息的列表
		for(PageData li : list) {
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
		mv.setViewName("gp/indexresidentqusetionnaire/indexresidentqusetionnaire_list");
		mv.addObject("varList", listss);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存居民问卷");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	
		String nowDate = Tools.date2Str(new Date());
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		pd.put("IS_FINISH", "0");	//问卷状态
		residentQuestionnaireService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_COMPANY", getCurUser().getOrgName());//当前用户所在的单位
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexresidentqusetionnaire/indexresidentqusetionnaire_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查编辑");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		residentQuestionnaireService.update(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"问卷调查编辑界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = residentQuestionnaireService.findById(pd);	//根据ID读取
		pd.put("USER_AGENT_ID", pd.get("RESIDENT_ID").toString());
		pd.put("RESIDENT_NAME", jmxxService.findById(pd).get("USER_NAME").toString());//居民的信息录入
		pd.put("SID", pd.get("SCREENING_QUESTIONNAIRE_ID").toString());
		pd.put("SCREENING_QUESTIONNAIRE_NAME", screeningQuestionnaireService.findBySId(pd).get("QUESTIONNAIRE_NAME").toString());//筛查问卷的姓名
		mv.setViewName("gp/indexresidentqusetionnaire/indexresidentqusetionnaire_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"删除问卷调查");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTIONNAIRE_STATE", EnumIndexState.DEL.getCode());
		residentQuestionnaireService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量问卷调查");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("IDS"));
		String[] ids = str.split(",");
		residentQuestionnaireService.delAll(ids);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 居民答卷
	 */
	@RequestMapping(value="/residentQues")
	public ModelAndView residentQues()throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"居民问卷");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得居民的信息
		PageData pdJmxx = jmxxService.findById(pd);
		//获得居民的年龄
		int age = GetAgeByBirthDay.getAgeByBirthDay(pdJmxx.get("BIRTHDAY_TIME").toString());
		//获得居民的性别
		String sex = pdJmxx.get("SEX").toString();
		mv.addObject("pdJmxx", pdJmxx);
		PageData pdques = screeningQuestionnaireService.findById(pd);//获得问卷信息
		mv.addObject("pd", pd);
		mv.addObject("pdques", pdques);
		pdques.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());//指标组合为正常状态
		List<PageData> indexCombinationList = questionnaireCombinationService.findByScreeningId(pdques);//获得指标组合的ID列表	
		mv.addObject("indexCombinationList", indexCombinationList);
		//遍历指标组合得到每个组合的的指标(问卷)
		Map<String, List<PageData>> indexsMap = new HashMap<>();
		Map<String, List<PageData>> indexResultRangesMap = new HashMap<>();
		Map<String, List<PageData>> indexResultModelsMap = new HashMap<>();
		for(PageData indexCombination: indexCombinationList){
			
			//获得当前的指标组合的列表
			String indexCombinationId = indexCombination.getString("ID");
			indexCombination.put("INDEX_STATE", EnumIndexState.NORAML.getCode());//指标状态正常
			List<PageData> indexpdList = indexCombinationRelationService.findByCombinationId(indexCombination);
			indexsMap.put(indexCombinationId, indexpdList);
			for(PageData indexpd: indexpdList) {
				indexpd.put("RESULT_MODEL_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
				indexpd.put("RESULT_RANGE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
				String indexId = indexpd.getString("ID");//指标ID、作为Map的
				List<PageData> indexResultRangeList = indexResultRangeService.findByIndexId(indexpd);
				List<PageData> indexResultRanges = new ArrayList<PageData>();
				//获得指标的结果范围----有性别和年龄的限制
				for(PageData indexResultRange : indexResultRangeList) {
					if(indexResultRange.get("FIT_SEX").toString().equals(Integer.toString(EnumFitSex.ANY.getCode())) || indexResultRange.get("FIT_SEX").toString().equals(sex)) {//判断年龄是否规范
						//判断是否限制年龄
						if(indexResultRange.get("IS_LIMIT_AGE").toString().equals(Integer.toString(EnumIsLimitAge.NOTLIMIT.getCode()))) {
							indexResultRanges.add(indexResultRange);
							break;
						}
						else if(age >= Integer.parseInt(indexResultRange.get("AGE_DOWN").toString()) && age <= Integer.parseInt(indexResultRange.get("AGE_UP").toString())){//判断年龄是否规范
							indexResultRanges.add(indexResultRange);
							break;
						}
					}
				}
				indexResultRangesMap.put(indexId, indexResultRanges);
				//获得指标的模板
				indexResultModelsMap.put(indexId, indexResultModelService.findByIndexId(indexpd));
			}
		}
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("indexsMap",indexsMap);
		mv.addObject("indexResultRangesMap",indexResultRangesMap);
		mv.addObject("indexResultModelsMap",indexResultModelsMap);
		mv.setViewName("gp/indexresidentqusetionnaire/resident_ques");
		return mv;
	}
	/**
	 * 居民答卷保存
	 */
	@RequestMapping(value="/saveQues")
	public ModelAndView saveQues()throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"居民答卷保存");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得居民的信息
		PageData pdJmxx = jmxxService.findById(pd);
		//获得居民的年龄
		int age = GetAgeByBirthDay.getAgeByBirthDay(pdJmxx.get("BIRTHDAY_TIME").toString());
		//获得居民的性别
		String sex = pdJmxx.get("SEX").toString();
		//获得问卷信息
		PageData pdques = screeningQuestionnaireService.findById(pd);
		//获取指标ID
		@SuppressWarnings("unchecked")
		Set<String> indexIdMap = pd.keySet();//获得传入的name
		//将name转化成数组
		String [] indexString = new String[indexIdMap.size()];
		String nowDate = Tools.date2Str(new Date());//创建的时间
		String resultDisease = "";
		int i = 0;//指标组合的下标
		int score = 0;//指标总分
		for (String str : indexIdMap) {  
			indexString[i++] = str.length() > Constants.uuidLength ? str.substring(0,Constants.uuidLength) : str;
		}  
		//查询居民问卷过的指标组合列表
		List<PageData> indexCombinationList = indexCombinationService.findByMostId(indexString);
		//循环指标组合，保存居民问卷
		for(PageData indexCombination : indexCombinationList) {
			//每个指标组合包含的指标
			indexCombination.put("INDEX_STATE", EnumIndexState.NORAML.getCode());//指标状态正常
			List<PageData> indexList = indexCombinationRelationService.findByCombinationId(indexCombination);
			//保存居民问卷
			for(PageData indexs : indexList) {
				indexs.put("RESULT_MODEL_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
				indexs.put("RESULT_RANGE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
				PageData pdQresult = new PageData();
				pdQresult.put("ID", this.get32UUID());//ID
				pdQresult.put("RESIDENT_QUESTIONNAIRE_ID", pd.get("QUES_ID"));//居民问卷ID
				pdQresult.put("SCREENING_ID", pd.get("ID"));//筛查问卷ID
				pdQresult.put("INDEX_COMBINATION_ID", indexCombination.get("ID"));//指标组合ID
			    pdQresult.put("INDEX_COMBINATION_NAME", indexCombination.get("INDEX_COMBINATION_NAME"));//指标组合的名称
				pdQresult.put("COMPANY",pdques.get("COMPANY"));//单位
				pdQresult.put("DEPARTMENT", pdques.get("DEPARTMENT"));//科室
				pdQresult.put("INDEX_ID",indexs.get("ID"));//指标ID
				pdQresult.put("INDEX_CODE", indexs.get("INDEX_CODE"));//指标编码
				pdQresult.put("INDEX_NAME", indexs.get("INDEX_NAME"));//指标名称
				pdQresult.put("RESULT_TYPE", indexs.get("RESULT_TYPE"));//结果类型
				pdQresult.put("PY_CODE", indexs.get("PY_CODE"));//拼音编码
				pdQresult.put("INDEX_CODE", indexs.get("INDEX_CODE"));//排序Q_RESULT_ORDER
				pdQresult.put("NORMAL_RESULT", indexs.get("NORMAL_RESULT"));//正常结果
				pdQresult.put("SCREENING_TYPE", indexs.get("SCREENING_INDEX"));//指标的类型SCREENING_TYPE
				pdQresult.put("IS_GIVE_UP", "1");//是否放弃
				//获得参考方位，-----当模板结果为下拉的时候，则要循环模板，否则循环结果范围
				String referRange = "";
				String des ="";//诊断描述
				if(indexs.get("RESULT_MODEL").equals(Integer.toString(EnumModelType.UPPULL.getCode()))) {
					//用户填写的结果
					PageData rModel = new PageData();
					rModel.put("ID", pd.get(indexCombination.get("ID").toString() + indexs.get("ID").toString()).toString().substring(2 *  Constants.uuidLength, 3 * Constants.uuidLength));
					 //参考范围是模板名称遍历
					rModel = indexResultModelService.findById(rModel);
					pdQresult.put("IS_POSITIVE", rModel.get("IS_POSITIVE"));//是否呈阳性
					int modelScore = Integer.parseInt(rModel.get("MODEL_SCORE").toString());//模板分数
					score += modelScore;
					pdQresult.put("INDEX_SCORE", modelScore);//指标的分数
					if(rModel.get("IS_POSITIVE").toString().equals(Integer.toString(EnumIsPositive.POSITIVE.getCode()))) {	//判断是否呈阳性
						//呈阳性保存疾病到关联表
						PageData pdDisease = new PageData();
						pdDisease.put("ID", this.get32UUID());
						pdDisease.put("RESIDENT_QUESTIONNAIRE_ID", pd.get("QUES_ID"));//居民问卷ID	RESIDENT_QUESTIONNAIRE_ID
						pdDisease.put("INDEX_RESULT_ID", pdQresult.get("ID"));//指标结果ID	 INDEX_RESULT_ID
						pdDisease.put("JBBM", rModel.get("DISEASE_ID"));//疾病ID	DISEASECODE_ID
						String diseaseName = diseaseCodeService.findByDiseaseCode(pdDisease).get("JBMC").toString();//疾病名称
						resultDisease += resultDisease.equals("") ?  diseaseName : "、" + diseaseName;
						pdDisease.put("DISEASECODE_NAME", diseaseName);//疾病名称	
						pdDisease.put("RELATION_ORDER", 1);//关联的排序	RELATION_ORDER
						indexDiseaseAdviceService.save(pdDisease);//保存疾病
					}
					pdQresult.put("SCREENING_RESULT", rModel.get("MODEL_CONTENT"));//模板名称
					pdQresult.put("DESCRIBE", rModel.get("DIAGNOSIS_DISCRIBE"));//诊断描述
					List<PageData> modelList = indexResultModelService.findByIndexId(indexs);
					for(PageData model : modelList) {
						referRange +=  model.get("MODEL_CONTENT").toString();
					}
				}
				else {
					//用户填写的结果范围
					pdQresult.put("SCREENING_RESULT", pd.get(indexCombination.get("ID").toString() + indexs.get("ID").toString()));//指标的结果
					List<PageData> rangeList = indexResultRangeService.findByIndexId(indexs);//获得该指标的指标组合的范围列表
					for(PageData range : rangeList) {
						if(range.get("FIT_SEX").toString().equals(Integer.toString(EnumFitSex.ANY.getCode())) || range.get("FIT_SEX").toString().equals(sex)) {//判断年龄是否规范
							if(range.get("IS_LIMIT_AGE").toString().equals(Integer.toString(EnumIsLimitAge.NOTLIMIT.getCode()))) {
								referRange += range.get("RESULT_DOWN").toString() + "～" + range.get("RESULT_UP").toString() + "～";
								//查看结果是否异常
								Double result = Double.parseDouble(pdQresult.get("SCREENING_RESULT").toString());
								if(result <= Double.parseDouble(range.get("RESULT_UP").toString())) {
									//加入低值提示
									des += range.get("LOW_DISEASE_ID") + "_" + range.get("LOW_CONTENT").toString() + "_" + range.get("LOW_COLOUR").toString() + "_";//加入低值疾病ID和低值提示的内容
									pdQresult.put("IS_POSITIVE", EnumIsPositive.POSITIVE.getCode());//是否呈阳性
									//呈阳性保存疾病到关联表
									PageData pdDisease = new PageData();
									pdDisease.put("ID", this.get32UUID());
									pdDisease.put("RESIDENT_QUESTIONNAIRE_ID", pd.get("QUES_ID"));//居民问卷ID	RESIDENT_QUESTIONNAIRE_ID
									pdDisease.put("INDEX_RESULT_ID", pdQresult.get("ID"));//指标结果ID	 INDEX_RESULT_ID
									pdDisease.put("JBBM", range.get("LOW_DISEASE_ID"));//疾病ID	DISEASECODE_ID
									String diseaseName = diseaseCodeService.findByDiseaseCode(pdDisease).get("JBMC").toString();//疾病名称
									resultDisease += resultDisease.equals("") ?  diseaseName : "、" + diseaseName;
									pdDisease.put("DISEASECODE_NAME", diseaseName);//疾病名称	
									pdDisease.put("RELATION_ORDER", 1);//关联的排序	RELATION_ORDER
									indexDiseaseAdviceService.save(pdDisease);//保存疾病
								}
								else if(result >= Double.parseDouble(range.get("RESULT_DOWN").toString())){
									des += range.get("HIG_DISEASE_ID") + "_" + range.get("HIG_CONTENT").toString() + "_" + range.get("HIG_COLOUR").toString() + "_"; //加入高值疾病ID和低值提示的内容
									pdQresult.put("IS_POSITIVE", EnumIsPositive.POSITIVE.getCode());//是否呈阳性
									//呈阳性保存疾病到关联表
									PageData pdDisease = new PageData();
									pdDisease.put("ID", this.get32UUID());
									pdDisease.put("RESIDENT_QUESTIONNAIRE_ID", pd.get("QUES_ID"));//居民问卷ID	RESIDENT_QUESTIONNAIRE_ID
									pdDisease.put("INDEX_RESULT_ID", pdQresult.get("ID"));//指标结果ID	 INDEX_RESULT_ID
									pdDisease.put("JBBM", range.get("HIG_DISEASE_ID"));//疾病ID	DISEASECODE_ID
									String diseaseName = diseaseCodeService.findByDiseaseCode(pdDisease).get("JBMC").toString();//疾病名称
									resultDisease += resultDisease.equals("") ?  diseaseName : "、" + diseaseName;
									pdDisease.put("DISEASECODE_NAME", diseaseName);//疾病名称	
									pdDisease.put("RELATION_ORDER", 1);//关联的排序	RELATION_ORDER
									indexDiseaseAdviceService.save(pdDisease);//保存疾病
								}
								else {
									des = "结果正常";
									pdQresult.put("IS_POSITIVE", EnumIsPositive.NOTPOSITIVE.getCode());//是否呈阳性
								}
								break;
							}
							else if(age >= Integer.parseInt(range.get("AGE_DOWN").toString()) && age <= Integer.parseInt(range.get("AGE_UP").toString())){//判断年龄是否规范
								referRange += range.get("RESULT_DOWN").toString() + "～" + range.get("RESULT_UP").toString() + "～";
								//查看结果是否异常
								Double result = Double.parseDouble(pdQresult.get("SCREENING_RESULT").toString());
								if(result <= Double.parseDouble(range.get("RESULT_UP").toString())) {
									//加入低值提示
									des += range.get("LOW_DISEASE_ID") + "_" + range.get("LOW_CONTENT").toString() + "_" + range.get("LOW_COLOUR").toString() + "_";//加入低值疾病ID和低值提示的内容
									pdQresult.put("IS_POSITIVE", EnumIsPositive.POSITIVE.getCode());//是否呈阳性
									//呈阳性保存疾病到关联表
									PageData pdDisease = new PageData();
									pdDisease.put("ID", this.get32UUID());
									pdDisease.put("RESIDENT_QUESTIONNAIRE_ID", pd.get("QUES_ID"));//居民问卷ID	RESIDENT_QUESTIONNAIRE_ID
									pdDisease.put("INDEX_RESULT_ID", pdQresult.get("ID"));//指标结果ID	 INDEX_RESULT_ID
									pdDisease.put("JBMC", range.get("LOW_DISEASE_ID"));//疾病ID	DISEASECODE_ID
									String diseaseName = diseaseCodeService.findByDiseaseCode(pdDisease).get("JBMC").toString();//疾病名称
									resultDisease += resultDisease.equals("") ?  diseaseName : "、" + diseaseName;
									pdDisease.put("DISEASECODE_NAME", diseaseName);//疾病名称	
									pdDisease.put("RELATION_ORDER", 1);//关联的排序	RELATION_ORDER
									indexDiseaseAdviceService.save(pdDisease);//保存疾病
									
								}
								else if(result >= Double.parseDouble(range.get("RESULT_DOWN").toString())){
									des += range.get("HIG_DISEASE_ID") + "_" + range.get("HIG_CONTENT").toString() + "_" + range.get("HIG_COLOUR").toString() + "_"; //加入高值疾病ID和低值提示的内容
									pdQresult.put("IS_POSITIVE", EnumIsPositive.POSITIVE.getCode());//是否呈阳性
									//呈阳性保存疾病到关联表
									PageData pdDisease = new PageData();
									pdDisease.put("ID", this.get32UUID());
									pdDisease.put("RESIDENT_QUESTIONNAIRE_ID", pd.get("QUES_ID"));//居民问卷ID	RESIDENT_QUESTIONNAIRE_ID
									pdDisease.put("INDEX_RESULT_ID", pdQresult.get("ID"));//指标结果ID	 INDEX_RESULT_ID
									pdDisease.put("DISEASECODE_ID", range.get("HIG_DISEASE_ID"));//疾病ID	DISEASECODE_ID
									String diseaseName = diseaseCodeService.findById(pdDisease).get("JBMC").toString();//疾病名称
									resultDisease += resultDisease.equals("") ?  diseaseName : "、" + diseaseName;
									pdDisease.put("DISEASECODE_NAME", diseaseName);//疾病名称	
									pdDisease.put("RELATION_ORDER", 1);//关联的排序	RELATION_ORDER
									indexDiseaseAdviceService.save(pdDisease);//保存疾病
								}
								else {
									des = "结果正常";
									pdQresult.put("IS_POSITIVE", EnumIsPositive.NOTPOSITIVE.getCode());//是否呈阳性
								}
								break;
							}
						}
					}
					pdQresult.put("DESCRIBE", des);//诊断描述
				}
				pdQresult.put("REFER_RANGE", referRange);//参考范围
				pdQresult.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());//问卷的状态
				pdQresult.put("CREAT_TIME", nowDate);//创建时间
				pdQresult.put("EDIT_TIME", nowDate);//修改时间
				residentQuestionnaireResultService.save(pdQresult);//保存一个问卷结果
			}
		}
		pd.put("RANK", this.getRank(pd, score));
		pd.put("ID", pd.get("QUES_ID"));//获得居民问卷ID改变其运行状态
		pd.put("IS_FINISH", EnumQuesState.SUBMIT.getCode());//完成答卷
		resultDisease = resultDisease.equals("") ? "正常" : resultDisease;
		pd.put("QUESTIONNAIRE_RESULT", resultDisease);
		pd.put("EDIT_TIME", nowDate);//修改时间
		pd.put("SCORE", score);//问卷得分
		residentQuestionnaireService.updateScore(pd);//改问卷状态为提交
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 居民答卷显示详情
	 */
	@RequestMapping(value="/viewQues")
	public ModelAndView viewQues(Page page)throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"居民问卷结果详情");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得居民的信息
		PageData pdJmxx = jmxxService.findById(pd);
		//获得居民的年龄
		int age = GetAgeByBirthDay.getAgeByBirthDay(pdJmxx.get("BIRTHDAY_TIME").toString());
		//获得居民的性别
		String sex = pdJmxx.get("SEX").toString();
		mv.addObject("pdJmxx", pdJmxx);
		PageData pdques = screeningQuestionnaireService.findById(pd);//获得问卷信息
		mv.addObject("pd", pd);
		mv.addObject("pdques", pdques);
		pd.put("QUESTIONNAIRE_STATE",EnumIndexState.NORAML.getCode());
		//问卷结果列表
		page.setPd(pd);
		pdques.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());//指标组合为正常状态
		List<PageData> quesResultList = residentQuestionnaireResultService.findByResidentQuesId(page);
		
		List<PageData> indexCombinationList = questionnaireCombinationService.findByScreeningId(pdques);//获得指标组合的ID列表	
		mv.addObject("indexCombinationList", indexCombinationList);
		//遍历指标组合得到每个组合的的指标(问卷)
		Map<String, List<PageData>> indexsMap = new HashMap<>();
		for(PageData indexCombination: indexCombinationList){
			indexCombination.put("INDEX_STATE", EnumIndexState.NORAML.getCode());//指标状态正常
			//获得当前的指标组合的列表
			String indexCombinationId = indexCombination.getString("ID");
			List<PageData> indexpdList = indexCombinationRelationService.findByCombinationId(indexCombination);
			List<PageData> indexList = new ArrayList<PageData>();
			//给指标一个结果和描述
			for(PageData indexpd : indexpdList){
				for(PageData quesResult : quesResultList) {
					if(quesResult.getString("INDEX_ID").equals(indexpd.getString("ID"))) {
						//下拉状况分析
						if(indexpd.get("RESULT_MODEL").equals(Integer.toString(EnumModelType.UPPULL.getCode())))  {
							indexpd.put("SCREENING_RESULT", quesResult.get("SCREENING_RESULT"));//指标结果
							indexpd.put("DESCRIBE", quesResult.get("DESCRIBE"));//结果描述
							indexpd.put("REFER_RANGE", quesResult.get("REFER_RANGE"));
							indexpd.put("IS_ABNORMAL", quesResult.get("IS_POSITIVE"));
						}
						else {
							//判断结果是否异常，以及提示的颜色和参考范围
							String referRange = quesResult.get("REFER_RANGE").toString();
							indexpd.put("SCREENING_RESULT", quesResult.get("SCREENING_RESULT"));
							Double result = Double.parseDouble(quesResult.get("SCREENING_RESULT").toString());
							String [] rereferRanges = referRange.split("～");
								if(result < Double.parseDouble(rereferRanges[0])) {
									String [] eachRereferResult = quesResult.get("DESCRIBE").toString().split("_");
									indexpd.put("DISEASE_ID", eachRereferResult[0]);//低值疾病ID
									indexpd.put("MSG", eachRereferResult[1]);//低值提示内容
									indexpd.put("COLOUR", DecimalConversion.tenToSixteen(eachRereferResult[2]));//低值显示颜色
									indexpd.put("IS_ABNORMAL" ,quesResult.get("IS_POSITIVE"));//是否异常
								}
								else if(result > Double.parseDouble(rereferRanges[1])) {
									String [] eachRereferResult = quesResult.get("DESCRIBE").toString().split("_");
										indexpd.put("DISEASE_ID", eachRereferResult[0]);//低值疾病ID
										indexpd.put("MSG", eachRereferResult[1]);//低值提示内容
										indexpd.put("COLOUR", DecimalConversion.tenToSixteen(eachRereferResult[2]));//低值显示颜色
										indexpd.put("IS_ABNORMAL" , quesResult.get("IS_POSITIVE"));//是否异常
								}
								else {
									indexpd.put("MSG", "正常");//低值提示内容
									indexpd.put("COLOUR","#FFFFFF");//低值显示颜色
									indexpd.put("IS_ABNORMAL" ,quesResult.get("IS_POSITIVE"));//是否异常
								}
							indexpd.put("REFER_RANGE", referRange); //参考范围
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
		mv.setViewName("gp/indexresidentqusetionnaire/resident_ques_info");
		return mv;
	}
	/**
	 * 通过分数得到评分的等级
	 * @param pd
	 * @param score
	 * @return
	 */
	public String getRank(PageData pd, int score) throws Exception{
		List<PageData> list = indexScoreService.findByScreeningQuesId(pd);  //问卷的评分列表
		for(PageData li : list) {
			int up = Integer.parseInt(li.get("RANGE_UP").toString());//评分级上限
			int down = Integer.parseInt(li.get("RANGE_DOWN").toString());//评分级下限 
			if(score >= down && score <= up) {//正好在这个等级范围内
				return li.get("RANK_DISCRIBE").toString();
			}
		}
		return "其他";
	}
	
}

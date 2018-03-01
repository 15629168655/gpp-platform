package com.tbyf.controller.gp.indexscore;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumModelType;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.combinationrelation.IndexCombinationRelationManager;
import com.tbyf.service.gp.index.residentquestionnarie.ResidentQuestionnaireManager;
import com.tbyf.service.gp.index.resultmodel.IndexResultModelManager;
import com.tbyf.service.gp.index.score.IndexScoreManager;
import com.tbyf.service.gp.index.screeningcombination.QuestionnaireCombinationManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 指标分数详情
 * @author zanxc
 * @创建日期2017年8月7日上午11:17:18
 */
@Controller
@RequestMapping(value="/indexScore")
public class IndexScoreController extends BaseController{

	String menuUrl = "indexScore/list.do"; //菜单地址(权限用)
	@Resource(name="indexScoreService")
    private IndexScoreManager indexScoreService;//指标分数Service
	@Resource(name="questionnaireCombinationService")
    private QuestionnaireCombinationManager questionnaireCombinationService;//筛查问卷关联
	@Resource(name="indexCombinationRelationService")
	private IndexCombinationRelationManager indexCombinationRelationService;//指标组合关联
	@Resource(name="indexResultModelService")
	private IndexResultModelManager indexResultModelService;//指标结果模板
	@Resource(name="residentQuestionnaireService")
	private ResidentQuestionnaireManager residentQuestionnaireService;//指标结果模板
	/**显示指标结果模板
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示评分细则");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//通过问卷ID查询所有的指标组合
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());
		List<PageData> indexCombinationList = questionnaireCombinationService.findByScreeningId(pd);
		List<PageData> indexs = new ArrayList<PageData>();
		//问卷总分
		int amount = 0;
		//问卷最大分数
		int mamount = 0;
		//通过指标组合ID查询所有的指标
		for(PageData indexCombination : indexCombinationList) {
			//获得当前的指标组合的指标列表
			indexCombination.put("INDEX_STATE", EnumIndexState.NORAML.getCode());
			List<PageData> indexpdList = indexCombinationRelationService.findByCombinationId(indexCombination);
			for(PageData indexpd: indexpdList) {
				indexpd.put("RESULT_MODEL_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
				if(indexpd.get("RESULT_MODEL").equals(Integer.toString(EnumModelType.UPPULL.getCode()))) {//当结果类型为下拉时表明有分数
					int max = 0;//最大的模板分数
					List<PageData> indexResultModels = indexResultModelService.findByIndexId(indexpd);//查询指标的模板
					for(int i = 0 ; i < indexResultModels.size(); i ++) {//循环指标模板
						PageData li = new PageData();
						int modelScore = Integer.parseInt(indexResultModels.get(i).get("MODEL_SCORE").toString());//模板的分数
						amount += modelScore;//评价分数累计
						if(max < modelScore) {//获得最大 的模板分数
							max = modelScore;
						}
						if(i == 0 ) {//第一个模板前面加上指标名称
							li.put("INDEX_NAME", indexpd.get("INDEX_NAME").toString() + " : " +indexResultModels.get(i).get("MODEL_CONTENT").toString());//得到评的指标
						}
						else {
							//获得指标名称的长度
							li.put("INDEX_NAME", indexResultModels.get(i).get("MODEL_CONTENT").toString());//同上
						}
						li.put("INDEX_SCORE", modelScore);//评价指标结果得到相应的分数
						indexs.add(li);//得到平量表
				}
					mamount += max;//做大的模板分数
				}
				//获得指标的模板
			}
		}
		pd.put("AMOUNT", amount);
		pd.put("MAMOUNT", mamount);
		List<PageData> list = indexScoreService.findByScreeningQuesId(pd);  //列表
		pd.put("SCORE_RANK", list.size());
		mv.setViewName("gp/indexscore/index_score_info");
		mv.addObject("varList", indexs);
		mv.addObject("scoreList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存一条问卷调查表");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		int scoreRank =Integer.parseInt(pd.get("SCORE_RANK").toString());
		//判断是否定义评价的范围
		List<PageData> list = indexScoreService.findByScreeningQuesId(pd);  //列表
		if(null != list) {
			indexScoreService.deleteByScreeningQuesId(pd);//删除该评价的指标
		}
		for(int i = 0; i < scoreRank; i++) {
			PageData scorePd = new PageData();
			scorePd.put("ID", this.get32UUID());//主键
			scorePd.put("SCREENING_QUESTIONNAIRE_ID", pd.get("ID"));//筛查问卷ID
			scorePd.put("MOUNT_SCORE", pd.get("MOUNT_SCORE"));//MOUNT_SCORE//总分
			scorePd.put("SCORE_RANK", pd.get("SCORE_RANK"));//SCORE_RANK
			scorePd.put("RANK_DISCRIBE", pd.get("RANK_DISCRIBE" + i));//RANK_DISCRIBE
			scorePd.put("RANGE_DOWN", pd.get("RANGE_DOWN" + i));//RANGE_DOWN
			scorePd.put("RANGE_UP", pd.get("RANGE_UP" + i));//RANGE_UP
			scorePd.put("SCORE_ORDER", i + 1);//
			indexScoreService.save(scorePd);//保存一个评分等级
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	} 
	/**显示指标结果模板
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listScoreResult")
	public ModelAndView listScoreResult(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示评分细则");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdResidentQues = new PageData();
		pdResidentQues.put("ID", pd.get("RQID"));//居民问卷ID
		pdResidentQues = residentQuestionnaireService.findById(pdResidentQues);
		//通过问卷ID查询所有的指标组合
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());
		List<PageData> indexCombinationList = questionnaireCombinationService.findByScreeningId(pd);
		List<PageData> indexs = new ArrayList<PageData>();
		//问卷总分
		int amount = 0;
		//问卷最大分数
		int mamount = 0;
		//通过指标组合ID查询所有的指标
		for(PageData indexCombination : indexCombinationList) {
			//获得当前的指标组合的指标列表
			indexCombination.put("INDEX_STATE", EnumIndexState.NORAML.getCode());
			List<PageData> indexpdList = indexCombinationRelationService.findByCombinationId(indexCombination);
			for(PageData indexpd: indexpdList) {
				indexpd.put("RESULT_MODEL_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
				if(indexpd.get("RESULT_MODEL").equals(Integer.toString(EnumModelType.UPPULL.getCode()))) {//当结果类型为下拉时表明有分数
					int max = 0;//最大的模板分数
					List<PageData> indexResultModels = indexResultModelService.findByIndexId(indexpd);//查询指标的模板
					for(int i = 0 ; i < indexResultModels.size(); i ++) {//循环指标模板
						PageData li = new PageData();
						int modelScore = Integer.parseInt(indexResultModels.get(i).get("MODEL_SCORE").toString());//模板的分数
						amount += modelScore;//评价分数累计
						if(max < modelScore) {//获得最大 的模板分数
							max = modelScore;
						}
						if(i == 0 ) {//第一个模板前面加上指标名称
							li.put("INDEX_NAME", indexpd.get("INDEX_NAME").toString() + " : " +indexResultModels.get(i).get("MODEL_CONTENT").toString());//得到评的指标
						}
						else {
							//获得指标名称的长度
							li.put("INDEX_NAME", indexResultModels.get(i).get("MODEL_CONTENT").toString());//同上
						}
						li.put("INDEX_SCORE", modelScore);//评价指标结果得到相应的分数
						indexs.add(li);//得到平量表
				}
					mamount += max;//做大的模板分数
				}
				//获得指标的模板
			}
		}
		pd.put("AMOUNT", amount);
		pd.put("MAMOUNT", mamount);
		List<PageData> list = indexScoreService.findByScreeningQuesId(pd);  //列表
		pd.put("SCORE_RANK", list.size());
		mv.setViewName("gp/indexscore/index_score_result");
		mv.addObject("varList", indexs);
		mv.addObject("scoreList", list);
		mv.addObject("pdResidentQues", pdResidentQues);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
}

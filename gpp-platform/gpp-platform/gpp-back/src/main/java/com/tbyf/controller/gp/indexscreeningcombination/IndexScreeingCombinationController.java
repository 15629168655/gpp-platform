package com.tbyf.controller.gp.indexscreeningcombination;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumFitSex;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.combination.IndexCombinationManager;
import com.tbyf.service.gp.index.screeningcombination.QuestionnaireCombinationManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
/**
 * 调查问卷组合
 * @author ad
 *
 */
@Controller
@RequestMapping(value="/indexQuestionnaireCombination")
public class IndexScreeingCombinationController extends BaseController{

	String menuUrl = "indexQuestionnaireCombination/list.do"; //菜单地址(权限用)
	@Resource(name="questionnaireCombinationService")
    private  QuestionnaireCombinationManager questionnaireCombinationService;//问卷组合
	@Resource(name="indexCombinationService")
    private IndexCombinationManager indexCombinationService;
	/**调查问卷组合
	 * 
	 * @param page
	 * @return
	 */
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	/**显示指标组合关联列表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示问卷关联列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型
		pd = this.getPageData();
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());
		//System.out.println(pd);
		page.setPd(pd);
		List<PageData>	list = questionnaireCombinationService.list(page);  //列表
		mv.setViewName("gp/indexquestionnairecombination/indexquestionnairecombination_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量添加关联组合");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println(pd);
		String SCREENING_QUESTIONNAIRE_ID = pd.getString("QUESTIONNAIRE_ID");//问卷ID		System.out.println(pd);
		String str=String.valueOf(pd.get("IDS"));
		PageData pds = pd;
		String[] ids = str.split(",");
		for(int i = 0 ; i < ids.length; i++) {
			pds.put("ID", this.get32UUID());					//主键
			pds.put("SCREENING_QUESTIONNAIRE_ID", SCREENING_QUESTIONNAIRE_ID);
			pds.put("INDEX_COMBINATION_ID", ids[i]);
			questionnaireCombinationService.save(pds);
			pds.clear();
		}
		pd.put("msg", "ok");
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"问卷组合新增关联界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("CHROICDISEASETYPE", dictionariesService.queryDictionary(Constants.DICT_CHROIN_DISEASE_TYPE));  //慢病类型
		pd = this.getPageData();
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	list = questionnaireCombinationService.findByNot(page);  //列表
		mv.addObject("pd", pd);
		mv.addObject("varList", list);
		mv.setViewName("gp/indexquestionnairecombination/indexquestionnairecombination_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除组合关联管理");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.DEL.getCode());
		questionnaireCombinationService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删检查关联指标组合");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("IDS"));
		String[] ids = str.split(",");
		questionnaireCombinationService.delAll(ids);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

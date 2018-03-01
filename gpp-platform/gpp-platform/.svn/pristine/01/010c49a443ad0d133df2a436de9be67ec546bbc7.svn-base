package com.tbyf.controller.gp.indexresidentquesresultstatistics;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.tbyf.entity.enums.EnumDiseaseCode;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumIsDisease;
import com.tbyf.entity.enums.EnumIsImprotantP;
import com.tbyf.entity.enums.EnumIsPositive;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.diseaseadvice.IndexDiseaseAdviceManager;
import com.tbyf.service.gp.index.quesresultstatistics.QuesResultStatisticsManager;
import com.tbyf.service.gp.index.residentquestionnarie.ResidentQuestionnaireManager;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.service.system.dictionaries.DictionariesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Constants;
import com.tbyf.util.GetAgeByBirthDay;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
/**
 * 居民问卷结果统计(问卷量、工作量的统计、)
 * @author ad
 *
 */
@Controller
@RequestMapping(value="/quesResultStatistic")
public class QuesResultStatistic extends BaseController{
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;//数据字典
	@Resource(name="quesResultStatisticsService")
	private QuesResultStatisticsManager quesResultStatisticsService;//问卷结果统计
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;//居民信息
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;//居民信息
	@Resource(name="residentQuestionnaireService")
	private ResidentQuestionnaireManager residentQuestionnaireService;//居民信息
	@Resource(name="indexDiseaseAdviceService")
	private IndexDiseaseAdviceManager indexDiseaseAdviceService;//问卷建议
	/**
	 * 筛查人数统计
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/StatisticList", method = RequestMethod.GET)
    public ModelAndView showOrderShow(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mv = this.getModelAndView();
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.setViewName("gp/indexresidentquesresultsta/index_result_list");
		return mv;
    }
	
	/**
	 * 柱图
	 * 统计条件：（不选择就统计全部）、单位名称、筛查类型
	 * 显示列：年龄段、男性人数、女性人数、合计
	 */
	@RequestMapping(value="/getChartData")
    @ResponseBody
    public Object getChartData()throws Exception{
        logBefore(logger, "通过统计条件统计筛查人数");
        PageData pd = new PageData();
        pd = this.getPageData();
        Map<String,Object> data = new HashMap<String, Object>();
        String NND = pd.getString("NND");
        if(null!=NND && !NND.equals("")){
        	String[] str = NND.split(",");
        	StringBuffer sb = new StringBuffer("(");
        	for(String s:str){
        		sb.append("'"+s+"',");
        	}
        	
        	pd.put("NND", sb.substring(0, sb.length()-1)+")");
        }
        List<PageData> list = quesResultStatisticsService.SList(pd);
		//求问卷总数的情况
		int amount = 0;//总数
		int Mamount = 0;//男性总数
		int Wamount = 0;//女性总数
		for(PageData mount : list) {
			amount += Integer.parseInt(mount.get("MOUNT").toString());//总数的累计
			Mamount += mount.containsKey("MMOUNT") ? Integer.parseInt(mount.get("MMOUNT").toString()) : 0;//男性的累计
			Wamount += mount.containsKey("WMOUNT") ? Integer.parseInt(mount.get("WMOUNT").toString()) : 0;//女性的累计
		}
    	List yList = new ArrayList<>();
    	List szList = new ArrayList<>();
    	List xzist = new ArrayList<>();
    	List numList = new ArrayList<>();
    	if(null==list ||  list .size()==0){
    		data.put("msg","00"); 
    	}else{
    		for(PageData d:list){
    			yList.add(d.get("NND"));
    			szList.add(d.get("MMOUNT"));
    			xzist.add(d.get("WMOUNT"));
    			numList.add(d.get("MOUNT"));
    		}
    		data.put("xAxis", yList);
    		data.put("sz", szList);
    		data.put("xz", xzist);
    		data.put("num", numList);
    		data.put("amount", amount);
    		data.put("Mamount", Mamount);
    		data.put("Wamount", Wamount);
    	}
        return AppUtil.returnObject(new PageData(), data);
    }
	/**
	 * 医生工作量列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/workLoad", method = RequestMethod.GET)
    public ModelAndView viewDoctorWorkLoad() throws Exception {
		logBefore(logger, "通过统计医生科室的工作量");
		ModelAndView mv = this.getModelAndView();
		mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.setViewName("gp/indexresidentquesresultsta/work_load");
		return mv;
    }
	/**
	 * 统计医生的工作量
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getLoadData")
    @ResponseBody
	public Object getLoadData() throws Exception{
		logBefore(logger, "通过统计条件统计筛查人数");
        PageData pd = new PageData();
        pd = this.getPageData();
        Map<String,Object> data = new HashMap<String, Object>();
        logBefore(logger, "通过统计医生科室的工作量");
        String QUESTIONNAIRE_PEOPLE = pd.getString("QUESTIONNAIRE_PEOPLE");
        if(null!=QUESTIONNAIRE_PEOPLE && !QUESTIONNAIRE_PEOPLE.equals("")){
        	String[] str = QUESTIONNAIRE_PEOPLE.split(",");
        	StringBuffer sb = new StringBuffer("(");
        	for(String s:str){
        		sb.append("'"+s+"',");
        	}
        	
        	pd.put("QUESTIONNAIRE_PEOPLE", sb.substring(0, sb.length()-1)+")");
        }
		List<PageData> list = quesResultStatisticsService.viewDoctorWorkLoad(pd);//医生工作量统计
		//求得总数
		List yList = new ArrayList<>();//科室人员
    	List szList = new ArrayList<>();//工作量
    	List xzist = new ArrayList<>();//比例
		int amount = 0;//工作量总数
		java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00"); //保留两位小数
		for(PageData li : list) {
			amount += Integer.parseInt(li.get("WORK_LOAD").toString());
		}
    	if(null==list ||  list .size()==0){
    		data.put("msg","00"); 
    	}else{
    		for(PageData d:list){
    			//计算比例
    			double rate = Double.parseDouble(d.get("WORK_LOAD").toString())/amount*100;
    			yList.add(d.get("QUESTIONNAIRE_PEOPLE"));
    			szList.add(d.get("WORK_LOAD"));
    			xzist.add(df.format(rate));
    		}
    		data.put("xAxis", yList);
    		data.put("sz", szList);
    		data.put("xz", xzist);
    		data.put("WORK_LOAD_AMOUNT", amount);
    	}
        return AppUtil.returnObject(new PageData(), data);
	}
	/**
	 * 医生工作量详情
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/showinfo")
    public ModelAndView showinfo(Page page) throws Exception {
		logBefore(logger, "显示医生工作量详情");
		ModelAndView mv = this.getModelAndView();
	    PageData pd = new PageData();
	    pd = this.getPageData();
	    page.setPd(pd);
		List<PageData> list = quesResultStatisticsService.findByDoctor(page);
		//通过居民ID查询居民信息
		List<PageData> listAdd = new ArrayList<PageData>();
		for(PageData pds : list) {//遍历居民问卷的信息
			PageData pdResident = new PageData();
			pdResident.put("USER_AGENT_ID", pds.get("RESIDENT_ID"));
			pdResident = jmxxService.findById(pdResident);
			pds.putAll(pdResident);
			pds.put("AGE", GetAgeByBirthDay.getAgeByBirthDay(pds.get("BIRTHDAY_TIME").toString()));//获得年龄
			listAdd.add(pds);
		}
		mv.addObject("varList", listAdd);
		mv.setViewName("gp/indexresidentquesresultsta/work_load_info");
		return mv;
    }
	/**
	 * 疾病统计界面展示
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/diseaseStatistic")
    public ModelAndView diseaseStatistic(Page page) throws Exception {
		logBefore(logger, "显示疾病诊断统计");
		ModelAndView mv = this.getModelAndView();
	    PageData pd = new PageData();
	    pd = this.getPageData();
	    pd.put("IS_POSITIVE", EnumIsPositive.POSITIVE.getCode());
	    mv.addObject("SCREENTYPE", dictionariesService.queryDictionary(Constants.DICT_SCREENING_TYPE));  //筛查的类型
		mv.setViewName("gp/indexresidentquesresultsta/index_disease_list");
		mv.addObject("pd", pd);
		return mv;
    }
	/**
	 * 统计疾病数量的柱状图数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/diseaseStatisticData")
	@ResponseBody
    public Object diseaseStatisticData(Page page) throws Exception {
		logBefore(logger, "显示疾病筛查数据");
		Map<String,Object> data = new HashMap<String, Object>();
	    PageData pd = new PageData();
	    pd = this.getPageData();
	    String DISEASECODE_ID = pd.getString("DISEASECODE_ID");
        if(null!=DISEASECODE_ID && !DISEASECODE_ID.equals("")){
        	String[] str = DISEASECODE_ID.split(",");
        	StringBuffer sb = new StringBuffer("(");
        	for(String s:str){
        		sb.append("'"+s+"',");
        	}
        	
        	pd.put("DISEASECODE_ID", sb.substring(0, sb.length()-1)+")");
        }
        pd.put("IS_POSITIVE", EnumIsPositive.POSITIVE.getCode());
	    page.setPd(pd);
	    List yList = new ArrayList<>();//疾病名称
    	List szList = new ArrayList<>();//筛查疾病数量
    	List jbidList = new ArrayList<>();//疾病ID
		List<PageData> list = quesResultStatisticsService.diseaseMount(page);
		if(null==list ||  list .size()==0){
    		data.put("msg","00"); 
    	}else{
    		for(PageData d:list){
    			//计算比例
    			yList.add(diseasecodeService.findById(d).get("JBMC"));
    			szList.add(d.get("DISEASE_COUNT"));
    			jbidList.add(d.get("DISEASECODE_ID"));
    			
    		}
    		data.put("xAxis", yList);
    		data.put("sz", szList);
    		data.put("jbid", jbidList);
    	}
		return AppUtil.returnObject(new PageData(), data);
    }
	/**
	 * 疾病诊断列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/disDiagnosis")
    public ModelAndView disDiagnosis(Page page) throws Exception {
		logBefore(logger, "疾病诊断列表");
		ModelAndView mv = this.getModelAndView();
	    PageData pd = new PageData();
	    pd = this.getPageData();
	    page.setPd(pd);
	    List<PageData> list = quesResultStatisticsService.findByDisease(page);
		mv.setViewName("gp/indexresidentquesresultsta/index_disease_diagnosis");
		mv.addObject("pd", pd);
		mv.addObject("varList", list);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
    }
	/**
	 * 疾病诊断
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/dis")
    public ModelAndView dis() throws Exception {
		logBefore(logger, "疾病诊断");
		ModelAndView mv = this.getModelAndView();
	    PageData pd = new PageData();
	    pd = this.getPageData();
	    pd = jmxxService.findById(pd);
		mv.setViewName("gp/indexresidentquesresultsta/dis");
		mv.addObject("pd", pd);
		return mv;
    }
	@RequestMapping(value = "report")
    public ModelAndView report() throws Exception {
		logBefore(logger, "筛查报告");
		ModelAndView mv = this.getModelAndView();
	    PageData pd = new PageData();
	    pd = this.getPageData();
	    pd.put("QUESTIONNAIRE_STATE", EnumIndexState.NORAML.getCode());
	    List<PageData> lists = residentQuestionnaireService.findByResidentId(pd);
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
	/**保存居民疾病诊断
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editJmxx")
	public ModelAndView editJmxx(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改居民信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String[] str = pd.get("STR").toString().split(",");
		//疾病诊断
		 for (EnumDiseaseCode type : EnumDiseaseCode.values()) {
			 boolean flag = false;
			 for(int i = 0; i < str.length; i ++) {
				 if(Integer.toString(type.getCode()).equals(str[i])) {
					 flag = true;
				 }
			 }
			 if(flag) {
				 pd.put(type.toString(), EnumIsDisease.IS.getCode());
				 pd.put("ZQRQ", EnumIsImprotantP.YES.getCode());
			 }
			 else {
				 pd.put(type.toString(), EnumIsDisease.NO.getCode());
			 }
	      }
		//System.out.println(pd);
		jmxxService.jmdis(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
}

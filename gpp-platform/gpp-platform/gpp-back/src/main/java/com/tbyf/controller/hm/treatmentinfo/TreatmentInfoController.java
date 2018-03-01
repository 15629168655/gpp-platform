package com.tbyf.controller.hm.treatmentinfo;

import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.diseasecode.*;
import com.tbyf.service.hm.treatmentinfo.*;
import com.tbyf.service.hm.yhry.*;
import com.tbyf.service.system.dictionaries.*;
import com.tbyf.util.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.annotation.*;
import java.io.*;
import java.text.*;
import java.util.*;

/** 
 * 说明：就诊信息
 * 创建人：
 * 创建时间：2016-07-13
 */
@Controller
@RequestMapping(value="/treatmentinfo")
public class TreatmentInfoController extends BaseController {
	
	String menuUrl = "treatmentinfo/list.do"; //菜单地址(权限用)
	@Resource(name="treatmentinfoService")
	private TreatmentInfoManager treatmentinfoService;
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;
    @Resource(name="yhryService")
    private YhryManager yhryService;

    /**医院选择弹窗
     * @param
     * @throws Exception
     */
    @RequestMapping(value="/chooseOrg")
    public ModelAndView chooseJG()throws Exception{
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("hm/treatmentinfo/treatmentinfo_chooseOrg");
        return mv;
    }

    /**选择医生页面
     * @param page
     * @throws Exception
     */
    @RequestMapping(value="/chooseDoc")
    public ModelAndView chooseDoc(Page page) throws Exception{
        logBefore(logger, Jurisdiction.getUsername()+"列表yhry");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        String keywords = pd.getString("keywords");				//关键词检索条件
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords.trim());
        }
        String org_code = pd.getString("ORG_CODE");
        if(null != org_code && !"".equals(org_code)){
            pd.put("ORG_CODE", org_code);
        }
        pd.put("enumSex", EnumSex.toMap()); // 性别
        page.setPd(pd);
        //通过ORG_CODE获得机构下的医护人员列表
        List<PageData> varList = yhryService.yhrylist(page);
        mv.setViewName("hm/treatmentinfo/treatmentinfo_chooseDoc");
        mv.addObject("varList", varList);
        mv.addObject("pd", pd);
        mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
        return mv;
    }

    /**获取某医生的信息
     * @return
     */
    @RequestMapping(value="/getDoc")
    @ResponseBody
    public Object getDoc() throws Exception
    {
        Map<String,String> map = new HashMap<String,String>();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData doc = yhryService.findById(pd);
        map.put("PROVIDER_ID",doc.getString("PROVIDER_ID"));
        map.put("PROVIDER_NAME",doc.getString("PROVIDER_NAME"));
        map.put("TELECOM",doc.getString("TELECOM"));
        map.put("IDCARD",doc.getString("IDCARD"));
        return AppUtil.returnObject(new PageData(), map);
    }

	/**选择疾病页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseDis")
	public ModelAndView chooseDis(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = diseasecodeService.list(page);	//列出DiseaseCode列表

		mv.setViewName("hm/treatmentinfo/treatmentinfo_chooseDis");
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("pd", pd);
		return mv;
	}

	/**去显示详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/showInfo")
	public ModelAndView showInfo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = treatmentinfoService.findById(pd);	//根据ID读取
		pd.put("enumSex", EnumSex.toMap());
		pd.put("dictInsureType", dictionariesService.queryDictionary(Constants.DICT_INSURETYPE));
		mv.setViewName("hm/treatmentinfo/treatmentinfo_show");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增TreatmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TREATMENTINFO_ID", this.get32UUID());	//主键
		pd.put("INCLUDED_TIME",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		treatmentinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除TreatmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		treatmentinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改TreatmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//        PageData treatmentInfo = treatmentinfoService.findById(pd);
//        pd.put("INCLUDED_TIME",treatmentInfo.get("INCLUDED_TIME").toString().split(" ")[0]);
		treatmentinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表TreatmentInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = treatmentinfoService.list(page);	//列出TreatmentInfo列表
		mv.setViewName("hm/treatmentinfo/treatmentinfo_list");
		pd.put("enumSex", EnumSex.toMap());
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumSex", EnumSex.toMap());
		pd.put("dictInsureType", dictionariesService.queryDictionary(Constants.DICT_INSURETYPE));
		mv.setViewName("hm/treatmentinfo/treatmentinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = treatmentinfoService.findById(pd);	//根据ID读取
		mv.setViewName("hm/treatmentinfo/treatmentinfo_edit");
		pd.put("enumSex", EnumSex.toMap());
		pd.put("dictInsureType", dictionariesService.queryDictionary(Constants.DICT_INSURETYPE));
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除TreatmentInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			treatmentinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出TreatmentInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("医院编码");	//1
		titles.add("医院名称");	//2
		titles.add("就诊医生ID");	//3
		titles.add("就诊医生姓名");	//4
		titles.add("就诊医生身份证");	//5
		titles.add("就诊医生手机号");	//6
		titles.add("患者姓名");	//7
		titles.add("性别");	//8
		titles.add("出生日期");	//9
		titles.add("家庭住址");	//10
		titles.add("患者就诊卡卡号");	//11
		titles.add("参保类型");	//12
		titles.add("参保卡号");	//13
		titles.add("患者健康卡卡号");	//14
		titles.add("患者联系电话");	//15
		titles.add("病情摘要");	//16
		titles.add("疾病编码");	//17
		titles.add("就诊时间");	//18
		titles.add("收录时间");	//19
		dataMap.put("titles", titles);
		List<PageData> varOList = treatmentinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORG_CODE"));	//1
			vpd.put("var2", varOList.get(i).getString("ORG_NAME"));	//2
			vpd.put("var3", varOList.get(i).getString("PROVIDER_ID"));	//3
			vpd.put("var4", varOList.get(i).getString("PROVIDER_NAME"));	//4
			vpd.put("var5", varOList.get(i).getString("IDCARD"));	//5
			vpd.put("var6", varOList.get(i).getString("TELECOM"));	//6
			vpd.put("var7", varOList.get(i).getString("NAME"));	//7
			vpd.put("var8", varOList.get(i).getString("SEX"));	//8
			vpd.put("var9", varOList.get(i).getString("BIRTHDAY"));	//9
			vpd.put("var10", varOList.get(i).getString("ADDRESS"));	//10
			vpd.put("var11", varOList.get(i).getString("VISITCARDNO"));	//11
			vpd.put("var12", varOList.get(i).getString("INSURETYPE"));	//12
			vpd.put("var13", varOList.get(i).getString("INSURENO"));	//13
			vpd.put("var14", varOList.get(i).getString("HEADTHCARDNO"));	//14
			vpd.put("var15", varOList.get(i).getString("PHONE"));	//15
			vpd.put("var16", varOList.get(i).getString("ILLDESC"));	//16
			vpd.put("var17", varOList.get(i).getString("DISEASE_CODE"));	//17
			vpd.put("var18", varOList.get(i).getString("TREATMENT_TIME"));	//18
			vpd.put("var19", varOList.get(i).getString("INCLUDED_TIME"));	//19
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

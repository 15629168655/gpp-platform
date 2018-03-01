package com.tbyf.controller.gp.indexresultrange;

import java.util.Date;
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
import com.tbyf.entity.enums.EnumIsLimitAge;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.resultrange.IndexResultRangeManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.DecimalConversion;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;
/**指标结果范围管理
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexResultRange")
public class IndexResultRangeController extends BaseController {
	
	String menuUrl = "indexResultRange/list.do"; //菜单地址(权限用)
	@Resource(name="indexResultRangeService")
    private IndexResultRangeManager indexResultRangeService;
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseaseCodeService;
	/**显示指标结果模板
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示指标结果范围列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("RESULT_RANGE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		String INDEX_ID = pd.getString("INDEX_ID");
		if(null != INDEX_ID && !"".equals(INDEX_ID)){
			pd.put("INDEX_ID", INDEX_ID.trim());
		}
		else {
			pd.put("INDEX_ID", "index_id");
		}
		pd.put("index_id", "index_id");//作为可以添加的标志
		System.out.println(pd);
		page.setPd(pd);
		List<PageData>	list = indexResultRangeService.list(page);  //列表
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型(性别)
		mv.addObject("ISLIMITAGE", EnumIsLimitAge.toMap());  //是否年龄限制
		mv.setViewName("gp/indexresultrange/indexresultrange_list");
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
		logBefore(logger, Jurisdiction.getUsername()+"添加一条指标结果范围");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());
		pd.put("HIG_COLOUR", DecimalConversion.sixteenToTen(pd.get("HIG_COLOUR").toString()));
		pd.put("LOW_COLOUR", DecimalConversion.sixteenToTen(pd.get("LOW_COLOUR").toString()));
		String nowDate = Tools.date2Str(new Date());
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("RESULT_RANGE_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		indexResultRangeService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"指标结果范围新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("ISLIMITAGE", EnumIsLimitAge.toMap());  //是否年龄限制
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexresultrange/indexresultrange_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"指标结果模板编辑界面");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("HIG_COLOUR", DecimalConversion.sixteenToTen(pd.get("HIG_COLOUR").toString()));
		pd.put("LOW_COLOUR", DecimalConversion.sixteenToTen(pd.get("LOW_COLOUR").toString()));
		pd.put("EDIT_TIME", nowDate);		//修改时间
		indexResultRangeService.update(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"指标结果模板修改界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pds = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("ISLIMITAGE", EnumIsLimitAge.toMap());  //是否年龄限制
		pd = indexResultRangeService.findById(pd);	//根据ID读取
		pds.put("JBBM", pd.get("LOW_DISEASE_ID").toString());
		pd.put("LOW_NAME", diseaseCodeService.findByDiseaseCode(pds).get("JBMC").toString());
		pds.clear();
		pds.put("JBBM", pd.get("HIG_DISEASE_ID").toString());
		pd.put("HIG_NAME", diseaseCodeService.findByDiseaseCode(pds).get("JBMC").toString());
		mv.setViewName("gp/indexresultrange/indexresultrange_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"删除指标结果模板");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("RESULT_RANGE_STATE", EnumIndexState.DEL.getCode());
		indexResultRangeService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删指标结果模板");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		String IDS=String.valueOf(pd.get("IDS"));
		if(null!=IDS && !IDS.equals("")){
        	String[] str = IDS.split(",");
        	StringBuffer sb = new StringBuffer("(");
        	for(String s:str){
        		sb.append("'"+s+"',");
        	}
        	pd.put("IDS", sb.substring(0, sb.length()-1)+")");
        }
		String nowDate = Tools.date2Str(new Date());//删除的时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("RESULT_MODEL_STATE", EnumIndexState.DEL.getCode());
		indexResultRangeService.delAll(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	

}

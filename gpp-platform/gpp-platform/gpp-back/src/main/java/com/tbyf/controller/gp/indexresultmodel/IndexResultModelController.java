package com.tbyf.controller.gp.indexresultmodel;

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
import com.tbyf.entity.enums.EnumIsPositive;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.resultmodel.IndexResultModelManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.FirstLetterUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**指标结果模板管理
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexResultModel")
public class IndexResultModelController extends BaseController{

	String menuUrl = "indexResultModel/list.do"; //菜单地址(权限用)
	@Resource(name="indexResultModelService")
    private IndexResultModelManager indexResultModelService;
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseaseCodeService;
	/**显示指标结果模板
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示指标模板列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("RESULT_MODEL_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		page.setPd(pd);
		//System.out.println(pd);
		String INDEX_ID = pd.getString("INDEX_ID");
		if(null != INDEX_ID && !"".equals(INDEX_ID)){
			pd.put("INDEX_ID", INDEX_ID.trim());
		}
		else {
			pd.put("INDEX_ID", "index_id");
		}
		pd.put("index_id", "index_id");//作为可以添加的标志
		List<PageData>	list = indexResultModelService.list(page);  //列表
		mv.addObject("varList", list);
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型(性别)
		mv.addObject("ISPOSITIVE", EnumIsPositive.toMap());  //是否呈阳性
		mv.setViewName("gp/indexresultmodel/indexresultmodel_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加一条指标结果模板");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	
		String nowDate = Tools.date2Str(new Date());
		pd.put("PY_CODE", FirstLetterUtil.getFirstLetter(pd.getString("MODEL_CONTENT")));//自动生成拼音简码
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("RESULT_MODEL_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		indexResultModelService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"指标结果模板新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("ISPOSITIVE", EnumIsPositive.toMap());  //是否呈阳性
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexresultmodel/indexresultmodel_edit");
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
		pd.put("PY_CODE", FirstLetterUtil.getFirstLetter(pd.getString("MODEL_CONTENT")));//自动生成拼音简码
		pd.put("EDIT_TIME", nowDate);		//修改时间
		indexResultModelService.update(pd);
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
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.addObject("ISPOSITIVE", EnumIsPositive.toMap());  //是否呈阳性
		pd = indexResultModelService.findById(pd);	//根据ID读取
		PageData pdd = new PageData();
		if(pd.get("IS_POSITIVE").toString().equals(Integer.toString(EnumIsPositive.POSITIVE.getCode()))) {
			pdd.put("JBBM", pd.get("DISEASE_ID"));
			pd.put("DISEASE_NAME", diseaseCodeService.findByDiseaseCode(pdd).get("JBMC"));
		}
		mv.setViewName("gp/indexresultmodel/indexresultmodel_edit");
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
		String nowDate = Tools.date2Str(new Date());//删除的时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("RESULT_MODEL_STATE", EnumIndexState.DEL.getCode());
		indexResultModelService.delete(pd);
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
		pd = this.getPageData();
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
		indexResultModelService.delAll(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

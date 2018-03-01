package com.tbyf.controller.gp.indexcombination;

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
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.combination.IndexCombinationManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.FirstLetterUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;

/**指标组合管理
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/indexCombination")
public class IndexCombinationController extends BaseController{

	String menuUrl = "indexCombination/list.do"; //菜单地址(权限用)
	@Resource(name="indexCombinationService")
    private IndexCombinationManager indexCombinationService;
	
	/**显示指标组合列表
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"显示指标组合列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());
		page.setPd(pd);
		List<PageData>	list = indexCombinationService.list(page);  //列表
		mv.addObject("FITSEX", EnumFitSex.toMap());  //适合的类型(性别)
		mv.setViewName("gp/indexcombination/indexcombination_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 新增组合界面(包括指标列表的的情况)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addIndex")
	public ModelAndView addIndex() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增组合界面(包括指标列表的的情况)");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ID = this.get32UUID();
		pd.put("ID", ID);
		pd.put("INDEX_COMBINATION_ID", ID);
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexcombination/indexcombination_com");//新增指标组合界面
		mv.addObject("msg", "add");
		return mv;
	}
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"添加一条指标组合");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("PY_CODE", FirstLetterUtil.getFirstLetter(pd.getString("INDEX_COMBINATION_NAME")).toUpperCase());//自动生成拼音简码
		pd.put("CREAT_TIME",nowDate);		  // //创建时间
		pd.put("EDIT_TIME", nowDate);//主键
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		indexCombinationService.save(pd);
		pd = indexCombinationService.findById(pd);	//根据ID读取
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.setViewName("gp/indexcombination/indexcombination_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"指标组合新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/indexcombination/indexcombination_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editIndex")
	public ModelAndView editIndex() throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"指标修改界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/indexcombination/indexcombination_com");
		mv.addObject("pd", pd);
		mv.addObject("msg", "update");
		return mv;
	}
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"指标组合编辑界面");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("PY_CODE", FirstLetterUtil.getFirstLetter(pd.getString("INDEX_COMBINATION_NAME")).toUpperCase());//自动生成拼音简码
		pd.put("EDIT_TIME", nowDate);	//修改时间
		indexCombinationService.update(pd);
		pd = indexCombinationService.findById(pd);	//根据ID读取
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.setViewName("gp/indexcombination/indexcombination_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"指标修改界面");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = indexCombinationService.findById(pd);	//根据ID读取
		mv.addObject("FITSEX", EnumFitSex.toMap());  	//适合的类型
		mv.setViewName("gp/indexcombination/indexcombination_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"删除组合管理");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());//删除的时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.DEL.getCode());//修改删除的状态
		indexCombinationService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删检查指标组合");
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
		pd.put("INDEX_COMBINATION_STATE", EnumIndexState.DEL.getCode());
		indexCombinationService.delAll(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

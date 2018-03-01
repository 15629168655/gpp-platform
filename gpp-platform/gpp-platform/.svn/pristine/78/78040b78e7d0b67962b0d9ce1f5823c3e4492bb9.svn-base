package com.tbyf.controller.gp.injection;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import com.tbyf.entity.gp.drug.Drug;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.drug.DrugManager;
import com.tbyf.service.gp.injection.InjectionManager;
import com.tbyf.service.gp.mzcfmx.MzcfmxManager;
import com.tbyf.service.gp.mzjzjl.impl.MzjzjlService;
import com.tbyf.service.hm.yhry.impl.YhryService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


/** 
 * 类名称：InjectionController
 * 修改时间：2016年10月8日
 * 作者：聂方
 * @version
 */
@Controller
@RequestMapping(value="/injection")
public class InjectionController extends BaseController {
	
	String menuUrl = "injection/list.do"; //菜单地址(权限用)
	@Resource(name="injectionService")
	private InjectionManager injectionService;
	
	@Resource(name="drugService")
	private DrugManager drugService;
	
	@Resource(name="mzjzjlService")
	private MzjzjlService mzjzjlService;
	
	@Resource(name="mzcfmxService")
	private MzcfmxManager mzcfmxService;
	
	@Resource(name="yhryService")
	private YhryService yhryService;
	
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception  
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码 检索条件限制
		String HZXM = pd.getString("HZXM");	//检索条件--患者姓名
		if(null != HZXM && !"".equals(HZXM)){
			pd.put("HZXM", HZXM.trim());
		}
		String ZXRXM = pd.getString("ZXRXM");	//检索条件--执行人姓名
		if(null != ZXRXM && !"".equals(ZXRXM)){
			pd.put("ZXRXM", ZXRXM.trim());
		}
		page.setPd(pd);
		List<PageData>	injectionList = injectionService.list(page);	//列出injectionList列表
		mv.setViewName("gp/injection/injection_list");
		mv.addObject("injectionList", injectionList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增注射登记页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/injection/injection_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增注射登记");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//ID
		pd.put("ZT",0);
		pd.put("LRRID", getCurUser().getProviderId());//录入人ID
		pd.put("LRR", getCurUser().getName()); //录入人
		if(null == injectionService.findById(pd)){  //判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		injectionService.save(pd);           //执行保存
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改注射登记页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = injectionService.findById(pd);  	//根据ID读取
		mv.setViewName("gp/injection/injection_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改注射登记");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		injectionService.edit(pd);	//执行修改
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
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除注射登记");
		PageData pd = new PageData();
		pd = this.getPageData();
		injectionService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除注射登记");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String IDS = pd.getString("IDS");
			if(null != IDS && !"".equals(IDS)){
				String ArrayIDS[] = IDS.split(",");
				injectionService.deleteAll(ArrayIDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	

}

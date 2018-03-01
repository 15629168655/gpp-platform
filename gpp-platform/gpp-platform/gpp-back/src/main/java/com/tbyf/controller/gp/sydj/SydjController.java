package com.tbyf.controller.gp.sydj;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumChannel;
import com.tbyf.entity.enums.EnumSex;
import com.tbyf.entity.enums.EnumSydjState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzcfmx.MzcfmxManager;
import com.tbyf.service.gp.mzjzjl.impl.MzjzjlService;
import com.tbyf.service.gp.sydj.impl.SydjService;
import com.tbyf.service.hm.yhry.impl.YhryService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 输液登记
 * @author lizk
 *2016-10-08
 */
@Controller
@RequestMapping(value="/sydj")
public class SydjController extends BaseController {
	
	String menuUrl = "sydj/list.do"; //菜单地址(权限用)

	@Resource(name="sydjService")
	private SydjService sydjService;
	
	@Resource(name="mzcfmxService")
	private MzcfmxManager mzcfmxService;
	
	@Resource(name="mzjzjlService")
	private MzjzjlService mzjzjlService;
	
//	@Resource(name="yhryzdService")
//	private YhryzdService yhryzdService;
	
	@Resource(name="yhryService")
	private YhryService yhryService;
	
	Integer eaN = EnumSydjState.NORMAL.getCode();//枚举，正常状态
	Integer eaD = EnumSydjState.DELETE.getCode();//枚举，删除状态
	
	/**显示输液登记列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("STATE", eaN);
			pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构编码
//			pd.put("enumBlfyypglLB", EnumBlfyypglLB.toMap());  //类别
			page.setPd(pd);
			List<PageData>	list = sydjService.list(page);  //列表
			mv.setViewName("gp/sydj/sydj_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("EnumChannel",EnumChannel.toMap());
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**去新增页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/sydj/sydj_add");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**弹出门诊处方信息页面点击录入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goluRuYPMC")
	public ModelAndView goLuruYPMC(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取门诊处方信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	list = mzcfmxService.list(page);	//列出门诊处方信息列表
		mv.setViewName("gp/sydj/mzcfmx_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**弹出患者信息页面点击录入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goluRuHZXM")
	public ModelAndView goLuruHZXM(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取患者信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	list = mzjzjlService.list(page);	//列出门诊就诊记录列表
		mv.setViewName("gp/sydj/mzjzjl_list");
		mv.addObject("varList", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 通过门诊就诊记录表的患者ID获取流水号
	 * @throws Exception 
	 */
	@RequestMapping(value="/findByPersonid")
	@ResponseBody
	public Object findByPersonid() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
			pd = this.getPageData();
			String personid = pd.getString("PERSONID");
			if(null != personid && !"".equals(personid)){
				pd.put("personid",personid);
			}
			PageData mzjzjlpd = mzjzjlService.findByPersonid(pd);
			if(mzjzjlpd != null){ 
				errInfo = "error";
			}
			map.put("JZLSH",mzjzjlpd.getString("JZLSH"));
			map.put("result", errInfo);				//返回结果
			
			return AppUtil.returnObject(new PageData(), map);
	}
	
	/**弹出医护人员信息页面点击录入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goluRuZXR")
	public ModelAndView goLuruZXR(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取医护人员信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("enumSex", EnumSex.toMap()); // 性别
		page.setPd(pd);
//		List<PageData>	list = yhryzdService.list(page);	//列出医护人员列表
		List<PageData>	list = yhryService.yhrylist(page);	//列出医护人员列表
		mv.setViewName("gp/sydj/yhryzd_list");
		mv.addObject("varlist", list);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**保存新增输液登记
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增输液登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());				//ID
		pd.put("CHANNEL", "ivdrip"); //途径
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码
//		pd.put("INPUT_ID", getCurUser().getUSER_ID());		
		pd.put("INPUT_ID", getCurUser().getProviderId());	//录入人ID
//		pd.put("INPUT_NAME", getCurUser().getNAME());     	//录入人
		pd.put("INPUT_NAME", getCurUser().getProviderName());     	//录入人
		pd.put("STATE", eaN);						//状态(正常状态)
		sydjService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = sydjService.findById(pd);			//根据ID读取
			mv.setViewName("gp/sydj/sydj_add");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改输液登记
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改输液登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		sydjService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除输液登记
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除输液登记");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("state", eaD);						//状态(删除状态)
		sydjService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除输液登记
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除输液登记信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("id", id);
				pd.put("state", eaD);
				sydjService.delete(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
}

package com.tbyf.controller.hm.lisReport;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumKLX;
import com.tbyf.entity.enums.EnumRisReportXGBZ;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.lisReport.LisReportManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/** 
 * 类名称：LisReportController
 * 修改时间：2016年10月26日
 * 作者：聂方
 * @version
 */
@Controller
@RequestMapping(value="/lisReport")
public class LisReportController extends BaseController{
	
	String menuUrl = "lisReport/list.do"; //菜单地址(权限用)
	
	@Resource(name="lisReportService")
	private LisReportManager lisReportService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;//居民信息service
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
		String BRXM = pd.getString("BRXM");	//检索条件
		if(null != BRXM && !"".equals(BRXM)){
			pd.put("BRXM", BRXM.trim());
		}
		page.setPd(pd);
		List<PageData>	List = lisReportService.list(page);	//列表
		mv.setViewName("hm/lisreport/lisreport_list");
		mv.addObject("List", List);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
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
		PageData pdJmxx = new PageData();//居民基本信息
		pd = this.getPageData();
		pdJmxx = jmxxService.findById(pd);
		pd = lisReportService.findById(pd);	//根据ID读取
		if(pd.get("DYRQ")!=null){
		    String a =new SimpleDateFormat("yyyy-MM-dd").format(pd.get("DYRQ")); 
		    pd.put("DYRQ", a);
		}else{
			pd.put("DYRQ", "");
		}
		if(pd.get("SQRQ")!=null){
		    String b =new SimpleDateFormat("yyyy-MM-dd").format(pd.get("SQRQ")); 
		    pd.put("SQRQ", b);
		}else{
			pd.put("SQRQ", "");
		}
		if(pd.get("CJRQ")!=null){
		    String c =new SimpleDateFormat("yyyy-MM-dd").format(pd.get("CJRQ")); 
		    pd.put("CJRQ", c);
		}else{
			pd.put("CJRQ", "");
		}
		if(pd.get("JYRQ")!=null){
		    String d =new SimpleDateFormat("yyyy-MM-dd").format(pd.get("JYRQ")); 
		    pd.put("JYRQ", d);
		}else{
			pd.put("JYRQ", "");
		}
		pd.put("EnumRisReportXGBZ", EnumRisReportXGBZ.toMap());  	//修改标志
		pd.put("EnumKLX", EnumKLX.toMap());  						//卡类型
		mv.setViewName("hm/lisreport/lisreport_show");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("pdJmxx",pdJmxx);//居民信息
		return mv;
	}

}

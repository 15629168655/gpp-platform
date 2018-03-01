package com.tbyf.controller.hm.risReport;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumKLX;
import com.tbyf.entity.enums.EnumRisReportMZZYBZ;
import com.tbyf.entity.enums.EnumRisReportSFFSX;
import com.tbyf.entity.enums.EnumRisReportSFYYY;
import com.tbyf.entity.enums.EnumRisReportXGBZ;
import com.tbyf.entity.enums.EnumRisReportYYX;
import com.tbyf.entity.enums.EnumSexGB;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.risReport.RisReportManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 医学影像检查报告
 * @author lizk
 *2016-10-27
 */
@Controller
@RequestMapping(value="/risReport")
public class RisReportController extends BaseController {

	String menuUrl = "risReport/list.do"; //菜单地址(权限用)
	
	@Resource(name="risReportService")
    private RisReportManager risReportService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;//居民信息Service
	/**显示列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
		    //System.out.println(pd.getString("id"));
			List<PageData>	list = risReportService.list(page);  //列表
			mv.setViewName("hm/risReport/risReport_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**查看详情
	 * @return
	 */
	@RequestMapping(value="/goCKXQ")
	public ModelAndView goCKXQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdJmxx = new PageData();
		pd = this.getPageData();
		try {
			pdJmxx = jmxxService.findById(pd);
			pd = risReportService.findBySTUDYUID(pd);					//根据检查号--主键读取
			System.out.println(pd);
			pd.put("EnumRisReportXGBZ", EnumRisReportXGBZ.toMap());  	//修改标志
			pd.put("EnumKLX", EnumKLX.toMap());  						//卡类型
			pd.put("EnumRisReportMZZYBZ", EnumRisReportMZZYBZ.toMap()); //门诊/住院标志
			pd.put("EnumRisReportSFFSX", EnumRisReportSFFSX.toMap());  	//是否放射性
			pd.put("EnumRisReportYYX", EnumRisReportYYX.toMap());  		//阴阳性
			pd.put("EnumRisReportSFYYY", EnumRisReportSFYYY.toMap());  	//是否有影像
			pd.put("EnumSexGB", EnumSexGB.toMap());  					//病人性别---按国标GB/T 2261.1-2003
			mv.setViewName("hm/risReport/risReport_ckxq");
			mv.addObject("pd", pd);
			mv.addObject("pdJmxx",pdJmxx);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
}

package com.tbyf.controller.hm.cisMain;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumSexGB;
import com.tbyf.entity.enums.EnumRylx;
import com.tbyf.entity.enums.EnumHyzk;
import com.tbyf.entity.enums.EnumLxrgx;
import com.tbyf.entity.enums.EnumRybq;
import com.tbyf.entity.enums.EnumZdfhqk;
import com.tbyf.entity.enums.EnumZyjzjlXGBZ;
import com.tbyf.entity.enums.EnumZyjzjlYLFYLYLB;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.cismain.CismainManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


/**
 * 住院病案首页
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/cisMain")
public class CisMainController extends BaseController{
		
	String menuUrl = "cisMain/list.do"; //菜单地址(权限用)

	@Resource(name="cismainService")
    private CismainManager cismainService;
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	
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
			List<PageData>	list = cismainService.list(page);  //列表
			mv.setViewName("hm/cisMain/cisMain_list");
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
		PageData pdJmxx = new PageData();//居民基本信息
		
		PageData pd = new PageData();//住院病案首页详细信息
		pd = this.getPageData();
		
		try {
			
			pdJmxx = jmxxService.findById(pd);//获取居民的详细信息
			pd = cismainService.findByJzlsh(pd);
			pd.put("EnumSexGB", EnumSexGB.toMap());  			//性别 国标编码 
			pd.put("EnumRylx", EnumRylx.toMap());  			//入院类型
			pd.put("EnumHyzk", EnumHyzk.toMap());  			//婚姻状况
			pd.put("EnumLxrgx", EnumLxrgx.toMap());  			//联系人与患者关系
			pd.put("EnumRybq", EnumRybq.toMap());  			//入院病情
			pd.put("EnumZdfhqk", EnumZdfhqk.toMap());  			//诊断符合情况
			pd.put("EnumZyjzjlXGBZ", EnumZyjzjlXGBZ.toMap());  			//修改标志
			pd.put("EnumZyjzjlYLFYLYLB", EnumZyjzjlYLFYLYLB.toMap());   //医疗费用来源类别
			
			mv.setViewName("hm/cisMain/cisMain_ckxq");
			mv.addObject("pd", pd);
			mv.addObject("pdJmxx",pdJmxx);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}

}

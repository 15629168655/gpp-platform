package com.tbyf.controller.hm.zyyzjl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumKLX;
import com.tbyf.entity.enums.EnumZyyzPSPD;
import com.tbyf.entity.enums.EnumZyyzSFYP;
import com.tbyf.entity.enums.EnumZyyzXGBZ;
import com.tbyf.entity.enums.EnumZyyzYZLB;
import com.tbyf.entity.enums.EnumZyyzjlCXBZ;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.zyyz.ZyyzManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 住院医嘱记录
 * @author lizk
 *2016-10-26
 */
@Controller
@RequestMapping(value="/zyyzjl")
public class ZyyzjlController extends BaseController {

	String menuUrl = "zyyzjl/list.do"; //菜单地址(权限用)

	@Resource(name="zyyzService")
	private ZyyzManager zyyzService;
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
			List<PageData>	list = zyyzService.list(page);  //列表
			mv.setViewName("hm/zyyzjl/zyyzjl_list");
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
			pdJmxx = jmxxService.findById(pd);//居民信息详情
			pd = zyyzService.findByID(pd);													//根据ID读取
			pd.put("EnumZyyzjlCXBZ", EnumZyyzjlCXBZ.toMap());  			//撤销标志
			pd.put("EnumKLX", EnumKLX.toMap());  						//卡类型
			pd.put("EnumZyyzYZLB", EnumZyyzYZLB.toMap());   			//医嘱类别
			pd.put("EnumZyyzSFYP", EnumZyyzSFYP.toMap());  				//是否药品
			pd.put("EnumZyyzPSPD", EnumZyyzPSPD.toMap());  				//皮试判断
			pd.put("EnumZyyzXGBZ", EnumZyyzXGBZ.toMap());  				//修改标志
			mv.setViewName("hm/zyyzjl/zyyzjl_ckxq");
			mv.addObject("pd", pd);
			mv.addObject("pdJmxx", pdJmxx);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
}

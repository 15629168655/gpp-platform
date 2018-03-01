package com.tbyf.controller.hm.zyjzjl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumKLX;
import com.tbyf.entity.enums.EnumZyjzjlHZGSD;
import com.tbyf.entity.enums.EnumZyjzjlTXBZ;
import com.tbyf.entity.enums.EnumZyjzjlXGBZ;
import com.tbyf.entity.enums.EnumZyjzjlYLFYLYLB;
import com.tbyf.entity.enums.EnumZyjzjlZDBMLX;
import com.tbyf.entity.enums.EnumZyjzklJZLX;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.zyjzjl.impl.ZyjzjlService;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 住院就诊记录
 * @author lizk
 *2016-10-24
 */
@Controller
@RequestMapping(value="/zyjzjl")
public class ZyjzjlController extends BaseController {

	String menuUrl = "zyjzjl/list.do"; //菜单地址(权限用)

	@Resource(name="zyjzjlService")
	private ZyjzjlService zyjzjlService;
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
			//System.out.println(pd);
			List<PageData>	list = zyjzjlService.list(page);  //列表
			mv.setViewName("hm/zyjzjl/zyjzjl_list");
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
		PageData pdJmxx = new PageData();//居民信息系
		pd = this.getPageData();
		try {
			pdJmxx = jmxxService.findById(pd);
			pd = zyjzjlService.findByID(pd);							//根据ID读取
			pd.put("EnumZyjzjlTXBZ", EnumZyjzjlTXBZ.toMap());  			//特需标志
			pd.put("EnumZyjzjlXGBZ", EnumZyjzjlXGBZ.toMap());  			//修改标志
			pd.put("EnumZyjzjlYLFYLYLB", EnumZyjzjlYLFYLYLB.toMap());   //医疗费用来源类别
			pd.put("EnumZyjzjlHZGSD", EnumZyjzjlHZGSD.toMap());  		//患者归属地
			pd.put("EnumKLX", EnumKLX.toMap());  						//卡类型
			pd.put("EnumZyjzklJZLX", EnumZyjzklJZLX.toMap());  			//就诊类型
			pd.put("EnumZyjzjlZDBMLX", EnumZyjzjlZDBMLX.toMap());  			//就诊编码类型
			mv.setViewName("hm/zyjzjl/zyjzjl_ckxq");
			mv.addObject("pd", pd);
			mv.addObject("pdJmxx",pdJmxx);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
}

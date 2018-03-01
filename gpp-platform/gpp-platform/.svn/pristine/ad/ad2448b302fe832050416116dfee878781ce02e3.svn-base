package com.tbyf.controller.information.healthinformation;

import java.io.PrintWriter;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsComplete;
import com.tbyf.entity.enums.EnumIsIndependence;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.enums.EnumTaskStatus;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.healthinformation.HealthInformationTypeManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;
/**
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  	用户名或密码错误
 * 05  	FKEY验证失败
 */
/**
 * 健康资讯类型接口
 * @author ad
 *
 */
@Controller
@RequestMapping(value="/healthinformationtype")
public class HealthInformationTypeController extends BaseController {
	
	String menuUrl = "healthinformationtype/listType.do"; //菜单地址(权限用)
	@Resource(name="healthTypeService")
	private HealthInformationTypeManager healthTypeService;
	/**显示健康资讯类型信息
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listType")
	public ModelAndView listType(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	typeList = healthTypeService.list(page);			//类型列表
			mv.setViewName("information/healthinformationtype/healthtype_list");
			mv.addObject("typeList", typeList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**删除健康资讯类型
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteType")
	public void deleteJmxx(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除健康资讯类型信息");
		PageData pd = new PageData();
		pd = this.getPageData();
		healthTypeService.deleteByGUID(pd);
		out.write("success");
		out.close();
	}
	/**批量删除健康资讯信息
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAllType")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除健康资讯信息");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("guids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("GUID", id);
				healthTypeService.deleteByGUID(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去新增健康资讯类型页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAddType")
	public ModelAndView goAddU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumIsComplete", EnumIsComplete.toMap()); 	//是否认证
		pd.put("EnumIsIndependence", EnumIsIndependence.toMap());//是否独立
		mv.setViewName("information/healthinformationtype/healthtype_edit");
		mv.addObject("msg", "saveT");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去修改健康资讯类型页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goEditType")
	public ModelAndView goEditU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd=healthTypeService.findByGUID(pd);
			pd.put("EnumIsComplete", EnumIsComplete.toMap()); 	//是否认证
			pd.put("EnumIsIndependence", EnumIsIndependence.toMap());//是否独立
			mv.setViewName("information/healthinformationtype/healthtype_edit");
			mv.addObject("msg", "saveT");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	/**保存健康资讯类型信息
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveT")
	public ModelAndView saveType() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"保存健康资讯类型信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(null==pd.get("GUID")||"".equals(pd.get("GUID"))){
			pd.put("GUID", get32UUID());   
			pd.put("STATUS", "1");   //新增时默认为正常状态
			healthTypeService.save(pd);
		}else{
			healthTypeService.edit(pd);
		}
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}
	
}

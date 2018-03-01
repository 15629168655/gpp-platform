package com.tbyf.controller.gp.hospitalization;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumHospitalizationFylb;
import com.tbyf.entity.enums.EnumHospitalizationBq;
import com.tbyf.entity.enums.EnumHospitalizationTw;
import com.tbyf.entity.enums.EnumHospitalizationYsfs;
import com.tbyf.entity.enums.EnumHospitalizationGl;
import com.tbyf.entity.enums.EnumHospitalizationWscl;
import com.tbyf.entity.enums.EnumHospitalizationTsclsy;
import com.tbyf.entity.enums.EnumMzzdwhCFB;
import com.tbyf.entity.enums.EnumMzzdwhCRB;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.hospitalization.HospitalizationManager;
import com.tbyf.service.gp.mzzdwh.MzzdwhManager;
import com.tbyf.service.hm.departments.DepartmentsManager;
import com.tbyf.service.hm.yhry.impl.YhryService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/** 
 * 类名称：HospitalizationController
 * 修改时间：2016年9月26日
 * 作者：聂方
 * @version
 */

@Controller
@RequestMapping(value="/hospitalization")
public class HospitalizationController  extends BaseController{
	String menuUrl = "hospitalization/list.do"; //菜单地址(权限用)
	
	@Resource(name="hospitalizationService")
	private HospitalizationManager hospitalizationService;
	
	@Resource(name="departmentsService")
	private DepartmentsManager departmentsService;
	
	@Resource(name="yhryService")
	private YhryService yhryService;
	
	@Resource(name="mzzdwhService")
	private MzzdwhManager mzzdwhService;
	
	
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
		String XM = pd.getString("XM");	//姓名检索条件
		if(null != XM && !"".equals(XM)){
			pd.put("XM", XM.trim());
		}
		page.setPd(pd);
		List<PageData>	hospitalizationList = hospitalizationService.list(page);	//列出住院证列表
		mv.setViewName("gp/hospitalization/hospitalization_list");
		mv.addObject("hospitalizationList", hospitalizationList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增住院证页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumHospitalizationFylb", EnumHospitalizationFylb.toMap()); // 费用类别
		pd.put("enumHospitalizationBq", EnumHospitalizationBq.toMap()); // 病情
		pd.put("enumHospitalizationTw", EnumHospitalizationTw.toMap()); // 体位
		pd.put("enumHospitalizationYsfs", EnumHospitalizationYsfs.toMap()); // 运送方法
		pd.put("enumHospitalizationGl", EnumHospitalizationGl.toMap()); // 隔离
		pd.put("enumHospitalizationWscl", EnumHospitalizationWscl.toMap()); // 卫生处理
		pd.put("enumHospitalizationTsclsy", EnumHospitalizationTsclsy.toMap()); // 特殊处理事由
		
		mv.setViewName("gp/hospitalization/hospitalization_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"新增住院证");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//ID
		if(null == hospitalizationService.findById(pd)){  //判断新增权限
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		hospitalizationService.save(pd);           //执行保存
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改住院证页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = hospitalizationService.findById(pd);  	//根据ID读取
		pd.put("enumHospitalizationFylb", EnumHospitalizationFylb.toMap()); // 费用类别
		pd.put("enumHospitalizationBq", EnumHospitalizationBq.toMap()); // 病情
		pd.put("enumHospitalizationTw", EnumHospitalizationTw.toMap()); // 体位
		pd.put("enumHospitalizationYsfs", EnumHospitalizationYsfs.toMap()); // 运送方法
		pd.put("enumHospitalizationGl", EnumHospitalizationGl.toMap()); // 隔离
		pd.put("enumHospitalizationWscl", EnumHospitalizationWscl.toMap()); // 卫生处理
		pd.put("enumHospitalizationTsclsy", EnumHospitalizationTsclsy.toMap()); // 特殊处理事由
		if(pd.get("ZYZYRQ")!=null){
		    String a =new SimpleDateFormat("yyyy-MM-dd").format(pd.get("ZYZYRQ")); 
		    pd.put("ZYZYRQ", a);
		}else{
			pd.put("ZYZYRQ", "");
		}
		if(pd.get("ZYRQ")!=null){
		    String b =new SimpleDateFormat("yyyy-MM-dd").format(pd.get("ZYRQ")); 
		    pd.put("ZYRQ", b);
		}else{
			pd.put("ZYRQ", "");
		}
		mv.setViewName("gp/hospitalization/hospitalization_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"修改住院证");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		hospitalizationService.edit(pd);	//执行修改
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
		logBefore(logger, Jurisdiction.getUsername()+"删除住院证");
		PageData pd = new PageData();
		pd = this.getPageData();
		hospitalizationService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAllU() {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除住院证");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String IDS = pd.getString("IDS");
			if(null != IDS && !"".equals(IDS)){
				String ArrayIDS[] = IDS.split(",");
				hospitalizationService.deleteAll(ArrayIDS);
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
	
	/**打印预览页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/printPage")
	public ModelAndView printPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = hospitalizationService.findById(pd);  	//根据ID读取
		// Map a = new  HashMap();
		//a.put("value",111111);
		// mv.addObject("map", a);
		if(pd.get("SCSJ")!=null){
		    String c =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(pd.get("SCSJ")); 
		    pd.put("SCSJ", c);
		}else{
			pd.put("SCSJ", "");
		}
		mv.setViewName("gp/hospitalization/hospitalization_print");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**科室选择
	 * @return
	 */
	@RequestMapping(value="/getDepartData")
	@ResponseBody
	public ModelAndView getDepartData(Model model){
		logBefore(logger, Jurisdiction.getUsername()+"获取科室菜单");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
//		Session session = Jurisdiction.getSession();
		try {
			JSONArray arr = JSONArray.fromObject(departmentsService.listAllDep(getCurUser().getOrgCode()));
			String json = arr.toString();
			json = json.replaceAll("DEP_ID", "id").replaceAll("PARENT_DEP_ID", "pId").replaceAll("DEP_NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("pd", pd);	
			mv.setViewName("gp/hospitalization/departData");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**弹出门诊诊断点击录入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/getDiagnosis")
	public ModelAndView getDiagnosis(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取门诊诊断信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("enumMzzdwhCRB", EnumMzzdwhCRB.toMap());	//是否传染病在页面列表显示
		pd.put("enumMzzdwhCFB", EnumMzzdwhCFB.toMap());	//是否尘肺病病在页面列表显示
		page.setPd(pd);
		List<PageData>	zdxxList = mzzdwhService.zdxxlist(page);	//列出医护人员列表
		mv.setViewName("gp/hospitalization/diagnosis_list");
		mv.addObject("zdxxList", zdxxList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}



}

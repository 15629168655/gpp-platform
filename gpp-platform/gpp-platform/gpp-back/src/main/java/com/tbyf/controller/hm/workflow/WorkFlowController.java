package com.tbyf.controller.hm.workflow;

import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.organization.*;
import com.tbyf.service.hm.workflow.*;
import com.tbyf.util.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.annotation.*;
import java.io.*;
import java.text.*;
import java.util.*;

/** 
 * 说明：业务流程
 * 创建人：
 * 创建时间：2016-06-30
 */
@Controller
@RequestMapping(value="/workflow")
public class WorkFlowController extends BaseController {
	
	String menuUrl = "workflow/list.do"; //菜单地址(权限用)
	@Resource(name="workflowService")
	private WorkFlowManager workflowService;
	@Resource(name="organizationService")
	private OrganizationManager organizationService;

	/**
	 * 显示左侧机构树   ztree
	 * @param ORG_CODE
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllOrg")
	public ModelAndView listAllOrg(Model model, String ORG_CODE) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		mv.addObject("ORG_CODE", ORG_CODE);
		mv.addObject("pd", pd);
		//设置跳转路径
		mv.setViewName("hm/workflow/workflow_ztree");
		return mv;
	}

	/**签约机构选择弹窗
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseJG")
	public ModelAndView chooseJG()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("hm/workflow/workflow_chooseJG");
		return mv;
	}

	/**判断签约机构编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasC")
	@ResponseBody
	public Object hasC(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(workflowService.findBySIGN_ORG_CODE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WorkFlow");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WORKFLOW_ID", this.get32UUID());	//主键
		PageData pd1 = new PageData();
		pd1.put("ORG_CODE",pd.getString("SIGN_ORG_CODE"));
		PageData org = organizationService.findByORG_CODE(pd1);
		pd.put("SIGN_ORG_RANK",org.getString("HOSPITAL_RANK"));
		pd.put("CONFIG_DATE",new Date());
		pd.put("OPERATOR",getCurUser().getName());
		workflowService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除WorkFlow");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		workflowService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改WorkFlow");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CONFIG_DATE",new Date());
		pd.put("OPERATOR",getCurUser().getName());
		workflowService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表WorkFlow");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String org_code  = pd.getString("ORG_CODE");
		pd.put("enumReferralType", EnumReferralType.toMap());
		pd.put("enumHospitalRank", EnumHospitalRank.toMap());
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = workflowService.list(page);	//列出WorkFlow列表
		if(null != org_code){
			mv.addObject("ORG_CODE", org_code);
		}
		mv.setViewName("hm/workflow/workflow_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("ORG_CODE",pd.getString("ORG_CODE"));
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("enumReferralType", EnumReferralType.toMap());
		mv.setViewName("hm/workflow/workflow_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = workflowService.findById(pd);	//根据ID读取
		pd.put("enumReferralType", EnumReferralType.toMap());
		mv.setViewName("hm/workflow/workflow_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除WorkFlow");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			workflowService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出WorkFlow到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("机构编码");	//1
		titles.add("转诊类型");	//2
		titles.add("签约机构编码");	//3
		titles.add("签约机构名称");	//4
		titles.add("签约机构等级");	//5
		titles.add("配置时间");	//6
		titles.add("操作人");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = workflowService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORG_CODE"));	//1
			vpd.put("var2", varOList.get(i).getString("REFERRAL_TYPE"));	//2
			vpd.put("var3", varOList.get(i).getString("SIGN_ORG_CODE"));	//3
			vpd.put("var4", varOList.get(i).getString("SIGN_ORG_NAME"));	//4
			vpd.put("var5", varOList.get(i).getString("SIGN_ORG_RANK"));	//5
			vpd.put("var6", varOList.get(i).getString("CONFIG_DATE"));	//6
			vpd.put("var7", varOList.get(i).getString("OPERATOR"));	//7
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

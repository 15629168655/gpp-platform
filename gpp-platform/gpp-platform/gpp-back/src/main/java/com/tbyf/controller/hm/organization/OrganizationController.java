package com.tbyf.controller.hm.organization;

import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.*;
import com.tbyf.plugin.*;
import com.tbyf.service.hm.organization.*;
import com.tbyf.util.*;

import net.sf.json.*;

import org.springframework.beans.propertyeditors.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.annotation.*;
import javax.servlet.http.*;

import java.text.*;
import java.util.*;

/** 
 * 说明：机构管理
 * 创建人：
 * 创建时间：2016-06-22
 */
@Controller
@RequestMapping(value="/organization")
public class OrganizationController extends BaseController {
	
	String menuUrl = "organization/list.do"; //菜单地址(权限用)
	@Resource(name="organizationService")
	private OrganizationManager organizationService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Organization");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		if(organizationService.findByORG_CODE(pd) != null) //当数据库存在该条数据(前端没有拦截成功，或是网络延迟造成多次请求发送)
		{
			return new ModelAndView("redirect:/organization/goEdit?success=success"); //刷新旁边的树
		}
		pd.put("ISLEAF","1");
		pd.put("ORGANIZATION_ID", this.get32UUID());	//主键
		organizationService.save(pd);

		//当在叶子节点下新增节点时，将原来的叶子节点的ISLEAF变为0
		if(!Boolean.valueOf(pd.getString("isParent")))
		{
			PageData pd1 = new PageData();
			pd1.put("ORG_CODE",pd.getString("P_ORG_CODE"));
			pd1.put("ISLEAF","0");
			organizationService.changeToParent(pd1);
		}
		return new ModelAndView("redirect:/organization/goEdit?success=success"); //添加成功刷新旁边的树
	}
	
	/**删除
	 * @param ORGANIZATION_ID
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String ORGANIZATION_ID,@RequestParam String P_ORG_CODE) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Organization");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd.put("ORGANIZATION_ID", ORGANIZATION_ID);
		String ORG_CODE = organizationService.findById(pd).getString("ORG_CODE");
		String errInfo = "success";
		if(organizationService.listSubOrgByP_ORG_CODE(ORG_CODE).size() > 0){//判断是否有子级，是：不允许删除
			errInfo = "false";
		}
		if("success".equals(errInfo)){
			organizationService.delete(pd);	//执行删除

			//如果父节点只有一个子节点，则将父节点变为叶节点
			if(Tools.notEmpty(P_ORG_CODE))
			{
				PageData pd1 = new PageData();
				pd1.put("ORG_CODE",P_ORG_CODE);
				pd1.put("ISLEAF","1");
				organizationService.changeToParent(pd1);
			}
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Organization");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String ORGANIZATION_ID = pd.getString("ORGANIZATION_ID");
		organizationService.edit(pd);
		if(Tools.notEmpty(pd.getString("add_success")) && pd.getString("add_success").equals("edit_P_ORG_CODE")) //edit页面修改上级机构代码
		{
			//如果修改的是无兄弟叶节点
			if(organizationService.listSubOrgByP_ORG_CODE(pd.getString("OLD_P_ORG_CODE")).size() == 0)
			{
				//将节点原来的父节点改为叶节点
				PageData pd1 = new PageData();
				pd1.put("ORG_CODE",pd.getString("OLD_P_ORG_CODE"));
				pd1.put("ISLEAF","1");
				organizationService.changeToParent(pd1);
			}
			PageData pd2 = new PageData();
			pd2.put("ORG_CODE",pd.getString("P_ORG_CODE"));
			//如果修改到的节点原来是叶节点，就将其改为父节点
			if(organizationService.findByORG_CODE(pd2).getString("ISLEAF").equals("1"))
			{
				PageData pd3 = new PageData();
				pd3.put("ORG_CODE",pd.getString("P_ORG_CODE"));
				pd3.put("ISLEAF","0");
				organizationService.changeToParent(pd3);
			}
			return new ModelAndView("redirect:/organization/goEdit?success=success"); //刷新旁边的树
		}
//		return new ModelAndView("redirect:/organization/goEdit?ORGANIZATION_ID=" + ORGANIZATION_ID);
		return new ModelAndView("redirect:/organization/goEdit?success=success"); //刷新旁边的树
	}


	/**判断组织机构代码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasORG_CODE")
	@ResponseBody
	public Object hasORG_CODE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(organizationService.findByORG_CODE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}

	/**判断登记号是否存在
	 * @return
	 */
	@RequestMapping(value="/hasORG_LOGIN_CODE")
	@ResponseBody
	public Object hasORG_LOGIN_CODE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(organizationService.findByORG_LOGIN_CODE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Organization");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = organizationService.list(page);	//列出Organization列表
		mv.setViewName("hm/organization/organization_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	/**区划选择弹窗
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/chooseQH")
	public ModelAndView chooseQH()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("hm/organization/organization_chooseQH");
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
		pd.put("enumOrganizationStatus", EnumOrganizationStatus.toMap());
		pd.put("enumHospitalRank", EnumHospitalRank.toMap());
		mv.setViewName("hm/organization/organization_edit");
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
		if(Tools.notEmpty(pd.getString("ORG_CODE")))
		{
			pd = organizationService.findByORG_CODE(pd);
		}
		else if(Tools.notEmpty(pd.getString("ORGANIZATION_ID")))
		{
			pd = organizationService.findById(pd);	//根据ID读取
		}
		pd.put("enumOrganizationStatus", EnumOrganizationStatus.toMap());
		pd.put("enumHospitalRank", EnumHospitalRank.toMap());
		mv.addObject("pd", pd);					//放入视图容器
		mv.setViewName("hm/organization/organization_edit");
		mv.addObject("msg", "edit");
		return mv;
	}

	/**
	 * 显示列表   ztree
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listAllOrg")
	public ModelAndView listAllOrg(Model model) throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(Const.TREE_TOP_NODE,null,null));
			String json = array.toString();
			mv.addObject("treeTopJson", json);
			//设置跳转路径
			mv.setViewName("hm/organization/organization_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 带链接的树
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/treeData")
	@ResponseBody
	public String depTreeData(HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(id,request.getParameter("type"),request.getParameter("action")));
		String json = array.toString();
		//json=json.replaceAll("guid", "id").replaceAll("sjxzqhdm", "pId").replaceAll("xzqhmc", "name").replaceAll("hasDist", "isParent").replaceAll("treeurl", "url");
		return json;
	}

	/**
	 * 不带链接的树
	 * @param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/orgTree")
	@ResponseBody
	public String orgTree(HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		JSONArray array=JSONArray.fromObject(organizationService.packageTreeDate(id,null,null));
		String json = array.toString();
		//json=json.replaceAll("guid", "id").replaceAll("sjxzqhdm", "pId").replaceAll("xzqhmc", "name").replaceAll("hasDist", "isParent").replaceAll("treeurl", "url");
		return json;
	}

//
//	 /**导出到excel
//	 * @param
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/excel")
//	public ModelAndView exportExcel() throws Exception{
//		logBefore(logger, Jurisdiction.getUsername()+"导出Organization到excel");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
//		ModelAndView mv = new ModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		Map<String,Object> dataMap = new HashMap<String,Object>();
//		List<String> titles = new ArrayList<String>();
//		titles.add("组织机构代码");	//1
//		titles.add("组织机构名称");	//2
//		titles.add("登记号");	//3
//		titles.add("机构第二名称");	//4
//		titles.add("机构分类代码");	//5
//		titles.add("机构分类名称");	//6
//		titles.add("机构类型代码");	//7
//		titles.add("机构类型名称");	//8
//		titles.add("行政区划代码");	//9
//		titles.add("行政区划名称");	//10
//		titles.add("地址");	//11
//		titles.add("乡镇街道代码");	//12
//		titles.add("乡镇街道名称");	//13
//		titles.add("主办单位代码");	//14
//		titles.add("主办单位名称");	//15
//		titles.add("上级部门代码");	//16
//		titles.add("上级部门名称");	//17
//		titles.add("隶属关系代码");	//18
//		titles.add("隶属关系名称");	//19
//		titles.add("邮政编码");	//20
//		titles.add("联系电话");	//21
//		titles.add("电子邮箱");	//22
//		titles.add("法人代表");	//23
//		titles.add("负责人");	//24
//		titles.add("单位成立时间");	//25
//		titles.add("单位网站");	//26
//		titles.add("拼音助记");	//27
//		titles.add("机构状态");	//28
//		titles.add("注册者ID");	//29
//		titles.add("注册者姓名");	//30
//		titles.add("注册者机构标识");	//31
//		titles.add("注册者机构名称");	//32
//		titles.add("注册者机构联系人");	//33
//		titles.add("注册时间");	//34
//		titles.add("上级机构代码");	//35
//		titles.add("是否是树也节点:1是也节点，其余不是");	//36
//		dataMap.put("titles", titles);
//		List<PageData> varOList = organizationService.listAll(pd);
//		List<PageData> varList = new ArrayList<PageData>();
//		for(int i=0;i<varOList.size();i++){
//			PageData vpd = new PageData();
//			vpd.put("var1", varOList.get(i).getString("ORG_CODE"));	//1
//			vpd.put("var2", varOList.get(i).getString("ORG_NAME"));	//2
//			vpd.put("var3", varOList.get(i).getString("ORG_LOGIN_CODE"));	//3
//			vpd.put("var4", varOList.get(i).getString("ORG_NAME2"));	//4
//			vpd.put("var5", varOList.get(i).getString("ORG_CLASSCODE"));	//5
//			vpd.put("var6", varOList.get(i).getString("ORG_CLASSVALUE"));	//6
//			vpd.put("var7", varOList.get(i).getString("ORG_TYPECODE"));	//7
//			vpd.put("var8", varOList.get(i).getString("ORG_TYPEVALUE"));	//8
//			vpd.put("var9", varOList.get(i).getString("REGIONCODE"));	//9
//			vpd.put("var10", varOList.get(i).getString("REGIONVALUE"));	//10
//			vpd.put("var11", varOList.get(i).getString("ADDRESS"));	//11
//			vpd.put("var12", varOList.get(i).getString("TOWN_STREET_CODE"));	//12
//			vpd.put("var13", varOList.get(i).getString("TOWN_STREET_NAME"));	//13
//			vpd.put("var14", varOList.get(i).getString("HOST_UNITCODE"));	//14
//			vpd.put("var15", varOList.get(i).getString("HOST_UNITVALUE"));	//15
//			vpd.put("var16", varOList.get(i).getString("SUP_DEPARTMENTCODE"));	//16
//			vpd.put("var17", varOList.get(i).getString("SUP_DEPARTMENTVALUE"));	//17
//			vpd.put("var18", varOList.get(i).getString("RELATIONSCODE"));	//18
//			vpd.put("var19", varOList.get(i).getString("RELATIONSVALUE"));	//19
//			vpd.put("var20", varOList.get(i).getString("POST_CODE"));	//20
//			vpd.put("var21", varOList.get(i).getString("TEL"));	//21
//			vpd.put("var22", varOList.get(i).getString("MAIL"));	//22
//			vpd.put("var23", varOList.get(i).getString("CORP_REPRESENTATIVE"));	//23
//			vpd.put("var24", varOList.get(i).getString("PRINC_PERSON"));	//24
//			vpd.put("var25", varOList.get(i).getString("UNIT_SETUP_TIME"));	//25
//			vpd.put("var26", varOList.get(i).getString("UNIT_WEB_SET"));	//26
//			vpd.put("var27", varOList.get(i).getString("PHONETIC_MNEMONIC"));	//27
//			vpd.put("var28", varOList.get(i).getString("ORG_STATUS"));	//28
//			vpd.put("var29", varOList.get(i).getString("AUTHOR_ID"));	//29
//			vpd.put("var30", varOList.get(i).getString("AUTHOR_NAME"));	//30
//			vpd.put("var31", varOList.get(i).getString("AUTHOR_DEP_ID"));	//31
//			vpd.put("var32", varOList.get(i).getString("AUTHOR_DEP_NAME"));	//32
//			vpd.put("var33", varOList.get(i).getString("AUTHOR_DEP_CONTACTS"));	//33
//			vpd.put("var34", varOList.get(i).getString("CREATION_TIME"));	//34
//			vpd.put("var35", varOList.get(i).getString("P_ORG_CODE"));	//35
//			vpd.put("var36", varOList.get(i).getString("ISLEAF"));	//36
//			varList.add(vpd);
//		}
//		dataMap.put("varList", varList);
//		ObjectExcelView erv = new ObjectExcelView();
//		mv = new ModelAndView(erv,dataMap);
//		return mv;
//	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

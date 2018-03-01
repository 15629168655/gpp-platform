package com.tbyf.controller.gp.sfjl;

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
import com.tbyf.entity.enums.EnumMzzdwhCRB;
import com.tbyf.entity.enums.EnumSfjlSFCL;
import com.tbyf.entity.enums.EnumSfjlSFFS;
import com.tbyf.entity.enums.EnumSfjlSFLX;
import com.tbyf.entity.enums.EnumSfjlZT;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.sfjl.EhrManager;
import com.tbyf.service.gp.sfjl.SfjlHypertensionManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;




@Controller
@RequestMapping(value="/sfjlhypertension")
public class SfjlHypertensionController extends BaseController {
	String menuUrl = "sfjlhypertension/list.do"; //菜单地址(权限用)
	
	@Resource(name="sfjlHypertensionService")
	private SfjlHypertensionManager sfjlHypertensionService;
	@Resource(name="ehrService")
	private EhrManager ehrService;
	Integer eaZC = EnumSfjlZT.NORMAL.getCode();//枚举，正常状态
	Integer eaZF = EnumSfjlZT.TO_VOID.getCode();//枚举，作废状态
	Integer eaSC = EnumSfjlZT.DELETE.getCode();//枚举，删除状态
	
	
	
	/**显示随访登记列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String sfcl = pd.getString("sfcl");					//是否处理
			if(null != sfcl && !"".equals(sfcl)){
				pd.put("sfcl", sfcl.trim());
			}else{
				pd.put("sfcl", null);
			}
	
			String sffs = pd.getString("sffs");					//随访方式
			if(null != sffs && !"".equals(sffs)){
				pd.put("sffs", sffs.trim());
			}else{
				pd.put("sffs", null);
			}
			pd.put("ZT", eaSC);
			pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构编码
			pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());  //随访方式
			//pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());  //随访类型
			pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());  //是否访视
			//pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
			page.setPd(pd);
			List<PageData>	list = sfjlHypertensionService.list(page);  //列表
			mv.setViewName("gp/sfjl/sfjlhypertension/sfjlhypertension_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			//判断是否跳转健康档案的随访
			PageData ehrpd  = new PageData();
			ehrpd.put("ID", 1);//高血压
			PageData ehr = ehrService.getEhr(ehrpd);
			User user = this.getCurrentUser();
			String url =ehr.getString("EHRURL");
			url = url+"?platformParam.account="+user.getUserId()+"&platformParam.type="+ehr.get("TYPE")+"&platformParam.resource="+ehr.get("SOURCE")+"";
			ehr.put("EHRURL",url);
			mv.addObject("ehr",ehr);
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
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
			pd = sfjlHypertensionService.findById(pd);					 //根据ID读取
			pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());
			pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
			pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());
			pd.put("EnumSfjlZT", EnumSfjlZT.toMapNoDELETE());//访视状态（无删除状态）
			pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
			mv.setViewName("gp/sfjl/sfjlhypertension/sfjlhypertension_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改随访记录
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改随访登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_CODE", getCurUser().getOrgCode());		//机构编码
		pd.put("LRR_ID", getCurUser().getProviderId());		//录入人ID
		pd.put("LRR", getCurUser().getProviderName()); 		//录入人
		sfjlHypertensionService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	

	
	/**去新增页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumMzzdwhCRB", EnumMzzdwhCRB.toMap());//用药干预，与“门诊诊断维护，是否传染病”同一枚举
		pd.put("EnumSfjlSFFS", EnumSfjlSFFS.toMap());
		pd.put("EnumSfjlSFLX", EnumSfjlSFLX.toMap());
		pd.put("EnumSfjlSFCL", EnumSfjlSFCL.toMap());
		pd.put("EnumSfjlZT", EnumSfjlZT.toMapNoDELETE());//访视状态（无删除状态）
		mv.setViewName("gp/sfjl/sfjlhypertension/sfjlhypertension_edit");   
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存新增随访记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增随访登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());						//ID
//		pd.put("ORG_NAME", getCurUser().getOrgName());		//机构
		pd.put("ORG_CODE", getCurUser().getOrgCode());		//机构编码
		pd.put("LRR_ID", getCurUser().getProviderId());		//录入人ID
		pd.put("LRR", getCurUser().getProviderName()); 		//录入人
//		pd.put("state", eaN);								//状态(正常状态)
		sfjlHypertensionService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		
		return mv;
	}
	
	
	/**删除随访登记
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除随访登记");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", eaSC);						//状态(删除状态)
		sfjlHypertensionService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除随访登记
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除随访记录信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
	 	for(String id:ids){
				pd.put("ID", id);
				pd.put("ZT", eaSC);
				sfjlHypertensionService.delete(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	
/*
	public void test() throws Exception{
		  Map<String, String> param = new HashMap<String, String>();
          param.put("p_user_name", "zhangsan");
		 
		new SfjlHypertensionService().test(param);
	
	}
	
	public static void main(String[] args) {
		try {
			new  SfjlHypertensionController().test();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	*/
	
	
	
}

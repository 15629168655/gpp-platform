/**
 * 
 */
package com.tbyf.controller.hm.regappointment;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;

import com.tbyf.service.hm.regapp.RegAppDocManager;
import com.tbyf.service.hm.regapp.RegAppSManager;
import com.tbyf.service.hm.regappointment.RegAppManager;

import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 预约挂号controller
 * @author LiuWenHao
 *
 */
@Controller
@RequestMapping(value="/regAppointment")
public class RegAppController extends BaseController{
	String menuUrl="regAppointment/list.do";//菜单地址（权限用）
	//预约挂号信息service注入
	@Resource(name="regAppService")
	private RegAppManager regAppService;
	//预约挂号医生service注入
	@Resource(name="regAppDocService")
	private RegAppDocManager regAppDocService;
	//预约挂号医生排班service注入
	@Resource(name="regAppSService")
	private RegAppSManager regAppSService;
	//居民详情service注入
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	
	/**
	 * 预约挂号信息保存
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveRegApp")
	@ResponseBody
	public Object saveRegApp(@RequestParam String REFERRAL_ID,@RequestParam String DOCGUID,@RequestParam String DOCSGUID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增RegApp");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();//返回map
		//ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "success";
		PageData pds=null;//居民的信息
		PageData pddoc=null;//医生的信息
		PageData pddocs=null;//医生的预约信息
		if(!"".equals(REFERRAL_ID)&&REFERRAL_ID!=null){
			pd.put("USER_AGENT_ID", REFERRAL_ID);
			//获取患者信息
			 pds = jmxxService.findById(pd);
			 
			if(!"".equals(DOCGUID)&&DOCGUID!=null){
				pd.clear();
				pd.put("GUID", DOCGUID);
				//获取医生信息
				 pddoc=regAppDocService.findById(pd);
				 
				if(!"".equals(DOCSGUID)&&DOCSGUID!=null){
					pd.clear();
					pd.put("GUID", DOCSGUID);
					pddocs=regAppSService.findById(pd);
				}else {
					errInfo="false";
				}
			}else {
				errInfo="false";
			}
		}else {
			errInfo="false";
		}
		//为空直接返回false，不为空才执行报错操作
		if(pds==null||pddoc==null||pddocs==null){
			errInfo="false";
		}else{
			//进行保存预约单的操作
			pd.clear();
			pd.put("GUID", this.get32UUID());
			pd.put("REGID", this.get32UUID());
			pd.put("NAME", pds.get("USER_NAME"));
			pd.put("CARDNO", pds.get("ID_NUMBER"));
			SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时的格式
			pd.put("BIRTHDAY", dateFormater.format(pds.get("BIRTHDAY_TIME")).toString());
			pd.put("PHONE", pds.get("TELEPHONE"));
			pd.put("ADDRESS", pds.get("ADDRESS"));
			//System.out.println(dateFormater.format(pddocs.get("RECEPTIOND")).toString());
			pd.put("APPTIME", dateFormater.format(pddocs.get("RECEPTIOND")).toString());
			pd.put("ORGID", pddoc.get("HOSPCODE"));
			pd.put("ORGNAME", pddoc.get("HOSPNAME"));
			pd.put("DEPTID", pddoc.get("DEPTCODE"));
			pd.put("DEPTNAME", pddoc.get("DEPTNAME"));
			pd.put("DOCTORID", pddoc.get("DOCTORCODE"));
			pd.put("DOCTORNAME", pddoc.get("DOCTORNAME"));
			pd.put("REFERRAL_ID", REFERRAL_ID);
			pd.put("ARRANGEID", DOCSGUID);
			pd.put("STATE", "1");
			pd.put("YLZD", "");
			//System.out.println(pd);
			//保存
			regAppService.save(pd);
			int docSCHEDULING = Integer.parseInt(pddoc.get("SCHEDULING").toString()) - 1;		//预约成功,可预约量-1
			int APPT = Integer.parseInt(pddoc.get("APPT").toString()) + 1;		//预约成功，预约量+1
			pddoc.remove("APPT");pddoc.remove("SCHEDULING");		//移除旧的数据
			pddoc.put("SCHEDULING", Integer.toString(docSCHEDULING));		//更新新的可预约量
			pddoc.put("APPT", Integer.toString(APPT));		//更新新的预约量
			regAppDocService.update(pddoc);		//更新医生预约信息
			int sSCHEDULING = Integer.parseInt(pddocs.get("SCHEDULING").toString()) - 1;		//排班表的可预约量
			pddocs.remove("SCHEDULING");		//移除可预约量
			pddocs.put("SCHEDULING", sSCHEDULING);		//添加预约量
			String RECEPTIONS = dateFormater.format(pddocs.get("RECEPTIONS")).toString();		//开始接诊时间
			String RECEPTIONE = dateFormater.format(pddocs.get("RECEPTIONE")).toString();		//接诊结束时间
			String RECEPTIOND = dateFormater.format(pddocs.get("RECEPTIOND")).toString();		//接诊日期
			pddocs.remove("RECEPTIONS");		//移除接诊时间
			pddocs.put("RECEPTIONS", RECEPTIONS);		//添加接诊时间
			pddocs.remove("RECEPTIONE");		//移除接诊结束时间
			pddocs.put("RECEPTIONE", RECEPTIONE);		//添加接诊结束时间
			pddocs.remove("RECEPTIOND");		//移除接诊日期
			pddocs.put("RECEPTIOND", RECEPTIOND);		//添加接诊日期
			regAppSService.update(pddocs);		//更新排班表
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 去预约挂号页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/doctor")
	public ModelAndView getDoctor(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"预约挂号");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取转诊申请单id
		//String REFERRAL_ID=pd.getString("REFERRAL_ID");
		//pd.put("REFERRAL_ID", REFERRAL_ID);
		pd.put("USER_AGENT_ID", pd.get("REFERRAL_ID").toString());		//使得患者的ID映射成居民ID
		//获得患者的信息 
		PageData pds = jmxxService.findById(pd);
		//获得该挂号列表
		PageData pdReg = regAppService.findByReferralID(pd); //该用户的挂号的历史
		if(pdReg == null || pdReg.size() == 0 || "0".equals(pdReg.get("STATE").toString())) {//当用户没有预约了，或者取消了预约，
			logger.info("---------可预约列表------");
			//传入居民详情 pbs
			mv.addObject("pds", pds);
			//得到医疗机构代码与科室代码
			//String HOSPCODE=pds.get("INORGID").toString();
			//String DEPTCODE=pds.get("INDEPTID").toString();
			//传入医疗机构代码与科室机构代码
			//pd.put("HOSPCODE", HOSPCODE);
			//pd.put("DEPTCODE", DEPTCODE);
			page.setPd(pd);
			//患者所在医院的科室列表
			List<PageData> kSList = regAppDocService.listKS(page);
			//传入科室列表
			mv.addObject("kSList", kSList);
			//得到医生列表
			List<PageData> docList = regAppDocService.list(page);//患者所在医院的的医生列表
			//传入医生列表
			mv.addObject("docList", docList);
			//遍历取医生排班列表
			//List<PageData> docsList=new ArrayList<PageData>();//新建list 存储排班信息
			Map<String, List<PageData>> docsMap = new HashMap<>();
			for(PageData doc: docList){
				String DOCTORCODE =doc.get("DOCTORCODE").toString();
				String HOSPCODE = doc.get("HOSPCODE").toString();
				pd.remove("HOSPCODE");pd.remove("DOCTORCODE");
				pd.put("HOSPCODE", HOSPCODE);
				pd.put("DOCTORCODE", DOCTORCODE);
				//检验该用户是否已经挂号
				page.setPd(pd);
				docsMap.put(DOCTORCODE, regAppSService.list(page));
				//System.out.println(regAppSService.list(page));
			}
			mv.addObject("docsMap", docsMap);
			
			mv.setViewName("hm/regappointment/regapp_doctor");
			return mv;
		}
		else {
			logger.info("-------预约详情-------");
			pdReg.put("formUrl", pd.getString("fromUrl"));
			mv.addObject("pd", pdReg);//患者的挂号信息
			mv.addObject("pds", pds);//患者的转诊信息
			mv.setViewName("hm/regappointment/regapp_info");
			return mv;
		}
		
	}
	

	/**
	 * 预约挂号信息列表
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表RegApp");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取查询条件参数
		page.setPd(pd);
		//列出regapp列表
		List<PageData> varList=regAppService.list(page);
		mv.setViewName("/hm/regappointment/regapp_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**取消预约
	 * 
	 */
	@RequestMapping(value="/cancle")
	@ResponseBody
	public Object cancle(Page page) throws Exception {
		Map<String,String> map = new HashMap<String,String>();//返回map
		logBefore(logger, Jurisdiction.getUsername()+"取消预约");
		String errInfo = "success";
		//TODO 取消预约的限制条件的处理
		PageData pd = new PageData();
		pd = this.getPageData();
		//释放预约量
		//判断该患者是否取消预约
		
		PageData pds = regAppSService.findById(pd); //预约的排班表
		PageData pddoc = regAppDocService.findByHospitialCodeAndDoctorCode(pds);//预约的医生排班
		int SCHEDULING = Integer.parseInt(pds.get("SCHEDULING").toString()) + 1;	//排班预约量+1;
		int DSCHEDULING = Integer.parseInt(pddoc.get("SCHEDULING").toString()) + 1;	//排班量+1;
		int APPT = Integer.parseInt(pddoc.get("APPT").toString()) - 1;	//预约量-1
		//System.out.println(APPT );
		pds.remove("SCHEDULING");pddoc.remove("APPT");pddoc.remove("SCHEDULING");	//剔除旧数据
		//添加新数据
		pds.put("SCHEDULING", SCHEDULING);
		pddoc.put("SCHEDULING", Integer.toString(DSCHEDULING));
		pddoc.put("APPT", Integer.toString(APPT));
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时的格式
		String RECEPTIONS = dateFormater.format(pds.get("RECEPTIONS")).toString();		//开始接诊时间
		String RECEPTIONE = dateFormater.format(pds.get("RECEPTIONE")).toString();		//接诊结束时间
		String RECEPTIOND = dateFormater.format(pds.get("RECEPTIOND")).toString();		//接诊日期
		pds.remove("RECEPTIONS");		//移除接诊时间
		pds.put("RECEPTIONS", RECEPTIONS);		//添加接诊时间
		pds.remove("RECEPTIONE");		//移除接诊结束时间
		pds.put("RECEPTIONE", RECEPTIONE);		//添加接诊结束时间
		pds.remove("RECEPTIOND");		//移除接诊日期
		pds.put("RECEPTIOND", RECEPTIOND);		//添加接诊日期
		regAppSService.update(pds);		//更新取消后的数据
		regAppDocService.update(pddoc);		//更新取消后的数据
		pd.put("STATE", "0");
		regAppService.update(pd);//改变状态预约的状态
		map.put("result", errInfo);
		
		return  AppUtil.returnObject(new PageData(), map);
	}
	/**预约详情
	 * @throws Exception 
	 * 
	 */
	@RequestMapping(value="/info")
	public ModelAndView info() throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"预约挂号");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdReg = regAppService.findById(pd); //患者的预约信息
		PageData pds = jmxxService.findById(pdReg);//患者的基本信息
		pdReg.put("formUrl", pd.getString("fromUrl"));
		mv.addObject("pd", pdReg);//患者的挂号信息
		mv.addObject("pds", pds);//居民的基本信息
		mv.setViewName("hm/regappointment/regapp_info");
		
		return mv;
	}
	/**更新医生详情的预约量
	 * 
	 */
	public void update() throws Exception {
		Page page = new Page();
		logBefore(logger, Jurisdiction.getUsername()+"更新预约量");
		//取消预约的限制条件的处理
		PageData pd = new PageData();
		pd = this.getPageData();
		//遍历医生表，更新所有的数据
		List<PageData> pdDocs = regAppDocService.listAll(pd);
		for(int i = 0; i < pdDocs.size(); i ++) {
			int SCHEDULING = 0;		//医生可预约量
			int APPT = 0;		//医生当前的预约量
			//遍历医生的排班列表
			pd = pdDocs.get(i);
			page.setPd(pd);
			List<PageData> pds = regAppSService.list(page);
			for(int j = 0; j < pds.size(); j++) {
				SCHEDULING += Integer.parseInt(pds.get(i).get("SCHEDULING").toString()); //更新可约
				APPT += Integer.parseInt(pds.get(i).getString("")) - Integer.parseInt(pds.get(i).get("SCHEDULING").toString()); //更新已经预约的量
			}
			pd.remove("APPT");pd.remove("SCHEDULING");	//剔除旧数据
			//添加新数据
			pd.put("SCHEDULING", Integer.toString(SCHEDULING));
			pd.put("APPT", Integer.toString(APPT));
			regAppDocService.update(pd);		//更新取消后的数据
		}
		
	}
	
}

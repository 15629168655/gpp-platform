package com.tbyf.controller.gp.kcf;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.autoregister.impl.AutoRegisterService;
import com.tbyf.service.gp.lcxm.LcxmManager;
import com.tbyf.service.gp.lcxmdzb.impl.LcxmdzbService;
import com.tbyf.service.gp.mzcfmx.MzcfmxManager;
import com.tbyf.service.gp.mzjzjl.MzjzjlManager;
import com.tbyf.service.gp.mzsfmx.MzsfmxManager;
import com.tbyf.service.gp.ypmx.YpmxManager;
import com.tbyf.service.hm.diseasecode.DiseaseCodeManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 开处方
 */
@Controller
@RequestMapping(value="/kcf")
public class KcfController extends BaseController {
	@Resource(name="diseasecodeService")
	private DiseaseCodeManager diseasecodeService;
	@Resource(name="autoRegisterService")
	private AutoRegisterService autoRegisterService;
	@Resource(name="ypmxService")
	private YpmxManager ypmxService;
	@Resource(name="mzjzjlService")
	private MzjzjlManager mzjzjlService;
	@Resource(name="mzcfmxService")
	private MzcfmxManager mzcfmxService;
	@Resource(name="mzsfmxService")
	private MzsfmxManager mzsfmxService;
	@Resource(name="lcxmService")
	private LcxmManager lcxmService;
	@Resource(name="lcxmdzbService")
	private LcxmdzbService lcxmdzbService;
	
	@RequestMapping(value = "/kcf_list")
    public ModelAndView kcfList(HttpServletRequest request) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);			
		String id = request.getParameter("id");
		if(id.equals("0")) {
			pd.put("id", user.getUserId());
		}
		else {
			pd.put("id", id);
		}
		System.out.println(pd);
		//pd.put("id", user.getUserId());
		PageData gh=autoRegisterService.queryPersonObjById(pd);
		mv.addObject("pd",gh);
		mv.setViewName("gp/kcf/kcf_list");
		return mv;
    }
	
	@RequestMapping(value = "/jbzd_list")
    public ModelAndView jbzdData(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = diseasecodeService.list(page);	//列出DiseaseCode列表
		mv.setViewName("gp/kcf/jbzd_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
    }
	/**
	 * 查询药品
	 * @return
	 */
	@RequestMapping(value="/queryAllYP")
    public Object queryAllYP(Page page)throws Exception
    {
    	ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = ypmxService.list(page);	
		mv.setViewName("gp/kcf/ypmxData");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
    }
	/**
	 * 开处方
	 * @return
	 */
	@RequestMapping(value="/saveYP")
    public Object saveYP()
    {
    	//ModelAndView mv = this.getModelAndView();
		PageData pd =this.getPageData();
		String ghbm = pd.getString("ghbm");
		try {
			PageData gh = new PageData();
			gh.put("id", ghbm);//诊断编码
			//System.out.println(gh);
			gh = autoRegisterService.queryPersonObjById(gh);
			//System.out.println(gh);
			/*门诊就诊记录*/
			PageData mzjzjl = new PageData();
			mzjzjl.put("ID", UUID.randomUUID().toString());
			mzjzjl.put("YLJGDM", this.getCurUser().getOrgCode());//医疗机构代码
			mzjzjl.put("JZLSH", UUID.randomUUID().toString());//就诊流水号
			mzjzjl.put("KH", gh.getString("KH")); // 卡号
			mzjzjl.put("KLX", gh.getString("KLX")); // 卡类型
			mzjzjl.put("HZXM", gh.getString("XM")); //患者姓名
			mzjzjl.put("JZLX", gh.getString("GHLB")); // 就诊类型
			mzjzjl.put("JZKSBM", gh.getString("KSBM")); //就诊科室编码
			mzjzjl.put("JZKSMC", gh.getString("KSMC"));//就诊科室名称
			mzjzjl.put("JZKSRQ", pd.getString("cfsj")); //就诊日期(处方时间)
			mzjzjl.put("ZZYSGH", this.getCurUser().getProviderCode()); //主诊医生工号
			mzjzjl.put("ZZYSXM", this.getCurUser().getProviderName()); //主诊医生姓名
			mzjzjl.put("JZZDBM", pd.getString("jbbm")); //门诊诊断编码
			mzjzjl.put("MZZDMC", pd.getString("jbmc")); //门诊诊断名称
			mzjzjl.put("YLFYLYLB", gh.getString("YLFYLYLB")); //医疗费用来源类别
			mzjzjl.put("HZGSD", gh.getString("HZGSD")); //患者归属地 
			mzjzjl.put("PERSONID", gh.getString("personID")); //院内患者唯一ID号
			mzjzjl.put("XGBZ", 0); //修改标志
			mzjzjlService.save(mzjzjl);
			
			
			PageData cfmx = new PageData();
			String data = pd.getString("data");
			
		   PageData sfmx = new PageData();
			 JSONArray array = JSONArray.fromObject(data); 
		        for(int i = 0; i < array.size(); i++){   
		        	/*门诊处方明细*/
		            JSONObject jsonObject = array.getJSONObject(i);  
		            cfmx.put("XMBM",jsonObject.get("xmid").toString());//项目编码
		            cfmx.put("XMMC",jsonObject.get("mc").toString());//项目名称
		            cfmx.put("XMDJ",Float.valueOf((String) jsonObject.get("dj")));//项目单价
		            cfmx.put("YPSL",Integer.valueOf((String) jsonObject.get("sl")));//发药数量
		            cfmx.put("YPGG",jsonObject.get("gg").toString());//药品规格
		            cfmx.put("FYJE",1);//费用金额
		            cfmx.put("CFTS",1);//处方贴数
		            cfmx.put("JL",1);//每次使用剂量
		            cfmx.put("MCSL",1);//每次使用数量
		            cfmx.put("YYTS",1);//用药天数
		            cfmx.put("SFYP","1");//是否药品(1.药品 0.非药品)
		            cfmx.put("ID", UUID.randomUUID().toString());
					cfmx.put("CYH",UUID.randomUUID().toString() );//处方号
					cfmx.put("CFMXHM",UUID.randomUUID().toString() );//处方号
					cfmx.put("YLJGDM",this.getCurUser().getOrgCode());//医疗机构代码
					cfmx.put("JZLSH",mzjzjl.getString("JZLSH"));//门诊就诊流水号
					cfmx.put("CFLX",pd.getString("cflx"));//处方类型
					cfmx.put("KH",gh.getString("KH"));//卡号
					cfmx.put("KLX",gh.getString("KLX"));//卡类型
					cfmx.put("JZKSDM",gh.getString("KSBM"));//就诊科室编码
					cfmx.put("JZKSMC",gh.getString("KSMC"));//就诊科室名称
					cfmx.put("KFRQ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd.getString("cfsj"))); //处方时间
					cfmx.put("KFYS", this.getCurUser().getProviderCode()); //主诊医生工号
					cfmx.put("KFYSXM", this.getCurUser().getProviderName()); //主诊医生姓名
					cfmx.put("PERSONID", gh.getString("personID")); //院内患者唯一ID号
					mzcfmxService.save(cfmx);
					 /*门诊收费明细*/
					sfmx.put("ID", UUID.randomUUID().toString());
			        sfmx.put("SFMXID", UUID.randomUUID().toString());
			        sfmx.put("YLJGDM",this.getCurUser().getOrgCode());//医疗机构代码
			        sfmx.put("JZLSH",mzjzjl.getString("JZLSH"));//门诊就诊流水号
			        sfmx.put("KH",gh.getString("KH"));//卡号
			        sfmx.put("KLX",gh.getString("KLX"));//卡类型
			        sfmx.put("CFIDH",cfmx.getString("CYH") );//处方号
			        sfmx.put("STFSJ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd.getString("cfsj"))); //收费/退费时间
			        sfmx.put("MXXMBM",jsonObject.get("xmid").toString());//明细项目编码
			        sfmx.put("MXXMMC",jsonObject.get("mc").toString());//明细项目名称
			        sfmx.put("MXXMDJ",jsonObject.get("dj"));//明细项目单价
			        sfmx.put("MXXMSL",jsonObject.get("sl"));//明细项目数量
			        sfmx.put("MXXMDW",jsonObject.get("gg"));//明细项目单位
			        sfmx.put("PERSONID", gh.getString("personID")); //院内患者唯一ID号
			        sfmx.put("XGBZ", 0); //修改标志
			        sfmx.put("MXXMJE", 1); //明细项目金额
			        mzsfmxService.save(sfmx);
			        
		        }
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("/kcf/kcf_list?id="+ghbm);
    }
	@RequestMapping(value="/saveLCXM")
    public Object saveLCXM(){
		ModelAndView mv = this.getModelAndView();
		PageData pd =this.getPageData();
		String ghbm = pd.getString("ghbm");
		try {
			PageData gh = new PageData();
			gh.put("id", ghbm);
			gh = autoRegisterService.queryPersonObjById(gh);
			/*门诊就诊记录*/
			PageData mzjzjl = new PageData();
			mzjzjl.put("ID", UUID.randomUUID().toString());
			mzjzjl.put("YLJGDM", this.getCurUser().getOrgCode());//医疗机构代码
			mzjzjl.put("JZLSH", UUID.randomUUID().toString());//就诊流水号
			mzjzjl.put("KH", gh.getString("KH")); // 卡号
			mzjzjl.put("KLX", gh.getString("KLX")); // 卡类型
			mzjzjl.put("HZXM", gh.getString("XM")); //患者姓名
			mzjzjl.put("JZLX", gh.getString("GHLB")); // 就诊类型
			mzjzjl.put("JZKSBM", gh.getString("KSBM")); //就诊科室编码
			mzjzjl.put("JZKSMC", gh.getString("KSMC"));//就诊科室名称
			mzjzjl.put("JZKSRQ", pd.getString("cfsj")); //就诊日期(处方时间)
			mzjzjl.put("ZZYSGH", this.getCurUser().getProviderCode()); //主诊医生工号
			mzjzjl.put("ZZYSXM", this.getCurUser().getProviderName()); //主诊医生姓名
			mzjzjl.put("JZZDBM", pd.getString("jbbm")); //门诊诊断编码
			mzjzjl.put("MZZDMC", pd.getString("jbmc")); //门诊诊断名称
			mzjzjl.put("YLFYLYLB", gh.getString("YLFYLYLB")); //医疗费用来源类别
			mzjzjl.put("HZGSD", gh.getString("HZGSD")); //患者归属地 
			mzjzjl.put("PERSONID", gh.getString("personID")); //院内患者唯一ID号
			mzjzjl.put("XGBZ", 0); //修改标志
			mzjzjlService.save(mzjzjl);
			
			PageData cfmx = new PageData();
			String data = pd.getString("data");
		    PageData sfmx = new PageData();
		    JSONArray array = JSONArray.fromObject(data);
		    for(int i = 0; i < array.size(); i++){   
		    	/*门诊处方明细*/
	            JSONObject jsonObject = array.getJSONObject(i);  
	            cfmx.put("XMBM",jsonObject.get("xmid").toString());//项目编码
	            cfmx.put("XMMC",jsonObject.get("mc").toString());//项目名称
	  //          cfmx.put("XMDJ",Float.valueOf((String) jsonObject.get("dj")));//项目单价
	            cfmx.put("YPSL",Integer.valueOf((String) jsonObject.get("sl")));//发药数量
	            cfmx.put("YPGG",jsonObject.get("gg").toString());//药品规格
	            cfmx.put("FYJE",1);//费用金额
	            cfmx.put("CFTS",1);//处方贴数
	            cfmx.put("JL",1);//每次使用剂量
	            cfmx.put("MCSL",1);//每次使用数量
	            cfmx.put("YYTS",1);//用药天数
	            cfmx.put("SFYP","1");//是否药品(1.药品 0.非药品)
	            cfmx.put("ID", UUID.randomUUID().toString());
				cfmx.put("CYH",UUID.randomUUID().toString() );//处方号
				cfmx.put("CFMXHM",UUID.randomUUID().toString() );//处方号
				cfmx.put("YLJGDM",this.getCurUser().getOrgCode());//医疗机构代码
				cfmx.put("JZLSH",mzjzjl.getString("JZLSH"));//门诊就诊流水号
				cfmx.put("CFLX",pd.getString("cflx"));//处方类型
				cfmx.put("KH",gh.getString("KH"));//卡号
				cfmx.put("KLX",gh.getString("KLX"));//卡类型
				cfmx.put("JZKSDM",gh.getString("KSBM"));//就诊科室编码
				cfmx.put("JZKSMC",gh.getString("KSMC"));//就诊科室名称
				cfmx.put("KFRQ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd.getString("cfsj"))); //处方时间
				cfmx.put("KFYS", this.getCurUser().getProviderCode()); //主诊医生工号
				cfmx.put("KFYSXM", this.getCurUser().getProviderName()); //主诊医生姓名
				cfmx.put("PERSONID", gh.getString("personID")); //院内患者唯一ID号
				mzcfmxService.save(cfmx);
		    	
				/*门诊收费明细*/
				String sfmxData = jsonObject.get("sfmxArr").toString();
				JSONArray sfmxArr = JSONArray.fromObject(sfmxData);
				for(int j = 0; j < sfmxArr.size(); j++){
					JSONObject obj = sfmxArr.getJSONObject(j);
					sfmx.put("ID", UUID.randomUUID().toString());
			        sfmx.put("SFMXID", UUID.randomUUID().toString());
			        sfmx.put("YLJGDM",this.getCurUser().getOrgCode());//医疗机构代码
			        sfmx.put("JZLSH",mzjzjl.getString("JZLSH"));//门诊就诊流水号
			        sfmx.put("KH",gh.getString("KH"));//卡号
			        sfmx.put("KLX",gh.getString("KLX"));//卡类型
			        sfmx.put("CFIDH",cfmx.getString("CYH") );//处方号
			        sfmx.put("STFSJ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(pd.getString("cfsj"))); //收费/退费时间
			        sfmx.put("MXXMBM",obj.get("xmid").toString());//明细项目编码
			        sfmx.put("MXXMMC",obj.get("mc").toString());//明细项目名称
			        sfmx.put("MXXMDJ",obj.get("dj"));//明细项目单价
			        sfmx.put("MXXMSL",obj.get("sl"));//明细项目数量
			        sfmx.put("MXXMDW",obj.get("gg"));//明细项目单位
			        sfmx.put("PERSONID", gh.getString("personID")); //院内患者唯一ID号
			        sfmx.put("XGBZ", 0); //修改标志
			        sfmx.put("MXXMJE", 1); //明细项目金额
			        mzsfmxService.save(sfmx);
				}
		    	
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("/kcf/kcf_list?id="+ghbm);
	}
	
	/**
	 * 查询临床项目
	 * @return
	 */
	@RequestMapping(value="/getLCXM")
	@ResponseBody
    public Object getLCXM()throws Exception
    {
    	ModelAndView mv = this.getModelAndView();
    	Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		List<PageData> list=lcxmService.getParentMenu(pd);
		map.put("pd", list);
		
		return AppUtil.returnObject(new PageData(), map);
    }
	/**
	 * 查询临床项目
	 * @return
	 */
	@RequestMapping(value="/queryLCXM")
    public Object queryLCXM(Page page)throws Exception
    {
    	ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = lcxmService.list(page);	
		mv.setViewName("gp/kcf/lcxmData");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
    }
	/**
	 * 查询临床项目对照
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryLCXMDZ")
	@ResponseBody
    public Object queryLCXMDZ() throws Exception
    {
    	ModelAndView mv = this.getModelAndView();
    	Map<String,Object> map = new HashMap<String,Object>();
		PageData pd =this.getPageData();
		List<PageData>	list = lcxmdzbService.queryByBM(pd);
		map.put("pd", list);
		
		return AppUtil.returnObject(new PageData(), map);		
    }
}

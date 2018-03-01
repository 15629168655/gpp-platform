package com.tbyf.controller.gp.mzbl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumMzblZT;
import com.tbyf.entity.enums.EnumMzblmbLX;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.autoregister.impl.AutoRegisterService;
import com.tbyf.service.gp.mzbl.impl.MzblService;
import com.tbyf.service.gp.mzblmb.impl.MzblmbService;
import com.tbyf.service.gp.mzjzjl.MzjzjlManager;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/** 
 * 说明：门诊病历
 * 创建人：lizk
 * 创建时间：2017-02-14
 */
@Controller
@RequestMapping(value="/mzbl")
public class MzblController extends BaseController {

	String menuUrl = "mzbl/mzbl_list.do"; //菜单地址(权限用)
	@Resource(name="autoRegisterService")
	private AutoRegisterService autoRegisterService;
	
	@Resource(name="mzblService")
	private MzblService mzblService;
	
	@Resource(name="mzjzjlService")
	private MzjzjlManager mzjzjlService;
	
	@Resource(name="mzblmbService")
	private MzblmbService mzblmbService;
	
	
	/**去填写门诊病历和门诊病历列表页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goMzblInfo")
	public ModelAndView goMzblInfo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("gp/mzbl/mzbl_info");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去填写门诊病历页面
	 * @param
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/mzbl")
    public ModelAndView mzbl() throws Exception {
		ModelAndView mv = this.getModelAndView();
//		PageData pd = null;//存放门诊病历的记录
//		PageData blmbPd = null;//存放门诊病历模板录入门诊病历的字段（也可以理解成门诊病历表跟门诊病历对照表共有的字段）
		PageData pd0 = this.getPageData();//pd0用于存放页面传值参数
		pd0.put("ID", pd0.getString("BLMBID"));
		if("edit".equals(pd0.getString("msg"))){
			PageData pd = mzblService.findByID(pd0);
			//**********blmbPd存在的目的是多个功能共用一个页面
			PageData blmbPd = new PageData();
			blmbPd.put("BLMC", pd.getString("BLMC"));//病历名称
			blmbPd.put("ZS", pd.getString("ZS"));//主诉
			blmbPd.put("XBS", pd.getString("XBS"));//现病史
			blmbPd.put("JWS", pd.getString("JWS"));//既往史
			blmbPd.put("TJ", pd.getString("TJ"));//体检
			blmbPd.put("FZJCJG", pd.getString("FZJCJG"));//辅助检查结果
			blmbPd.put("CBPD", pd.getString("CBPD"));//初步判断
			blmbPd.put("ZLYJ", pd.getString("ZLYJ"));//治疗意见
			//*********不同表中字段名不同需要转换
			pd.put("XM", pd.getString("HZXM"));//患者姓名
			pd.put("JZLSH", pd.getString("MZJZLSH"));//就诊流水号
			pd.put("PERSONID", pd.getString("HZID"));//患者ID
			pd.put("YLJGDM", pd.getString("JGBM"));//机构编码
			mv.addObject("pd1",pd.put("JZKSRQ", pd.getString("JZSJ")));
			mv.addObject("pd",pd);
			mv.addObject("blmbPd",blmbPd);
			mv.addObject("msg", "edit");
		} else {
			PageData pd = autoRegisterService.queryPersonObjById(pd0);//pd用于存放通过参数小写id查询出来的挂号表信息
			PageData blmbPd = mzblmbService.findByID(pd0);//通过病历模板的ID查询，套用到开门诊病历页面
			PageData jzjl = mzjzjlService.findByPersonid(pd0);//用于存放通过Personid查询出来的就诊表信息
			mv.addObject("pd1", jzjl);
			mv.addObject("pd",pd);
			mv.addObject("blmbPd",blmbPd);
			mv.addObject("msg", "save");
		}
		mv.addObject("pd0",pd0);
		mv.setViewName("gp/mzbl/mzbl_list");
		return mv;
    }
	
	/**新增门诊病历
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "save")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增保存门诊病历模板信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = this.get32UUID();
		pd.put("ID", id);
		pd.put("YSBH", getCurUser().getProviderCode());//医生编号
		pd.put("YSXM", getCurUser().getProviderName());//医生姓名
		if(pd.getString("s").equals("0")){
			pd.put("ZT", EnumMzblZT.SAVE.getCode());//保存状态
		}else if(pd.getString("s").equals("1")){
			pd.put("ZT", EnumMzblZT.SUBMIT.getCode());//提交状态
		}
		mzblService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return new ModelAndView("redirect:/mzbl/mzbl?success=success&id="+pd.getString("id")); //添加成功刷新
	}
	
	/**修改门诊病历
	 * @param out
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "save")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改保存门诊病历模板信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("YSBH", getCurUser().getProviderCode());//医生编号
		pd.put("YSXM", getCurUser().getProviderName());//医生姓名
		if(pd.getString("s").equals("0")){
			pd.put("ZT", EnumMzblZT.SAVE.getCode());//保存状态
		}else if(pd.getString("s").equals("1")){
			pd.put("ZT", EnumMzblZT.SUBMIT.getCode());//提交状态
		}
		mzblService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return new ModelAndView("redirect:/mzbl/mzbl?success=success&id="+pd.getString("id")); //添加成功刷新
	}
	
	/**显示门诊病历列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"门诊病历列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", EnumMzblZT.DELETE.getCode());//删除状态
		page.setPd(pd);
		try{
			List<PageData>	varList = mzblService.list(page);
			mv.addObject("varList", varList);
			mv.setViewName("gp/mzbl/hzMzbl_list");
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**显示左侧门诊病历模板
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/goTymb")
	public ModelAndView goTymb(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"门诊病历模板列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			List<PageData>	varList = mzblmbService.list(page);
			pd.put("EnumMzblmbLX", EnumMzblmbLX.toMap()); 	//类型（0：个人、1：公共）
			mv.addObject("varList", varList);
			mv.setViewName("gp/mzbl/mzblmb_list");
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**显示右侧门诊病历内容
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/mzblmb")
	public ModelAndView mzblmb(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"门诊病历模板");
		ModelAndView mv = this.getModelAndView();
		PageData pd1 = new PageData();
		pd1 = this.getPageData();
		PageData pd = null;
		try{
			if(null == pd1.getString("ID") || "".equals(pd1.getString("ID"))){
				page.setPd(pd1);
				List<PageData>	varList = mzblmbService.list(page);
				if(varList.size() > 0){					
					pd1.put("ID", varList.get(0).getString("ID"));	//第一次打开时，右边默认显示第一条信息	
					pd = mzblmbService.findByID(pd1);
				}
			}else{
				pd = mzblmbService.findByID(pd1);		
			}
			pd.put("EnumMzblmbLX", EnumMzblmbLX.toMap()); 	//类型（0：个人、1：公共）	
			mv.setViewName("gp/mzbl/mzblmb_mzbl");
			mv.addObject("pd", pd);//pd用于查询结果传递
			mv.addObject("pd1",pd1);//pd1用于参数传递
			mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**删除门诊病历
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除门诊病历");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", EnumMzblZT.DELETE.getCode());//删除状态
		mzblService.delete(pd);
		out.write("success");
		out.close();
	}
	
}

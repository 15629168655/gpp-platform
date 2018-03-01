package com.tbyf.controller.gp.treatecase;

import java.sql.Blob;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumAgreement;
import com.tbyf.entity.enums.EnumDiseaseCode;
import com.tbyf.entity.enums.EnumImplEffect;
import com.tbyf.entity.enums.EnumIntervalCompany;
import com.tbyf.entity.enums.EnumIsImprotantP;
import com.tbyf.entity.enums.EnumIsSign;
import com.tbyf.entity.enums.EnumTreateCaseState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.treatecase.TreateCaseManager;
import com.tbyf.service.gp.treatecase.TreateCaseRecordManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;
/**
 * 治疗方案的记录
 * @author zanxc
 * @创建日期2017年8月24日下午3:18:52
 */
@Controller
@RequestMapping(value="/treateCaseRecord")
public class TreateCaseRecordController extends BaseController{

	String menuUrl = "treateCaseRecord/list.do"; //菜单地址(权限用)
	@Resource(name="treateCaseRecordService")
	private TreateCaseRecordManager treateCaseRecordService;//治疗方案
	@Resource(name="treateCaseService")
	private TreateCaseManager treateCaseService;//治疗方案
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	Integer EnumUnexecuted = EnumTreateCaseState.EXECUTED.getCode();//未执行
	Integer Enumexecuted = EnumTreateCaseState.EXECUTED.getCode();//执行中
	Integer EnumCompleted =  EnumTreateCaseState.COMPLETED.getCode();//完结
	Integer eaD = EnumAgreement.DELETE.getCode();//枚举，删除状态
	Integer eaE = EnumAgreement.EFFECTIVE.getCode();//枚举，有效状态
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示重点人群的治疗方案");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROVIDER_ID", this.getCurrentUser().getProviderId());
		pd.put("STATE", eaD);
		pd.put("zdrq", EnumIsImprotantP.YES.getCode());//重点人群列表
		pd.put("is_sign", EnumIsSign.YES.getCode());//是否签约
		page.setPd(pd);
		List<PageData>	jmxxList = jmxxService.listAlljmxx(page);//居民列表
		mv.setViewName("gp/treatecase/treate_record_list");
		mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("jmxxList", jmxxList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 治疗方案数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dataCase")
	@ResponseBody
	public Object dataCase(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"重点人群的治疗方案数据");
		Map<String,Object> data = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("IMPL_STATE", EnumTreateCaseState.COMPLETED.getCode());//显示已经执行完成的治疗方案
		List<PageData>	list = treateCaseRecordService.findFinished(pd);				//治疗方案列表
		data.put("varList", list);
		data.put("pd", pd);
		return AppUtil.returnObject(new PageData(), data);
	}
	/**
	 * 显示方案的内容
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/caseInfo")
	public ModelAndView caseInfo()throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示方案内容");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = treateCaseService.findById(pd);
		/**
		 * Blob格式的转换
		 */
		Object CONTENT = pd.get("CASE_CONTENT");
		String content = null;  
	    byte[] inbytes=null;  
	    if(CONTENT instanceof Blob){  
	        Blob blob = (Blob) CONTENT;  
	        if (blob != null) {  
	            inbytes = blob.getBytes(1, (int) blob.length());  
	        }  
	        content =new String (inbytes);  
	    }
	    pd.put("CASE_CONTENT", content);
	    if(null != pd.get("IMPL_SUGGESTION")) {
	    	Object SUGGESTION = pd.get("IMPL_SUGGESTION");
			String suggestion = null;  
		    byte[] sinbytes=null;  
		    if(CONTENT instanceof Blob){  
		        Blob blob = (Blob) SUGGESTION;  
		        if (blob != null) {  
		        	sinbytes = blob.getBytes(1, (int) blob.length());  
		        }  
		        suggestion =new String (sinbytes);  
		        pd.put("CASE_CONTENT", suggestion);
		    }
		}
	    mv.addObject("STATE", EnumTreateCaseState.toMap());//方案的状态
		mv.addObject("RESIDENTTYPE", EnumDiseaseCode.toMap());//人群的类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("IMPLEFFECF", EnumImplEffect.toMap());
		mv.setViewName("gp/treatecase/treate_record_info");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 更新治疗方案的效果，建议
	 * 修改编辑方案
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateCase")
	public ModelAndView updateCase() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改编辑方案");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("OPERATOR_ID", this.getCurUser().getProviderId());//操作人ID	
		pd.put("OPERATOR_NAME", this.getCurrentUser().getProviderName());//操作人姓名
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		/**
		 * blob格式转化
		 */
		if(null != pd.getString("CASE_CONTENT") && !"".equals(pd.getString("CASE_CONTENT"))){			
			byte[] CASE_CONTENT = pd.getString("CASE_CONTENT").getBytes();//将blob类型转换
			pd.put("CASE_CONTENT", CASE_CONTENT);//内容
		}
		/**
		 * blob格式转化
		 */
		if(null != pd.getString("IMPL_SUGGESTION") && !"".equals(pd.getString("IMPL_SUGGESTION"))){			
			byte[] IMPL_SUGGESTION = pd.getString("CASE_CONTENT").getBytes();//将blob类型转换
			pd.put("IMPL_SUGGESTION", IMPL_SUGGESTION);//内容
		}
		treateCaseService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
}

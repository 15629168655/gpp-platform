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
import com.tbyf.entity.enums.EnumDiseaseCode;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumIntervalCompany;
import com.tbyf.entity.enums.EnumTreateCaseModelState;
import com.tbyf.entity.enums.EnumTreateCaseModelType;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.treatecase.TreateCaseModelManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;


/**治疗方案模板
 * @author zanxc
 * 创建日期2017年7月27日
 */
@Controller
@RequestMapping(value="/treateCaseModel")
public class TreateCaseModelController extends BaseController{

	String menuUrl = "treateCaseModel/list.do"; //菜单地址(权限用)
	@Resource(name="treateCaseModelService")
	private TreateCaseModelManager treateCaseModelService;//治疗方案的model
	Integer EnumEnable = EnumTreateCaseModelState.ENABLE.getCode();//模板为启用的状态
	Integer EnumDel = EnumTreateCaseModelState.DEL.getCode();//模板为删除状态
	/**显示治疗方案的模板
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		logBefore(logger, Jurisdiction.getUsername()+"显示治疗方案模板");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", EnumEnable);//模板为启用的状态
		page.setPd(pd);
		List<PageData>	modelList = treateCaseModelService.list(page);//治疗方案模板列表
		mv.setViewName("gp/treatecase/treatecasemodel_list");
		mv.addObject("DISEASENAME", EnumDiseaseCode.toMap());//人群类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("modelList", modelList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 给模板添加居民
	 * @param page
	 * @return
	 * @throws Exception
	 
	@RequestMapping(value="/addCase")
	public ModelAndView addCase(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"治疗方案模板添加居民新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TREATE_MODEL_ID", this.get32UUID());					//主键
		mv.addObject("pd", pd);
		mv.setViewName("gp/treatecase/treatecasemodel_add");
		mv.addObject("msg", "addPage");
		return mv;
	}*/
	/**
	 * 治疗方案模板的新增界面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addPage")
	public ModelAndView addPage(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"治疗方案新增界面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_NAME", this.getCurUser().getOrgName());
		pd.put("ORG_CODE", this.getCurrentUser().getOrgCode());
		mv.setViewName("gp/treatecase/treatecasemodel_edit");
		mv.addObject("DISEASENAME", EnumDiseaseCode.toMap());//人群类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("TYPE", EnumTreateCaseModelType.toMap());//模板的类型
		mv.addObject("pd", pd);
		mv.addObject("msg", "saveModel");
		return mv;
	}
	/**
	 * 保存治疗方案模板
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveModel")
	public ModelAndView saveModel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存治疗方案模板");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TREATE_MODEL_ID", this.get32UUID());					//主键
		String nowDate = Tools.date2Str(new Date());
		pd.put("USED_COUNT", 0);//使用次数默认为0
		pd.put("SCORE", 0);//分数默认为0
		pd.put("CREAT_TIME",nowDate);		  //创建时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("STATE", EnumEnable);//模板的的状态启用
		/**
		 * Blob的转化
		 */
		if(null != pd.getString("MODEL_CONTENT") && !"".equals(pd.getString("MODEL_CONTENT"))){			
			byte[] MODEL_CONTENT = pd.getString("MODEL_CONTENT").getBytes();//将blob类型转换
			pd.put("MODEL_CONTENT", MODEL_CONTENT);//内容
		}
		treateCaseModelService.save(pd);
		/**
		 * 
		
		pd = treateCaseModelService.findById(pd);
		mv.addObject("msg","editModel");
		mv.addObject("pd", pd);
		mv.addObject("DISEASENAME", EnumDiseaseCode.toMap());//人群类型
		mv.addObject("INTREVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.setViewName("gp/treatecase/treatecasemodel_edit");
		*/
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 治疗方案模编辑界面，包括给居民添加的治疗方案
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editCase")
	public ModelAndView listDis(Page page)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"治疗方案模编辑界面，包括给居民添加的治疗方案");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/treatecase/treatecasemodel_add");
		mv.addObject("msg","edit");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 治疗方案模板编辑界面
	 */
	@RequestMapping(value="/editPage")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"治疗方案模板编辑界面");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = treateCaseModelService.findById(pd);
		/**
		 *blob类型转化
		 */
		if(pd.containsKey("MODEL_CONTENT")) {
			Object CONTENT = pd.get("MODEL_CONTENT");
			String content = null;  
		    byte[] inbytes=null;  
		    if(CONTENT instanceof Blob){  
		        Blob blob = (Blob) CONTENT;  
		        if (blob != null) {  
		            inbytes = blob.getBytes(1, (int) blob.length());  
		        }  
		        content =new String (inbytes);  
		    }
		    pd.put("MODEL_CONTENT", content);
		}
		mv.addObject("pd", pd);
		mv.addObject("DISEASENAME", EnumDiseaseCode.toMap());//人群类型
		mv.addObject("INTERVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.addObject("TYPE", EnumTreateCaseModelType.toMap());//模板的类型
		mv.setViewName("gp/treatecase/treatecasemodel_edit");
		mv.addObject("msg", "editModel");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/editModel")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"治疗方案模板修改");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String nowDate = Tools.date2Str(new Date());
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("STATE", EnumIndexState.NORAML.getCode());//添加状态正常
		/**
		 * Blob的转化
		 */
		if(null != pd.getString("MODEL_CONTENT") && !"".equals(pd.getString("MODEL_CONTENT"))){			
			byte[] MODEL_CONTENT = pd.getString("MODEL_CONTENT").getBytes();//将blob类型转换
			pd.put("MODEL_CONTENT", MODEL_CONTENT);//内容
		}
		treateCaseModelService.edit(pd);
		pd = treateCaseModelService.findById(pd);
		/*
		mv.addObject("msg","editModel");
		mv.addObject("pd", pd);
		mv.addObject("DISEASENAME", EnumDiseaseCode.toMap());//人群类型
		mv.addObject("INTREVALCOMPANY", EnumIntervalCompany.toMap());//间隔的单位
		mv.setViewName("gp/treatecase/treatecasemodel_edit");
		*/
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**删除治疗方案模板
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除治疗方案");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STATE", EnumDel);
		String nowDate = Tools.date2Str(new Date());//删除的时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		treateCaseModelService.delete(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	/**批量删除治疗方案的模板
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除治疗方案");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String IDS=String.valueOf(pd.get("IDS"));
		if(null!=IDS && !IDS.equals("")){
        	String[] str = IDS.split(",");
        	StringBuffer sb = new StringBuffer("(");
        	for(String s:str){
        		sb.append("'"+s+"',");
        	}
        	
        	pd.put("IDS", sb.substring(0, sb.length()-1)+")");
        }
		String nowDate = Tools.date2Str(new Date());//删除的时间
		pd.put("EDIT_TIME", nowDate);		//修改时间
		pd.put("STATE", EnumDel);
		treateCaseModelService.delAll(pd);
		map.put("msg", "SUCCESS");
		return AppUtil.returnObject(new PageData(), map);
		
	}
}

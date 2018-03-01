package com.tbyf.controller.gp.formdesigner;
import com.google.gson.Gson;
import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.EnumBloodPressure;
import com.tbyf.entity.enums.EnumErmForm;
import com.tbyf.entity.enums.EnumTySex;
import com.tbyf.entity.gp.Ysfl;
import com.tbyf.service.gp.element.ElementManager;
import com.tbyf.service.gp.ysfl.YsflManager;
import com.tbyf.util.JSONHelper;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.URLDecoder;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping(value="/form")
public class FormDesignerController extends BaseController {
	@Resource(name="ysflService")
	private YsflManager ysflService;
	@Resource(name="elementService")
	private ElementManager elementService;
	
	@RequestMapping(value="/formDesigner")
	public ModelAndView formDesigner() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/formDesigner/formDesigner");
		return mv;
	}
	
	
	@RequestMapping(value="/getElements")
	public ModelAndView getElement() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		//查询元素属性
		PageData element=elementService.findById(pd);
		//判断元素类型，跳入对应的设置页面。
		String type = element.getString("LX");
		if(type=="0" || type.equals("0")){
			element.put("fieldname", element.getString("ZDM"));
			element.put("orgname", element.getString("ZDM"));
			mv.addObject("element", element);
			mv.setViewName("gp/formDesigner/text");
		}else if(type=="1" || type.equals("1")){
			element.put("fieldname", element.getString("ZDM"));
			element.put("orgname", element.getString("ZDM"));
			mv.addObject("element", element);
			mv.setViewName("gp/formDesigner/textarea");
		}else if(type=="2" || type.equals("2")){
			element.put("fieldname", element.getString("ZDM"));
			element.put("orgname", element.getString("ZDM"));
			mv.addObject("element", element);
			mv.setViewName("gp/formDesigner/select");
		}else if(type=="3" || type.equals("3")){
			JSONObject jsonObject = JSONObject.fromObject(element.getString("XZX"));
			HashMap<String, Object> dataMap =  JSONHelper.reflect(jsonObject);
			List keyList = new ArrayList<>();
			List valueList = new ArrayList<>();
			for(String key : dataMap.keySet()){
				keyList.add(key);
				valueList.add(dataMap.get(key));
			}
			element.put("fieldname", element.getString("ZDM"));
			element.put("orgname", element.getString("ZDM"));
			mv.addObject("element", element);
			mv.addObject("key",keyList);
			mv.addObject("value",valueList);
			mv.setViewName("gp/formDesigner/radio");
		}else if(type=="4" || type.equals("4")){
			JSONObject jsonObject = JSONObject.fromObject(element.getString("XZX"));
			HashMap<String, Object> dataMap =  JSONHelper.reflect(jsonObject);
			List keyList = new ArrayList<>();
			List valueList = new ArrayList<>();
			for(String key : dataMap.keySet()){
				keyList.add(key);
				valueList.add(dataMap.get(key));
			}
			element.put("fieldname", element.getString("ZDM"));
			element.put("orgname", element.getString("ZDM"));
			mv.addObject("element", element);
			mv.addObject("key",keyList);
			mv.addObject("value",valueList);
			mv.setViewName("gp/formDesigner/checkbox");
		}
		return mv;
	}
	/**
	 * 获取tree数据
	 * @return 
	 */
	@RequestMapping(value="/getTreeData")
	@ResponseBody
	public String getTreeData(HttpServletRequest request,HttpServletResponse response){
		logBefore(logger, Jurisdiction.getUsername()+"获取tree");
		String id = request.getParameter("id");
		String json="";
		try {
			List<Ysfl> ysflList =  ysflService.treeData1(id);
			if(null != ysflList && ysflList.size()>0){
				JSONArray array=JSONArray.fromObject(ysflList);
				json = array.toString().replaceAll("", "");
			}else{
				//如果该元素分类为子节点，查询元素表
				PageData pd= new PageData();
				pd.put("YSFLID", id);
				List<PageData> list = elementService.findByYSFLID(pd);
				List dataList = new ArrayList<>();
				for(PageData data:list){
					Map<String,Object> mapData = new HashMap<>();
					mapData.put("id", data.getString("ID"));
					mapData.put("pid","");
					mapData.put("name", data.getString("XSMC"));
					mapData.put("target", "treeFrame");
					mapData.put("isParent", false);
					mapData.put("type", getType(data.getString("LX")));
	//				mapData.put("url", "form/getElements.do?id="+data.getString("ID"));
					dataList.add(mapData);
				}
				JSONArray array=JSONArray.fromObject(dataList);
				json = array.toString();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	@RequestMapping(value="/toAddform")
	public ModelAndView toAddform() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("OPERATION_NAME",getCurUser().getName());		//获取当前录入人
		pd.put("EnumErmForm", EnumErmForm.toMap());	//模板类型
		pd.put("EnumTySex", EnumTySex.toMap());		//适用性别
		pd.put("EnumMust", EnumBloodPressure.toMap());  //是否必须
//		String parse_form = URLDecoder.decode(pd.getString("parse_form"),"utf8");
//		JSONObject jsonObject = JSONObject.fromObject(parse_form);
//		parse_form=jsonObject.getString("template").trim();
//		pd.put("YSNR", parse_form);
		mv.addObject("pd", pd);
		mv.setViewName("gp/formDesigner/form_add");
		return mv;
	}
	
	
	private String getType(String type){
		String str="";
		//0文本框、1多行文本、2下拉菜单、3单选框、4复选框
		if(type.equals("0")){
			str="text";
		}else if(type.equals("1")){
			str="textarea";
		}else if(type.equals("2")){
			str="select";
		}else if(type.equals("3")){
			str="radio";
		}else if(type.equals("4")){
			str="checkboxs";
		}
		return str;
	}
}
	
 
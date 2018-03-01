package com.tbyf.ehr.bridge.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.ehr.bridge.UserGenerLogicBridge;
import com.tbyf.ehr.dao.DaoSupport;
import com.tbyf.ehr.util.PageData;
import com.tbyf.ehr.xmlparser.InputXmlParser;
import com.tbyf.ehr.xmlparser.XmlStringBufferUtil;
import com.tbyf.ehr.xmlparser.UserGener.UserGenerBean;
import com.tbyf.ehr.xmlparser.UserGener.UserGenerXML;

@Service("userGenerLogicBridge")
public class UserGenerLogicBridgeImpl implements UserGenerLogicBridge{
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 通过身份证获取健康档案用户信息
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String GetPatientInfo(String inputxml) {
		PageData pd = new PageData();
		PageData data = null;
		try {
			Map argsMap = InputXmlParser.argsToMap(inputxml, "/request/inputvalues");
			String idcode=String.valueOf(argsMap.get("idcode"));
			if(null==idcode||"".equals(idcode)){
				return  XmlStringBufferUtil.sendMessgeInfo("-1","idcode身份证不能为空");
			}
			pd.put("idcode", idcode);
			data = (PageData) dao.findForObject("UserGenerMapper.findById",pd);
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1","执行异常");
		}
		String  outxml =UserGenerXML.getUserGenerinfo(data);
		
		return outxml;
	}

	/**
	 * 健康档案检查用户是否存在
	 * 
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String CheckPatientArchives(String inputxml) {
		PageData pd = new PageData();
		PageData data=null;
		try {
			Map argsMap = InputXmlParser.argsToMap(inputxml, "/request/inputvalues");
			String idcode=String.valueOf(argsMap.get("idcode"));
			pd.put("idcode", idcode);
			if(null==idcode||"".equals(idcode)){
				return  XmlStringBufferUtil.sendMessgeInfo("-1","idcode身份证不能为空");
			}
		    data = (PageData) dao.findForObject("UserGenerMapper.findCountById",pd);
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1","执行异常");
		}
		String  outxml =UserGenerXML.getCheckPatient(data);
		return outxml;
	}

	/**
	 * 
	 * 建档
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String PatientArchives(String inputxml) {
		try {
			Map argsMap = InputXmlParser.argsToMap(inputxml, "/request/inputvalues/data/data_row");
			PageData pd =UserGenerBean.getPaObj(argsMap);
			PageData data = (PageData) dao.findForObject("UserGenerMapper.findCountById",pd);
			int count =Integer.parseInt(String.valueOf(data.get("SUM")));
	        if(count>=1){
	    	    return  XmlStringBufferUtil.sendMessgeInfo("-1","存在改用户不用插入");
	        }
	        dao.save("UserGenerMapper.savejd",pd);
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1","执行异常");
		}
		
		 return  XmlStringBufferUtil.sendMessgeInfo("1","新增成功");
		
	}

	/**
	 * 
	 * 验证是否建专档
	 * 
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String CheckSpecialFile(String inputxml) {
		PageData pd = new PageData();
		PageData data =null;
		String xmltype="";
		try {
			Map argsMap = InputXmlParser.argsToMap(inputxml, "/request/inputvalues");
			String idcode=String.valueOf(argsMap.get("idcode"));
			String  zttype =String.valueOf(argsMap.get("zttype"));
			if(!"1".equals(zttype)&&!"2".equals(zttype)&&!"3".equals(zttype)){
				return  XmlStringBufferUtil.sendMessgeInfo("-1","专档类型不存在");
			}
			if(null==idcode||"".equals(idcode)){
				return  XmlStringBufferUtil.sendMessgeInfo("-1","idcode身份证不能为空");
			}
			xmltype=getxmltype(zttype);
			pd.put("idcode", idcode);
			 data = (PageData) dao.findForObject(xmltype,pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String  outxml =UserGenerXML.getCheckSpecialFile(data);
		return outxml;
	
	}

	

	
	
	/**
	 * 建专档案
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String BuildSpecialFile(String inputxml) {
		String ztname="";
		String  xmladdtype="";
		String  xmlfindtype="";
		try {
			Map argsMap = InputXmlParser.argsToMap(inputxml, "/request/inputvalues/data/data_row");
			String  zttype =String.valueOf(argsMap.get("zttype"));
			if("1".equals(zttype)){
				xmlfindtype="UserGenerMapper.findCountHypertensionById";
				xmladdtype="UserGenerMapper.zdSfjlHypertensionsave";
				ztname="高血压";
				
			}
			else if("2".equals(zttype)){
				xmlfindtype="UserGenerMapper.findCountDiabetesById";
				xmladdtype="UserGenerMapper.zdSfjlDiabetessave";
				ztname="糖尿病";
			}
			else if("3".equals(zttype)){
				xmlfindtype="UserGenerMapper.findCountMentalillnessById";
				xmladdtype="UserGenerMapper.zdsfjlmentalillnesssave";
				ztname="精神病";
			}
			else{
				return  XmlStringBufferUtil.sendMessgeInfo("-1","zttype:"+zttype+"专档类型不存在");
			}
			PageData pdda =new PageData();
			PageData pd =UserGenerBean.getBuildSpecialFile(argsMap,zttype,pdda);
			PageData data = (PageData) dao.findForObject(xmlfindtype,pd);
			int count =Integer.parseInt(String.valueOf(data.get("SUM")));
	        if(count>=1){
	    	    return  XmlStringBufferUtil.sendMessgeInfo("-1","该用户存在"+ztname+"专档");
	        }
	        PageData userData = (PageData) dao.findForObject("UserGenerMapper.findById",pd);
	        pd= UserGenerBean.getDatatoZdinfo(pd,userData,zttype);
	        dao.save(xmladdtype,pd);
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1",ztname+"执行异常");
		}
		
		 return  XmlStringBufferUtil.sendMessgeInfo("1","新增"+ztname+"专档成功");
		
	}

	/**
	 * 高血压随访记录添加
	 * 
	 */
	@Override
	public String AddSfjlHypertension(String parserinputxml) {
		try {
			//解析xml 
			PageData pd =UserGenerBean.getHypertensionObj(parserinputxml);
			//3步
			//1.判断是否建档
			PageData userGenerData = (PageData) dao.findForObject("UserGenerMapper.findCountById",pd);
			int userGenercount =Integer.parseInt(String.valueOf(userGenerData.get("SUM")));
			if(userGenercount<1){
			  dao.save("UserGenerMapper.savejd",pd);//建档
			}
			PageData hypertensionData = (PageData) dao.findForObject("UserGenerMapper.findCountHypertensionById",pd);
        	int  hypertensionCount =Integer.parseInt(String.valueOf(hypertensionData.get("SUM")));
        	
        	//1.插入专档时获取人员id2.插入随访的时候获取居住的编码 (在将档表里面) 3.falg默认值设置
   		    PageData userData = (PageData) dao.findForObject("UserGenerMapper.findById",pd);
   		         pd= UserGenerBean.getDatatoZdinfo(pd,userData,"1");
        	
        	if(hypertensionCount<1){ //建专档
        		 dao.save("UserGenerMapper.zdSfjlHypertensionsave",pd);
        	}
        	
        	//获取专档id
        	pd.put("zdtablename", "hdsb0402");//将高血压表面放入
        	PageData zdidData = (PageData)dao.findForObject("UserGenerMapper.findZdIdByIdCode",pd);
        	String  zdid=String.valueOf(zdidData.get("ZDID"));
        	pd.put("hdsb040201_001", zdid);
        	//新增高血压随访记录主表
        	dao.save("UserGenerMapper.saveSfjlHypertensionZb",pd);
        	//新增高血压随访记录从表
        	dao.save("UserGenerMapper.saveSfjlHypertensionCb",pd);
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1","执行异常");
		}
		 return  XmlStringBufferUtil.sendMessgeInfo("1","新增高血压随访记录成功");
	}

	//新增糖尿病随访
	@Override
	public String AddSfjlDiabetes(String parserinputxml) {
		try {
			PageData pd =UserGenerBean.getDiabetesObj(parserinputxml);
			//3步
			//1.判断是否建档
			PageData userGenerData = (PageData) dao.findForObject("UserGenerMapper.findCountById",pd);
			int userGenercount =Integer.parseInt(String.valueOf(userGenerData.get("SUM")));
			if(userGenercount<1){
			  dao.save("UserGenerMapper.savejd",pd);//建档
			}
			
			PageData hypertensionData = (PageData) dao.findForObject("UserGenerMapper.findCountDiabetesById",pd);
        	int  hypertensionCount =Integer.parseInt(String.valueOf(hypertensionData.get("SUM")));
        	//1.插入专档时获取人员id2.插入随访的时候获取居住的编码 (在将档表里面) 3.falg默认值设置
   		    PageData userData = (PageData) dao.findForObject("UserGenerMapper.findById",pd);
   		     pd= UserGenerBean.getDatatoZdinfo(pd,userData,"2");
        	if(hypertensionCount<1){ //建专档
        		 dao.save("UserGenerMapper.zdSfjlDiabetessave",pd);
        	}
        	//获取专档id
        	pd.put("zdtablename", "hdsb0405");//将高血压表面放入
        	PageData zdidData = (PageData)dao.findForObject("UserGenerMapper.findZdIdByIdCode",pd);
        	String  zdid=String.valueOf(zdidData.get("ZDID"));
        	pd.put("hdsb040501_001", zdid);
        	
        	//新增尿病随访记录主表
        	dao.save("UserGenerMapper.saveSfjlDiabetesZb",pd);
        	dao.save("UserGenerMapper.saveSfjlDiabetesCb",pd);
			
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1","执行异常");
		}
		
		 return  XmlStringBufferUtil.sendMessgeInfo("1","新增糖尿病随访记录成功");
	}

	//精神病随访
	@Override
	public String AddSfjlMentalillness(String parserinputxml) {
		try {
			PageData pd =UserGenerBean.getMentalillnessObj(parserinputxml);
			//3步
			//1.判断是否建档
			PageData userGenerData = (PageData) dao.findForObject("UserGenerMapper.findCountById",pd);
			int userGenercount =Integer.parseInt(String.valueOf(userGenerData.get("SUM")));
			if(userGenercount<1){
			  dao.save("UserGenerMapper.jdsave",pd);//建档
			}
			
			PageData hypertensionData = (PageData) dao.findForObject("UserGenerMapper.findCountMentalillnessById",pd);
        	int  hypertensionCount =Integer.parseInt(String.valueOf(hypertensionData.get("SUM")));
        	//1.插入专档时获取人员id2.插入随访的时候获取居住的编码 (在将档表里面) 3.falg默认值设置
   		    PageData userData = (PageData) dao.findForObject("UserGenerMapper.findById",pd);
   		     pd= UserGenerBean.getDatatoZdinfo(pd,userData,"3");
        	if(hypertensionCount<1){ //建专档
        		 dao.save("UserGenerMapper.zdSfjlMentalillnesssave",pd);
        	}

        	//获取专档id
        	pd.put("zdtablename", "hdsb0403");//将高血压表名放入
        	PageData zdidData = (PageData)dao.findForObject("UserGenerMapper.findZdIdByIdCode",pd);
        	String  zdid=String.valueOf(zdidData.get("ZDID"));
        	pd.put("hdsb040301_001", zdid);
        	//新增精神病随访记录主表
        	dao.save("UserGenerMapper.saveSfjlMentalillnessZb",pd);
        	dao.save("UserGenerMapper.saveSfjlMentalillnessCb",pd);
			
		} catch (Exception e) {
			e.printStackTrace();
			return XmlStringBufferUtil.sendMessgeInfo("-1","执行异常");
		}
		
		 return  XmlStringBufferUtil.sendMessgeInfo("1","新增精神病随访记录成功");
	}
	
	
	private  String   getxmltype(String zttype){
		 String xmltype="";
			if("1".equals(zttype)){
				 xmltype="UserGenerMapper.findCountHypertensionById";
			}
			else if("2".equals(zttype)){
				 xmltype="UserGenerMapper.findCountSfjlDiabetesById";
			}
			else if("3".equals(zttype)){
				 xmltype="UserGenerMapper.findCountSfjlMentalillnessById";
			}
		
		
		return  xmltype;
	 }

 /**
 * 
 * 随访记录查询
 */
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String GetSfjlBytype(String inputxml) {
		PageData pd = new PageData();
		String  QUERYTYPE="";
		List<PageData> list=null ;
		String xmltype="";
		try {
			Map argsMap = InputXmlParser.argsToMap(inputxml, "/request/inputvalues");
			String IDCODE=String.valueOf(argsMap.get("idcode"));
			String ORGCODE   =String.valueOf(argsMap.get("orgcode"));
			String FSYSID=String.valueOf(argsMap.get("fsysid"));
			  QUERYTYPE =String.valueOf(argsMap.get("querytype"));
			String GMTSTART   =String.valueOf(argsMap.get("gmtstart"));
			String GMTEND=String.valueOf(argsMap.get("gmtend"));
			String  XYCFSSJSTART =String.valueOf(argsMap.get("xycfssjstart"));
			String XYCFSSJEND   =String.valueOf(argsMap.get("xycfssjend"));
			String  SFFS =String.valueOf(argsMap.get("sffs"));
			String PAGESIZE   =String.valueOf(argsMap.get("pagesize"));
			String  PAGECOUNT =String.valueOf(argsMap.get("pagecount"));
			pd.put("IDCODE", IDCODE);
			pd.put("ORGCODE", ORGCODE);
			pd.put("QUERYTYPE", QUERYTYPE);
			pd.put("GMTSTART", GMTSTART);
			pd.put("GMTEND", GMTEND);
			pd.put("FSYSID", FSYSID);
			pd.put("XYCFSSJSTART",XYCFSSJSTART);
			pd.put("XYCFSSJEND",XYCFSSJEND);
			pd.put("SFFS", SFFS);
			pd.put("PAGESIZE",PAGESIZE);
			pd.put("PAGECOUNT", PAGECOUNT);
			//如果不传分页参数，给默认值。
			int pageSize=1;//页码
			int pageCount=10;//页数
	       	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	       		pd.put("pageStart", pd.get("PAGESIZE"));
	       		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	       	}else{
	       		pd.put("pageStart", pageSize);
	       		pd.put("pageEnd", pageSize * pageCount);
	       	}
			
			if(!"1".equals(QUERYTYPE)&&!"2".equals(QUERYTYPE)&&!"3".equals(QUERYTYPE)){
				return  XmlStringBufferUtil.sendMessgeInfo("-1","查询类型不存在");
			}
			
			if("1".equals(QUERYTYPE)){//高血压
				xmltype="UserGenerMapper.queryHypertensionPage";
			}
			else  if("2".endsWith(QUERYTYPE)){//糖尿病
				
				xmltype="UserGenerMapper.queryDiabetesPage";
			}
			
			else{ //精神病
				xmltype="UserGenerMapper.queryMentalillnessPage";
			}
			if(null==IDCODE||"".equals(IDCODE)){
				return  XmlStringBufferUtil.sendMessgeInfo("-1","idcode身份证不能为空");
			}
	  	 list = (List<PageData>) dao.findForList(xmltype,pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==list ||list.size()<=0){
			return XmlStringBufferUtil.sendMessgeInfo("-1","查询返回为空");
		}
		String  outxml =UserGenerXML.GetSfjlBytypeXml(list,QUERYTYPE);
		return outxml;
	
	}

}

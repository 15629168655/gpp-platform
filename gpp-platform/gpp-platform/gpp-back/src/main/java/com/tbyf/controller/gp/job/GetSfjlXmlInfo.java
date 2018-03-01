package com.tbyf.controller.gp.job;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import com.tbyf.service.gp.sfjl.SfjlHypertensionManager;
import com.tbyf.util.PageData;
import com.tbyf.util.StringHelper;

//重全科医生库获取随访记录列表
public class GetSfjlXmlInfo {
	@Resource(name="sfjlHypertensionService")
	private SfjlHypertensionManager sfjlHypertensionService;
	

	//获取高血压随访记录
  @SuppressWarnings("unused")
public    String  getHypertensionInfoforString() throws UnsupportedEncodingException{
	    PageData pd = new PageData();
		 StringBuffer str  =new StringBuffer();
	       str.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
	       str.append("<request>");
	       str.append("<requestid>110</requestid>");
	       str.append("<inputvalues>");
	       str.append("<data>");
	     try {
	    	 pd.put("ZT", "9");
	    	 pd.put("sfcl", "1"); 
			List<PageData> list=sfjlHypertensionService.sfjlHypertensionAllInfo(pd);
			for (PageData pageData : list) {
			   str.append("<data_row>");
			   str.append("<patientinfo>");
			   str.append("<HDSA0001_001></HDSA0001_001>");
			   str.append("<HDSA0001_003></HDSA0001_003>");
			   str.append("<HDSA0001_004></HDSA0001_004>");
			   str.append("<HDSA0001_005></HDSA0001_005>");
			   str.append("<HDSA0001_006></HDSA0001_006>");
			   str.append("<HDSA0001_007></HDSA0001_007>");
			   str.append("<HDSA0001_008></HDSA0001_008>");
			   str.append("<HDSA0001_009></HDSA0001_009>");
			   str.append("<HDSA0001_010></HDSA0001_010>");
			   str.append("<HDSA0001_011></HDSA0001_011>");
			   str.append("<HDSA0001_012></HDSA0001_012>");
			   str.append("<HDSA0001_014></HDSA0001_014>");
			   str.append("<HDSA0001_015></HDSA0001_015>");
			   str.append("<HDSA0001_016></HDSA0001_016>");
			   str.append("<HDSA0001_017></HDSA0001_017>");
			   str.append("<HDSA0001_018></HDSA0001_018>");
			   str.append("<HDSA0001_019></HDSA0001_019>");
			   str.append("<HDSA0001_021></HDSA0001_021>");
			   str.append("<HDSA0001_022></HDSA0001_022>");
			   str.append("<HDSA0001_024></HDSA0001_024>");
			   str.append("<HDSA0001_025></HDSA0001_025>");
			   str.append("<HDSA0001_027></HDSA0001_027>");
			   str.append("<HDSA0001_028></HDSA0001_028>");
			   str.append("<HDSA0001_031></HDSA0001_031>");
			   str.append("<HDSA0001_033></HDSA0001_033>");
			   str.append("</patientinfo>");
			   str.append("</data_row>");
			}
			
			 str.append("</data>");
			 str.append("</inputvalues>");
		     str.append("</request>");
		   
		       
		      
			System.out.println("aaaaa");
		} catch (Exception e) {
			e.printStackTrace();
		}
	     
	   
	     
/*	     HDSA0001_001 姓名          USER_NAME（tb_user_agent表）
	     HDSA0001_003  身份证件号码  ID_NUMBER （tb_user_agent表）
	     HDSA0001_004   现住址名称    ADDRESS  （tb_user_agent表）
	     HDSA0001_005   现住址编码     AREA_ID   （tb_user_agent表）
	     HDSA0001_006   户籍地址名称   AREA    （tb_user_agent表）
	     HDSA0001_007   户籍地址编码  AREA_ID   （tb_user_agent表）
	     HDSA0001_008   性别代码      SEX   （tb_user_agent表）    性别（1:男；2:女, DEFAULT '2'）
	     HDSA0001_009   性别名称  
	     HDSA0001_010   出生日期     BIRTHDAY_TIME  （tb_user_agent表）
	     HDSA0001_011   建档单位名称    ORG_NAME （HM_PROVIDER表） 
	     HDSA0001_012   建档单位编码   ORG_CODE （HM_PROVIDER表）
	     HDSA0001_013   建档人编码     LRR_ID   （HM_PROVIDER表） 
	     HDSA0001_014   责任医生编码      HDSB040201_005 （HDSB040201表 随访医生代码）
	     HDSA0001_015   录入单位编码    ORG_CODE （HM_PROVIDER表） 
	     HDSA0001_016   录入人员编码    LRR_ID   （HM_PROVIDER表） 
	     HDSA0001_017   所属机构名称    ORG_NAME （HM_PROVIDER表）
	     HDSA0001_018   所属机构编码    ORG_CODE （HM_PROVIDER表）  
	     HDSA0001_019   建档日期   （接口自动生成日期）
	     HDSA0001_021   录入日期   （接口自动生成日期）
	     HDSA0001_022   与户主关系,CV0218.01家庭和社会关系代码
	     HDSA0001_024   1 正常  2 失访  3 迁出  4 作废   9 归档
	     HDSA0001_025   修改时间    （接口自动生成日期）
	     HDSA0001_027   建档人名称    LRR  （HM_PROVIDER表）
	     HDSA0001_028   责任医生名称   HDSB040201_006（HDSB040201表 随访医生名称）
	     HDSA0001_031   录入人员姓名   LRR  （HM_PROVIDER表） 
	     HDSA0001_033   详细地址      ADDRESS   （tb_user_agent表）*/
	       String  inputxml=str.toString();
	       String inputxmlbase64 = StringHelper.getBASE64(inputxml.getBytes("utf-8"));
	  return inputxmlbase64;
	}
  
  //获取糖尿病随访记录列表
  public  String  getDiabetesInfoforString() throws UnsupportedEncodingException{
	   	 StringBuffer str  =new StringBuffer();
	       str.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
	       str.append("<request>");
	       str.append("<requestid>110</requestid> ");
	       str.append("<inputvalues>");
	       str.append("<idcode>421125197901253325</idcode>");
	       str.append("</inputvalues>");
	       str.append("</request>");
	       String  inputxml=str.toString();
	       String inputxmlbase64 = StringHelper.getBASE64(inputxml.getBytes("utf-8"));
	  return inputxmlbase64;
	}
  
  //获取精神病随访记录列表
  public  String  getMentalillInfoforString() throws UnsupportedEncodingException{
	   	 StringBuffer str  =new StringBuffer();
	       str.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
	       str.append("<request>");
	       str.append("<requestid>110</requestid> ");
	       str.append("<inputvalues>");
	       str.append("<idcode>421125197901253325</idcode>");
	       str.append("</inputvalues>");
	       str.append("</request>");
	       String  inputxml=str.toString();
	       String inputxmlbase64 = StringHelper.getBASE64(inputxml.getBytes("utf-8"));
	  return inputxmlbase64;
	}

}

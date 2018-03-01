package com.tbyf.ehr.service.impl;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.jws.WebService;
import com.tbyf.ehr.bridge.UserGenerLogicBridge;
import com.tbyf.ehr.service.UserGeneralRemote;
import com.tbyf.ehr.util.ClientIPCXF;
import com.tbyf.ehr.util.StringHelper;

@WebService(endpointInterface="com.tbyf.ehr.service.UserGeneralRemote")
public class UserGenerLogic extends ClientIPCXF  implements UserGeneralRemote {

	@Resource(name="userGenerLogicBridge")
	private UserGenerLogicBridge  userGenerLogicBridgeImpl;
	/***
	 * 
	 * 通过身份证查询患者信息
	 * 
	 */
	@Override
	public String GetPatientInfo(String inputxml) {
		//long sessionId = System.currentTimeMillis();
		//String ip =getClientIpCxf();便于以后做ip限制
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml=userGenerLogicBridgeImpl.GetPatientInfo(parserinputxml);
				// 将对象解析成xml格式字符串,进行加密
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return xmlmessage;
	}

	/**
	 * 通过省身份证判断用户在健康档案是否存在
	 * 
	 */
	@Override
	public String CheckPatientArchives(String inputxml) {
		
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml =userGenerLogicBridgeImpl.CheckPatientArchives(parserinputxml);
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return xmlmessage;
	}

	/**
	 * 
	 * 健康建档
	 * 
	 */
	@Override
	public String PatientArchives(String inputxml) {
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml =userGenerLogicBridgeImpl.PatientArchives(parserinputxml);
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		

		return xmlmessage;
	}

	/***
	 * 通过身份证判断是否用户建有专档
	 * 
	 */
	@Override
	public String CheckSpecialFile(String inputxml) {
		String  parserinputxml=null;
		String  xmlmessage=null;
		
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml =userGenerLogicBridgeImpl.CheckSpecialFile(parserinputxml);
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return xmlmessage;
	}

	/**
	 * 建立专档
	 * 
	 */
	@Override
	public String BuildSpecialFile(String inputxml) {
		String parserinputxml =null;
		String  xmlmessage=null;
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml =userGenerLogicBridgeImpl.BuildSpecialFile(parserinputxml);
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		return xmlmessage ;
		
	}

	/**
	 * 高血压随访记录添加
	 * 
	 */
	@Override
	public String AddSfjlHypertension(String inputxml) {
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml=userGenerLogicBridgeImpl.AddSfjlHypertension(parserinputxml);
				// 将对象解析成xml格式字符串,进行加密
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return xmlmessage;
	}

	/**
	 *糖尿病随访记录添加
	 * 
	 */
	@Override
	public String AddSfjlDiabetes(String inputxml) {
		
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml=userGenerLogicBridgeImpl.AddSfjlDiabetes(parserinputxml);
				// 将对象解析成xml格式字符串,进行加密
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return xmlmessage;
	}

	/**
	 * 精神病随访记录添加
	 * 
	 */
	@Override
	public String AddSfjlMentalillness(String inputxml) {
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml=userGenerLogicBridgeImpl.AddSfjlMentalillness(parserinputxml);
				// 将对象解析成xml格式字符串,进行加密
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return xmlmessage;
	}

	/**
	 * 通过类型  身份号，区域id获取相应随访记录
	 */
	@Override
	public String GetSfjlBytype(String inputxml) {
		String parserinputxml =null;
		String xmlmessage="";
		try {
			 parserinputxml = new String(StringHelper.getFromBASE64(inputxml), "utf-8");
				String outxml=userGenerLogicBridgeImpl.GetSfjlBytype(parserinputxml);
				xmlmessage = StringHelper.getBASE64(outxml.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return xmlmessage;
	}
	
	
}

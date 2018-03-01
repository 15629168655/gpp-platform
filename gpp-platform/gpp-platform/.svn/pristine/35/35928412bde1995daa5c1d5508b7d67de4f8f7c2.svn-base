package com.tbyf.ehr.service;

import javax.jws.WebService;
/**
 * 
 * 健康档案用户基本信息
 * 
 * @author wangc
 *
 */
@WebService
public interface UserGeneralRemote {
	//取用户信息
	public String GetPatientInfo(String inputxml);
	//检验用户是否建档
	public String CheckPatientArchives(String inputxml);
	//建档
	public  String PatientArchives(String inputxml);
	//检验用户是否建档
	public String CheckSpecialFile(String inputxml);
	//建专档案
	public String BuildSpecialFile(String inputxml);
	//高血压随访记录添加
	public String  AddSfjlHypertension(String inputxml);
	//糖尿病随访记录添加
	public String  AddSfjlDiabetes(String inputxml);
	//精神病随访记录添加
	public String  AddSfjlMentalillness(String inputxml);
	//高血压随访记录
	public String  GetSfjlBytype(String inputxml);

	
	
}

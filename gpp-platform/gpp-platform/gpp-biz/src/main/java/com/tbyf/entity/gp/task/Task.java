package com.tbyf.entity.gp.task;

import java.sql.Date;

/**
 * 
* 类名称：任务列表
* 类描述： 全科医生任务列表
* 作者单位： 聂方
* 联系方式：
* 创建时间：2016年9月4日
* @version
 */

public class Task {
	private String ID;		    //主键
	private String JOB_NAME;	//任务名称
	private String JOB_CONTENT; //任务内容
	private String JOB_TYPE;	//任务类型
	private String JOB_SOURCE;	//任务来源
	private Date GMT_JOB;		//任务时间
	private Date GMT_REMIND;	//提醒时间
	private Date GMT_CREATED;	//生成时间
	private String MEMBER_ID;	//服务对象ID
	private String MEMBER_NAME;	//服务对象姓名
	private String STATUS;		//任务状态
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getJOB_NAME() {
		return JOB_NAME;
	}
	public void setJOB_NAME(String jOB_NAME) {
		JOB_NAME = jOB_NAME;
	}
	public String getJOB_CONTENT() {
		return JOB_CONTENT;
	}
	public void setJOB_CONTENT(String jOB_CONTENT) {
		JOB_CONTENT = jOB_CONTENT;
	}
	public String getJOB_TYPE() {
		return JOB_TYPE;
	}
	public void setJOB_TYPE(String jOB_TYPE) {
		JOB_TYPE = jOB_TYPE;
	}
	public String getJOB_SOURCE() {
		return JOB_SOURCE;
	}
	public void setJOB_SOURCE(String jOB_SOURCE) {
		JOB_SOURCE = jOB_SOURCE;
	}
	public Date getGMT_JOB() {
		return GMT_JOB;
	}
	public void setGMT_JOB(Date gMT_JOB) {
		GMT_JOB = gMT_JOB;
	}
	public Date getGMT_REMIND() {
		return GMT_REMIND;
	}
	public void setGMT_REMIND(Date gMT_REMIND) {
		GMT_REMIND = gMT_REMIND;
	}
	public Date getGMT_CREATED() {
		return GMT_CREATED;
	}
	public void setGMT_CREATED(Date gMT_CREATED) {
		GMT_CREATED = gMT_CREATED;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
	

}

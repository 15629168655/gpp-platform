package com.tbyf.entity.information;

import java.util.Date;

public class Version {
	//id
	private String ID;
	//类型
	private String TYPE;
	//下载地址
	private String DOWNLOAD_URL;
	//版本号
	private String VERSIONCODE;
	//上架时间
	private Date GROUND_TIME;
	//文案说明
	private String OFFICIALCONTENT;
	//备份说明
	private String MEMO;
	//是否强制更新
	private String ISFORCE;
	//创建人
	private String CREATEMAN;
	//创建时间
	private Date CREATE_TIME;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getDOWNLOAD_URL() {
		return DOWNLOAD_URL;
	}
	public void setDOWNLOAD_URL(String dOWNLOAD_URL) {
		DOWNLOAD_URL = dOWNLOAD_URL;
	}
	public String getVERSIONCODE() {
		return VERSIONCODE;
	}
	public void setVERSIONCODE(String vERSIONCODE) {
		VERSIONCODE = vERSIONCODE;
	}
	public Date getGROUND_TIME() {
		return GROUND_TIME;
	}
	public void setGROUND_TIME(Date gROUND_TIME) {
		GROUND_TIME = gROUND_TIME;
	}
	public String getOFFICIALCONTENT() {
		return OFFICIALCONTENT;
	}
	public void setOFFICIALCONTENT(String oFFICIALCONTENT) {
		OFFICIALCONTENT = oFFICIALCONTENT;
	}
	public String getMEMO() {
		return MEMO;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
	public String getISFORCE() {
		return ISFORCE;
	}
	public void setISFORCE(String iSFORCE) {
		ISFORCE = iSFORCE;
	}
	public String getCREATEMAN() {
		return CREATEMAN;
	}
	public void setCREATEMAN(String cREATEMAN) {
		CREATEMAN = cREATEMAN;
	}
	public Date getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(Date cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
}

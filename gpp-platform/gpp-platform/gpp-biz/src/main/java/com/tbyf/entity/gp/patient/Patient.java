package com.tbyf.entity.gp.patient;

import java.sql.Date;

public class Patient {
	private String	ID;		//	主键
	private String	KH;		//	卡号
	private String	KLX;		//	卡类型
	private String	YLJGDM;		//	医疗机构代码
	private String	JKKH;		//	健康卡号
	private String	FKDQ;		//	发卡地区：社保卡发卡地区的编号
	private String	ZJHM;		//	证件号码
	private String	ZJLX;		//	身份证件类别
	private String	XB;		//	性别
	private String	XM;		//	姓名
	private String	HZGSD;		//	患者归属地编码
	private String	HYZK;		//	婚姻状况
	private String	CSRQ;		//	出生日期
	private String	CSD;		//	出生地编码
	private String	MZ;		//	民族
	private String	GJ;		//	国籍
	private String	DHHM;		//	电话号码
	private String	SJHM;		//	手机号码
	private String	GZDWYB;		//	工作单位邮编
	private String	GZDWMC;		//	工作单位名称
	private String	GZDWDZ;		//	工作单位地址
	private String	JZDZ;		//	居住地址
	private String	HKDZ;		//	户口地址
	private String	HKDZYB;		//	户口地址邮编
	private String	LXRXM;		//	联系人姓名
	private String	LXRGX;		//	联系人与患者的关系
	private String	LXRDZ;		//	联系人地址
	private String	LXRYB;		//	联系人邮编
	private String	LXRDH;		//	联系人电话
	private Double	MJ;		//	密级
	private String	XGBZ;		//	修改标志 0：正常、1：撤销
	private Date	YWSCSJ;		//	数据生成时间
	private String	PERSONID;		//	院内患者唯一id号（医院内部档案号）
	private String	YLYL1;		//	预留一
	private String	YLYL2;		//	预留一
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getKH() {
		return KH;
	}
	public void setKH(String kH) {
		KH = kH;
	}
	public String getKLX() {
		return KLX;
	}
	public void setKLX(String kLX) {
		KLX = kLX;
	}
	public String getYLJGDM() {
		return YLJGDM;
	}
	public void setYLJGDM(String yLJGDM) {
		YLJGDM = yLJGDM;
	}
	public String getJKKH() {
		return JKKH;
	}
	public void setJKKH(String jKKH) {
		JKKH = jKKH;
	}
	public String getFKDQ() {
		return FKDQ;
	}
	public void setFKDQ(String fKDQ) {
		FKDQ = fKDQ;
	}
	public String getZJHM() {
		return ZJHM;
	}
	public void setZJHM(String zJHM) {
		ZJHM = zJHM;
	}
	public String getZJLX() {
		return ZJLX;
	}
	public void setZJLX(String zJLX) {
		ZJLX = zJLX;
	}
	public String getXB() {
		return XB;
	}
	public void setXB(String xB) {
		XB = xB;
	}
	public String getXM() {
		return XM;
	}
	public void setXM(String xM) {
		XM = xM;
	}
	public String getHZGSD() {
		return HZGSD;
	}
	public void setHZGSD(String hZGSD) {
		HZGSD = hZGSD;
	}
	public String getHYZK() {
		return HYZK;
	}
	public void setHYZK(String hYZK) {
		HYZK = hYZK;
	}
	public String getCSRQ() {
		return CSRQ;
	}
	public void setCSRQ(String cSRQ) {
		CSRQ = cSRQ;
	}
	public String getCSD() {
		return CSD;
	}
	public void setCSD(String cSD) {
		CSD = cSD;
	}
	public String getMZ() {
		return MZ;
	}
	public void setMZ(String mZ) {
		MZ = mZ;
	}
	public String getGJ() {
		return GJ;
	}
	public void setGJ(String gJ) {
		GJ = gJ;
	}
	public String getDHHM() {
		return DHHM;
	}
	public void setDHHM(String dHHM) {
		DHHM = dHHM;
	}
	public String getSJHM() {
		return SJHM;
	}
	public void setSJHM(String sJHM) {
		SJHM = sJHM;
	}
	public String getGZDWYB() {
		return GZDWYB;
	}
	public void setGZDWYB(String gZDWYB) {
		GZDWYB = gZDWYB;
	}
	public String getGZDWMC() {
		return GZDWMC;
	}
	public void setGZDWMC(String gZDWMC) {
		GZDWMC = gZDWMC;
	}
	public String getGZDWDZ() {
		return GZDWDZ;
	}
	public void setGZDWDZ(String gZDWDZ) {
		GZDWDZ = gZDWDZ;
	}
	public String getJZDZ() {
		return JZDZ;
	}
	public void setJZDZ(String jZDZ) {
		JZDZ = jZDZ;
	}
	public String getHKDZ() {
		return HKDZ;
	}
	public void setHKDZ(String hKDZ) {
		HKDZ = hKDZ;
	}
	public String getHKDZYB() {
		return HKDZYB;
	}
	public void setHKDZYB(String hKDZYB) {
		HKDZYB = hKDZYB;
	}
	public String getLXRXM() {
		return LXRXM;
	}
	public void setLXRXM(String lXRXM) {
		LXRXM = lXRXM;
	}
	public String getLXRGX() {
		return LXRGX;
	}
	public void setLXRGX(String lXRGX) {
		LXRGX = lXRGX;
	}
	public String getLXRDZ() {
		return LXRDZ;
	}
	public void setLXRDZ(String lXRDZ) {
		LXRDZ = lXRDZ;
	}
	public String getLXRYB() {
		return LXRYB;
	}
	public void setLXRYB(String lXRYB) {
		LXRYB = lXRYB;
	}
	public String getLXRDH() {
		return LXRDH;
	}
	public void setLXRDH(String lXRDH) {
		LXRDH = lXRDH;
	}
	public Double getMJ() {
		return MJ;
	}
	public void setMJ(Double mJ) {
		MJ = mJ;
	}
	public String getXGBZ() {
		return XGBZ;
	}
	public void setXGBZ(String xGBZ) {
		XGBZ = xGBZ;
	}
	public Date getYWSCSJ() {
		return YWSCSJ;
	}
	public void setYWSCSJ(Date yWSCSJ) {
		YWSCSJ = yWSCSJ;
	}
	public String getPERSONID() {
		return PERSONID;
	}
	public void setPERSONID(String pERSONID) {
		PERSONID = pERSONID;
	}
	public String getYLYL1() {
		return YLYL1;
	}
	public void setYLYL1(String yLYL1) {
		YLYL1 = yLYL1;
	}
	public String getYLYL2() {
		return YLYL2;
	}
	public void setYLYL2(String yLYL2) {
		YLYL2 = yLYL2;
	}
	
	


}

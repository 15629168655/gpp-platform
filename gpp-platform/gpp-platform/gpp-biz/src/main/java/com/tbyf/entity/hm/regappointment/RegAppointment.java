/**
 * 
 */
package com.tbyf.entity.hm.regappointment;

import java.sql.Date;

/**
 * @author LiuWenHao
 * 预约挂号信息实体
 */
public class RegAppointment {
	private String ADDRESS;  //患者家庭住址
	private Date APPTIME;  //预约时间
	private Date BIRTHDAY;  //患者出生日期
	private String CARDNO;  //身份证号
	private String DEPTID;  //科室代码
	private String DEPTNAME;  //科室名称
	private String DOCTORID;  //医生编号
	private String DOCTORNAME;  //医生姓名
	private String GUID;  //主键
	private String NAME;  //患者姓名
	private String ORGID;  //医疗机构代码
	private String ORGNAME;  //医疗机构名称
	private String PHONE;  //患者联系电话
	private String REGID;  //预约单号
	private String YLZD;  //预留字段
}

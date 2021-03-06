package com.tbyf.util;

/** 
 * 说明：
 * 修改时间：2016年12月08日
 * @version
 */
public class Constants {
	public static String ADMIN_USER_ID = "1";//系统默认管理员ID
	public static String ADMIN_NAME = "系统管理员";//系统默认管理员名称
	public static String DICT_CARDTYPE = "004";//字典表-证件类型编码
	public static String DICT_INSURETYPE = "005";//字典表-参保类型编码
	public static String DICT_DEPARTMENTS = "007";//字典表-科室编码
	public static String DICT_DISEASES_CLASSIFICATION = "008";//字典表-疾病分类编码
	public static String DICT_SCREENING_TYPE = "014";//字典表-筛选类型编码
	public static String DICT_CHROIN_DISEASE_TYPE = "015";//字典表-慢病类型
	public static String DICT_NATIONALITY = "009";//字典表-国籍编码
	public static String DICT_NATION = "010";//字典表-民族编码
	public static int uuidLength = 32;	//uuid的长度
	public static String PICTURE_VISIT_FILE_PATH = "";//图片访问的路径
	public static String PICTURE_SAVE_FILE_PATH = "";//图片存放的路径
	public static String getPICTURE_VISIT_FILE_PATH() {
		return PICTURE_VISIT_FILE_PATH;
	}

	public static void setPICTURE_VISIT_FILE_PATH(String pICTURE_VISIT_FILE_PATH) {
		PICTURE_VISIT_FILE_PATH = pICTURE_VISIT_FILE_PATH;
	}

	public static String getPICTURE_SAVE_FILE_PATH() {
		return PICTURE_SAVE_FILE_PATH;
	}

	public static void setPICTURE_SAVE_FILE_PATH(String pICTURE_SAVE_FILE_PATH) {
		PICTURE_SAVE_FILE_PATH = pICTURE_SAVE_FILE_PATH;
	}

	public static void main(String[] args) {
		Constants.setPICTURE_SAVE_FILE_PATH("D:/Tomcat 6.0/webapps/FH/topic/");
		Constants.setPICTURE_VISIT_FILE_PATH("http://192.168.1.225:8888/FH/topic/");
	}
	
}

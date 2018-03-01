package com.tbyf.controller.app.HttpTest;

import com.tbyf.util.DateUtil;
import com.tbyf.util.MD5;

/**
 * 
 *糖尿病随访测试
 * @author wangc
 *
 */
public class AppSfjlDiabetesTest {
	
	public static void main(String[] args) {

	appSave(); //保存
	//appEdit();//修改  
	}

	

	public static void appSave() {
		String FKEY = MD5.md5("KEYWORDS" + DateUtil.getDays() + ",tbyf,");
		StringBuffer str = new StringBuffer();
		str.append("HDSB040501_003=2017-03-28");
		str.append("&HDSB040501_004=2017-04-17"); 
		str.append("&SFCL="+ 1);
		str.append("&ZT="+0);
		str.append("&HDSB04050101_003=1"); //随访方式  0门诊1家庭2 电话
		str.append("&HDSB04050101_006=80"); //收缩压
		str.append("&HDSB04050101_007=90");  //舒张压
		str.append("&HDSB04050101_008=50");  //体重
		str.append("&HDSB04050101_010=175");//身高
		str.append("&HDSB04050101_032=30");//空腹血糖值
		str.append("&USER_NAME=德华");//居民姓名
		str.append("&HDSB04050101_033=30");//
		str.append("&HDSB04050101_034=30");//
		str.append("&HDSB04050101_046=30");//
		str.append("&HDSB04050101_047=30");//
		str.append("&LRR=" + "admin");
		str.append("&LRR_ID=" + "123456");
		str.append("&FSYS_CODE=9000000000");
		str.append("&ID_NUMBER=420107199111111111");
		str.append("&FSYS=未知人员");
		str.append("&ORG_CODE=B_01_42010004003");
		str.append("&FKEY=" + FKEY);
		// 发送 POST 请求
		String sr = HttpUtil.sendPost("http://127.0.0.1:8081/gpp-back/appsfjldiabetes/appSave.do",str.toString());
		System.out.println(sr);

	}
	
	
	private static void appEdit() {
		String FKEY = MD5.md5("KEYWORDS" + DateUtil.getDays() + ",tbyf,");
		StringBuffer str = new StringBuffer();
		str.append("HDSB040501_003=2017-03-28");
		str.append("&HDSB040501_004=2017-04-17"); 
		str.append("&SFCL="+ 1);
		str.append("&ZT="+0);
		str.append("&HDSB04050101_003=1"); //随访方式  0门诊1家庭2 电话
		str.append("&HDSB04050101_006=80"); //收缩压
		str.append("&HDSB04050101_007=90");  //舒张压
		str.append("&HDSB04050101_008=50");  //体重
		str.append("&HDSB04050101_010=175");//身高
		str.append("&HDSB04050101_032=30");//空腹血糖值
		str.append("&USER_NAME=德华");//居民姓名
		str.append("&HDSB04050101_033=30");//
		str.append("&HDSB04050101_034=30");//
		str.append("&HDSB04050101_046=30");//
		str.append("&HDSB04050101_047=30");//
		str.append("&LRR=" + "admin");
		str.append("&LRR_ID=" + "123456");
		str.append("&FSYS_CODE=9000000000");
		str.append("&ID_NUMBER=420107199111111111");
		str.append("&FSYS=张医生");
		str.append("&ORG_CODE=B_01_42010004003");
		str.append("&FKEY=" + FKEY);
		str.append("&GUID=" + "DCDF90E2-7C0B-7FF5-F81D-0CEA0E88A1AF");
		
		// 发送 POST 请求
		String sr = HttpUtil.sendPost("http://127.0.0.1:8081/gpp-back/appsfjldiabetes/appEdit.do",str.toString());
		System.out.println(sr);
		
	}

}

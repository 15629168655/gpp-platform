package com.tbyf.controller.app.HttpTest;

import com.tbyf.util.DateUtil;
import com.tbyf.util.MD5;

/**
 * 
 * 高血压随访测试
 * @author wangc
 *
 */
public class AppsfjlhypertensionTest {

	public static void main(String[] args) {

		appSave(); //保存
		//appEdit();//修改
	}

	

	public static void appSave() {
	String FKEY = MD5.md5("KEYWORDS" + DateUtil.getDays() + ",tbyf,");
		StringBuffer str = new StringBuffer();
		str.append("ORG_CODE=B_01_42010004003");
		str.append("&FKEY=" + FKEY);
		str.append("&HDSB040201_003=2017-06-27");
		str.append("&HDSB040201_004=2017-06-27");
		str.append("&=2017-04-17");
		str.append("&FSYS_CODE=9000000000");
		str.append("&ORG_CODE=B_01_42010004003");
		str.append("&FSYS=aaa");
		str.append("&SFCL="+ 1);
		str.append("&ZT="+0);
		str.append("&ID_NUMBER=420107199111111111");
		str.append("&USER_NAME=" + "aaaa");
		str.append("&HDSB04020101_004=" + 1);
		str.append("&HDSB04020101_005=" + 60);
		str.append("&HDSB04020101_006=" + 70);
		str.append("&HDSB04020101_008=" + 175);
		str.append("&HDSB04020101_011=" + 110);
		str.append("&HDSB04020101_032=" + "青霉素过敏");
		str.append("&HDSB04020101_033=" + 60);
		str.append("&LRR=" + "admin");
		str.append("&LRR_ID=" + "123456");
		
	
		/*String json="{\'FKEY\':\'c4aae903f86fabbe73edace444c1448c\',\'FSYS\':\'孙浩\',\'FSYS_CODE\':\'22546a545b3541c0be47855e52df7288\',\'ORG_CODE\':\'A_01_420102001000\',\'USER_NAME\':\'李辅政\',\'ID_NUMBER\':\'362425199702190018\',\'HDSB040201_003\':\'2017-06-07\',\'HDSB040201_004\':\'2017-06-08\',\'HDSB04020101_004\':\'0\',\'HDSB04020101_005\':\'55\',\'HDSB04020101_033\':\'655\',\'HDSB04020101_006\':\'55\',\'SFCL\':\'0\',\'LRR\':\'孙浩\',\'ZT\':\'0\',\'LRR_ID\':\'22546a545b3541c0be47855e52df7288\',\'HDSB04020101_011\':\'55\',\'HDSB04020101_008\':\'165\',\'HDSB04020101_032\':\'无\'}";
*/
		// 发送 POST 请求
		String sr = HttpUtil.sendPost("http://127.0.0.1:8081/gpp-back/appsfjlhypertension/appSave.do",str.toString());
		System.out.println(sr);

	}
	
	
	private static void appEdit() {
		String FKEY = MD5.md5("KEYWORDS" + DateUtil.getDays() + ",tbyf,");
		StringBuffer str = new StringBuffer();
		str.append("ORG_CODE=B_01_42010004003");
		str.append("&FKEY=" + FKEY);
		str.append("&HDSB040201_003=" + "2017-03-27");
		str.append("&HDSB040201_004=" + "2017-04-17");
		str.append("&FSYS_CODE=" + "9000000000");
		str.append("&ORG_CODE=" + "B_01_42010004003");
		str.append("&FSYS=" + "未知人员");
		str.append("&SFCL=" + 1);
		str.append("&ZT=" + 0);
		str.append("&ID_NUMBER=" + "420107199111111111");
		str.append("&USER_NAME=" + "aaaa");
		str.append("&HDSB04020101_004=" + 1);
		str.append("&HDSB04020101_005=" + 111);
		str.append("&HDSB04020101_006=" + 222);
		str.append("&HDSB04020101_008=" + 175);
		str.append("&HDSB04020101_011=" + 110);
		str.append("&HDSB04020101_032=" + "青霉素过敏");
		str.append("&HDSB04020101_033=" + 60);
		str.append("&LRR=" + "admin");
		str.append("&LRR_ID=" + "123456");
		str.append("&GUID=" + "0a8a9e17bfa448beae6f630214cc9baf");
		
		// 发送 POST 请求
		String sr = HttpUtil.sendPost("http://127.0.0.1:8081/gpp-back/appsfjlhypertension/appEdit.do",str.toString());
		System.out.println(sr);
		
	}


}

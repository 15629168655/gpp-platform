package com.tbyf.controller.app.HttpTest;

import com.tbyf.util.DateUtil;
import com.tbyf.util.MD5;
/**
 * 精神病随访测试
 * @author wangc
 *
 */

public class AppSfjlMentalIllnessTest {
	
	public static void main(String[] args) {

		//appSave(); //保存
		appEdit();//修改  
		}


		public static void appSave() {
			String FKEY = MD5.md5("KEYWORDS" + DateUtil.getDays() + ",tbyf,");
			StringBuffer str = new StringBuffer();
			str.append("HDSB040301_003=2017-03-28");//随访日期
			str.append("&HDSB040301_004=1"); //随访方式  0门诊1家庭2 电话
			str.append("&HDSB040301_005=2017-04-17"); //下次随访日期
			str.append("&SFCL="+ 1);
			str.append("&ZT="+0);
			str.append("&USER_NAME=德华");//居民姓名
			str.append("&HDSB04030101_004=30");//症状其他
			str.append("&HDSB04030101_030=30");//康复措施指导
			str.append("&LRR=" + "admin");
			str.append("&LRR_ID=" + "123456");
			str.append("&FSYS_CODE=9000000000");
			str.append("&ID_NUMBER=420107199111111111");
			str.append("&FSYS=未知人员");
			str.append("&ORG_CODE=B_01_42010004003");
			str.append("&FKEY=" + FKEY);
			// 发送 POST 请求
			String sr = HttpUtil.sendPost("http://127.0.0.1:8081/gpp-back/appsfjlmentalillness/appSave.do",str.toString());
			System.out.println(sr);

		}
		
		
		private static void appEdit() {
			String FKEY = MD5.md5("KEYWORDS" + DateUtil.getDays() + ",tbyf,");
			StringBuffer str = new StringBuffer();
			str.append("HDSB040301_003=2017-02-28");//随访日期
			str.append("&HDSB040301_004=1"); //随访方式  0门诊1家庭2 电话
			str.append("&HDSB040301_005=2017-03-17"); //下次随访日期
			str.append("&SFCL="+ 1);
			str.append("&ZT="+0);
			str.append("&USER_NAME=德华");//居民姓名
			str.append("&HDSB04030101_004=40");//症状其他
			str.append("&HDSB04030101_030=40");//康复措施指导
			str.append("&LRR=" + "admin");
			str.append("&LRR_ID=" + "123456");
			str.append("&FSYS_CODE=9000000000");
			str.append("&ID_NUMBER=420107199111111111");
			str.append("&FSYS=未知人员");
			str.append("&ORG_CODE=B_01_42010004003");
			str.append("&FKEY=" + FKEY);
			str.append("&GUID=" + "a9342d54048b4d4a850262053f4c2422");
			
			// 发送 POST 请求
			String sr = HttpUtil.sendPost("http://127.0.0.1:8081/gpp-back/appsfjlmentalillness/appEdit.do",str.toString());
			System.out.println(sr);
			
		}


}

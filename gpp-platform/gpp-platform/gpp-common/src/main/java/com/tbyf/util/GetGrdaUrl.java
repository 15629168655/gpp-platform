/**
 * @Project		whplatform
 * @File		GetGrdaUrl.java
 * @Package		com.platform.rec.util
 * @Version		V1.0
 * @Date		2016年7月14日 上午10:42:01
 * @Author		LiuWenHao
 * Copyright (c) All Rights Reserved, 2016.
 */

package com.tbyf.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.InputStreamRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;

/**
 * @Description TODO
 * @ClassName GetGrdaUrl
 * @Date 2016年7月14日 上午10:42:01
 * @Author LiuWenHao Copyright (c) All Rights Reserved, 2016.
 */

public class GetGrdaUrl {
	// 调用档案url
	private final static String URL = "http://59.174.242.35:10011/health/service/QueryService";
	// 调用密钥固定值
	private final static String APIKEY = "tbyfwspt2.0";

	public static String getGrdaUrl(String sfzh) throws Exception {

		/*
		 * Client c; try { c=new Client(new java.net.URL(URL)); Object[]
		 * o=c.invoke(MDNAME, new String[]{APIKEY,jgid,jkdah,sfzh,wsryid});
		 * 
		 * for(Object obj : o){ System.out.println(obj); } } catch
		 * (MalformedURLException e) { e.printStackTrace(); } catch (Exception
		 * e) { e.printStackTrace(); }
		 */

		String soapRequestData = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.ws.health.tbyf.com\" xmlns:bean=\"http://bean.ws.health.tbyf.com\">"
				+ " <soapenv:Header/>"
				+ "   <soapenv:Body>"
				+ "     <ser:getGrda_bysfzh>"
				+ "        <ser:in0>"
				+ "          <!--Optional:-->"
				+ "         <bean:apiKey>"+APIKEY+"</bean:apiKey>"
				+ "         <!--Optional:-->"
				+ "         <bean:jgid></bean:jgid>"
				+ "          <!--Optional:-->"
				+ "          <bean:jkdah></bean:jkdah>"
				+ "          <!--Optional:-->"
				+ "           <bean:sfzh>"+sfzh+"</bean:sfzh>"
				+ "           <!--Optional:-->"
				+ "          <bean:wsryid></bean:wsryid>"
				+ "       </ser:in0>"
				+ "    </ser:getGrda_bysfzh>"
				+ "  </soapenv:Body>"
				+ " </soapenv:Envelope>";
		System.out.println(soapRequestData);

		PostMethod postMethod = new PostMethod(URL);
		// 然后把Soap请求数据添加到PostMethod中
		byte[] b = soapRequestData.getBytes("utf-8");
		InputStream is = new ByteArrayInputStream(b, 0, b.length);
		RequestEntity re = new InputStreamRequestEntity(is, b.length,
				"application/soap+xml; charset=utf-8");
		postMethod.setRequestEntity(re);
		// 最后生成一个HttpClient对象，并发出postMethod请求
		HttpClient httpClient = new HttpClient();
		int statusCode = httpClient.executeMethod(postMethod);
		if (statusCode == 200) {
			System.out.println("调用成功！");
			String soapResponseData = postMethod.getResponseBodyAsString();
			System.out.println(soapResponseData);
			List<String> list=XMLParse.getXMLParamToList(soapResponseData);//此处解析出的值混合成了一条记录
			String url=null;
			if(list.size()>0){
				String a[] =list.get(0).split(":");
				/*			System.out.println(a[0]);
			System.out.println(a[1]);
			System.out.println(a[2]);
				 */	
				if(a.length==3)url="http:"+a[1]+":"+a[2];
			}
			return url;
		} else {
			System.out.println("调用失败！错误码：" + statusCode);
			return null;
		}
	}

	/*public static void main(String[] args) {
		GetGrdaUrl g = new GetGrdaUrl();
		try {
			System.out.println(g.getGrdaUrl("42010220130805494X"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
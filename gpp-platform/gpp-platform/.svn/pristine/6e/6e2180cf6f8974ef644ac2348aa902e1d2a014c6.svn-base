package com.tbyf.ehr.xmlparser.UserGener;

import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.Hash;

import com.tbyf.ehr.util.PageData;
import com.tbyf.ehr.xmlparser.XmlStringBufferUtil;

public class UserGenerXML {

	public static String  getUserGenerinfo(PageData data) {
		StringBuffer str = new StringBuffer();
	    str.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
	    str.append("<response>");
	    str.append("<returnresult>");
	    str.append("<returncode>1</returncode>");
	    str.append("<errormsg>查询成功</errormsg>");
	    str.append("</returnresult>");
	    str.append("<data>");
	    str.append("<data_row>");
	    str.append("<HDSA0001_001>"+data.get("HDSA0001_001")+"</HDSA0001_001>"); //姓名
	    str.append("<HDSA0001_002>"+data.get("HDSA0001_002")+"</HDSA0001_002>");
	    str.append("<HDSA0001_003>"+data.get("HDSA0001_003")+"</HDSA0001_003>");
	    str.append("<HDSA0001_004>"+data.get("HDSA0001_004")+"</HDSA0001_004>");
	    str.append("<HDSA0001_005>"+data.get("HDSA0001_005")+"</HDSA0001_005>");
	    str.append("<HDSA0001_006>"+data.get("HDSA0001_006")+"</HDSA0001_006>");
	    str.append("<HDSA0001_007>"+data.get("HDSA0001_007")+"</HDSA0001_007>");
	    str.append("<HDSA0001_008>"+data.get("HDSA0001_008")+"</HDSA0001_008>");
	    str.append("<HDSA0001_009>"+data.get("HDSA0001_009")+"</HDSA0001_009>");
	    str.append("<HDSA0001_010>"+data.get("HDSA0001_010")+"</HDSA0001_010>");
	    str.append("<HDSA0001_011>"+data.get("HDSA0001_011")+"</HDSA0001_011>");
	    str.append("<HDSA0001_001>"+data.get("HDSA0001_001")+"</HDSA0001_001>");
	    str.append("<HDSA0001_012>"+data.get("HDSA0001_012")+"</HDSA0001_012>");
	    str.append("<HDSA0001_013>"+data.get("HDSA0001_013")+"</HDSA0001_013>");
	    str.append("<HDSA0001_014>"+data.get("HDSA0001_014")+"</HDSA0001_014>");
	    str.append("<HDSA0001_015>"+data.get("HDSA0001_015")+"</HDSA0001_015>");
	    str.append("<HDSA0001_016>"+data.get("HDSA0001_016")+"</HDSA0001_016>");
	    str.append("<HDSA0001_017>"+data.get("HDSA0001_017")+"</HDSA0001_017>");
	    str.append("<HDSA0001_018>"+data.get("HDSA0001_018")+"</HDSA0001_018>");
	    str.append("<HDSA0001_019>"+data.get("HDSA0001_019")+"</HDSA0001_019>");
	    str.append("<HDSA0001_020>"+data.get("HDSA0001_020")+"</HDSA0001_020>");
	    str.append("<HDSA0001_021>"+data.get("HDSA0001_021")+"</HDSA0001_021>");
	    str.append("<HDSA0001_022>"+data.get("HDSA0001_022")+"</HDSA0001_022>");
	    str.append("<HDSA0001_024>"+data.get("HDSA0001_024")+"</HDSA0001_024>");
	    str.append("<HDSA0001_025>"+data.get("HDSA0001_025")+"</HDSA0001_025>");
	    str.append("<HDSA0001_026>"+data.get("HDSA0001_026")+"</HDSA0001_026>");
	    str.append("<HDSA0001_026>"+data.get("HDSA0001_026")+"</HDSA0001_026>");
	    str.append("<HDSA0001_027>"+data.get("HDSA0001_027")+"</HDSA0001_027>");
	    str.append("<HDSA0001_028>"+data.get("HDSA0001_028")+"</HDSA0001_028>");
	    str.append("<HDSA0001_029>"+data.get("HDSA0001_029")+"</HDSA0001_029>");
	    str.append("<HDSA0001_030>"+data.get("HDSA0001_030")+"</HDSA0001_030>");
	    str.append("<HDSA0001_031>"+data.get("HDSA0001_031")+"</HDSA0001_031>");
	    str.append("<HDSA0001_032>"+data.get("HDSA0001_032")+"</HDSA0001_032>");
	    str.append("<HDSA0001_033>"+data.get("HDSA0001_033")+"</HDSA0001_033>");
	    str.append("<HDSA0001_034>"+data.get("HDSA0001_034")+"</HDSA0001_034>");
	    str.append("<HDSA0001_035>"+data.get("HDSA0001_035")+"</HDSA0001_035>");
	    str.append("<HDSA0001_036>"+data.get("HDSA0001_036")+"</HDSA0001_036>");
	    str.append("<HDSA0001_037>"+data.get("HDSA0001_037")+"</HDSA0001_037>");
	    str.append("<HDSA0002_002>"+data.get("HDSA0002_002")+"</HDSA0002_002>");
	    str.append("<HDSA000101_047>"+data.get("HDSA000101_047")+"</HDSA000101_047>");
	    str.append("<HDSA0000_002>"+data.get("HDSA0000_002")+"</HDSA0000_002>");
	    str.append("<HDSA0000_003>"+data.get("HDSA0000_003")+"</HDSA0000_003>");
	    str.append("<HDSA0000_004>"+data.get("HDSA0000_004")+"</HDSA0000_004>");
	    str.append("<HDSA0000_005>"+data.get("HDSA0000_005")+"</HDSA0000_005>");
	    str.append("<HDSA0000_006>"+data.get("HDSA0000_006")+"</HDSA0000_006>");
	    str.append("<HDSA0000_007>"+data.get("HDSA0000_007")+"</HDSA0000_007>");
	    str.append("<HDSA0000_008>"+data.get("HDSA0000_008")+"</HDSA0000_008>");
	    str.append("<HDSA0000_009>"+data.get("HDSA0000_009")+"</HDSA0000_009>");
	    str.append("<HDSA0000_010>"+data.get("HDSA0000_010")+"</HDSA0000_010>");
	    str.append("<HDSA0000_011>"+data.get("HDSA0000_011")+"</HDSA0000_011>");
	    str.append("<HDSA0000_012>"+data.get("HDSA0000_012")+"</HDSA0000_012>");
	    str.append("<HDSA0000_013>"+data.get("HDSA0000_013")+"</HDSA0000_013>");
	    str.append("<HDSA0000_014>"+data.get("HDSA0000_014")+"</HDSA0000_014>");
	    str.append("<HDSA0000_015>"+data.get("HDSA0000_015")+"</HDSA0000_015>");
	    str.append("<HDSA0000_016>"+data.get("HDSA0000_016")+"</HDSA0000_016>");
	    str.append("<HDSA0000_017>"+data.get("HDSA0000_017")+"</HDSA0000_017>");
	    str.append("<HDSA0000_018>"+data.get("HDSA0000_018")+"</HDSA0000_018>");
	    str.append("<HDSA0000_019>"+data.get("HDSA0000_019")+"</HDSA0000_019>");
	    str.append("<HDSA0000_020>"+data.get("HDSA0000_020")+"</HDSA0000_020>");
	    str.append("<HDSA0000_021>"+data.get("HDSA0000_021")+"</HDSA0000_021>");
	    str.append("<HDSA0000_022>"+data.get("HDSA0000_022")+"</HDSA0000_022>");
	    str.append("<HDSA0000_023>"+data.get("HDSA0000_023")+"</HDSA0000_023>");
	    str.append("<HDSA0000_024>"+data.get("HDSA0000_024")+"</HDSA0000_024>");
	    str.append("<HDSA0000_025>"+data.get("HDSA0000_025")+"</HDSA0000_025>");
	    str.append("<HDSA0000_026>"+data.get("HDSA0000_026")+"</HDSA0000_026>");
	    str.append("<HDSA0000_027>"+data.get("HDSA0000_027")+"</HDSA0000_027>");
	    str.append("<HDSA0000_028>"+data.get("HDSA0000_028")+"</HDSA0000_028>");
	    str.append("<HDSA0000_029>"+data.get("HDSA0000_029")+"</HDSA0000_029>");
	    str.append("<HDSA0000_030>"+data.get("HDSA0000_030")+"</HDSA0000_030>");
	    str.append("<HDSA0000_031>"+data.get("HDSA0000_031")+"</HDSA0000_031>");
	    str.append("<HDSA0000_032>"+data.get("HDSA0000_032")+"</HDSA0000_032>");
	    str.append("<HDSA0000_033>"+data.get("HDSA0000_033")+"</HDSA0000_033>");
	    str.append("<HDSA0000_034>"+data.get("HDSA0000_034")+"</HDSA0000_034>");
	    str.append("<HDSA000101_008>"+data.get("HDSA000101_008")+"</HDSA000101_008>");
	    str.append("<HDSB0503_004>"+data.get("HDSB0503_004")+"</HDSB0503_004>");
	    str.append("</data_row>");
	    str.append("</data>");
	    str.append("</response>");
	    return  str.toString();
	    		
	}

	public static String getCheckPatient(PageData data) {
		int count =Integer.parseInt(String.valueOf(data.get("SUM")));
        if(count>=1){
    	    return  XmlStringBufferUtil.sendMessgeInfo("1","存在该用户");
        }
        return  XmlStringBufferUtil.sendMessgeInfo("-1","不存在该用户");
	}
	

	public static String getCheckSpecialFile(PageData data) {
		int count =Integer.parseInt(String.valueOf(data.get("SUM")));
        if(count>=1){
    	    return  XmlStringBufferUtil.sendMessgeInfo("1","该专档已存在");
        }
        return  XmlStringBufferUtil.sendMessgeInfo("-1","不存该专档");
	}

	//拼接随访记录
	@SuppressWarnings("rawtypes")
	public static String GetSfjlBytypeXml(List<PageData> list, String querytype) {
		StringBuffer str=new StringBuffer();
		   str.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		    str.append("<response>");
		    str.append("<returnresult>");
		    str.append("<returncode>1</returncode>");
		    str.append("<errormsg>查询成功</errormsg>");
		    str.append("</returnresult>");
		    str.append("<data>");
		    for(int  i=0;i<list.size();i++){
		    	Map map= (Map) list.get(i);
		    	if("1".equals(querytype)){//高血压
		    		str.append("<data_row>");
		    		str.append("<guid>"+String.valueOf(map.get("SFID"))+"</guid>");
		    		str.append("<HDSB040201_005>"+String.valueOf(map.get("HDSB040201_005"))+"</HDSB040201_005>");
		    		str.append("<HDSB040201_006>"+String.valueOf(map.get("HDSB040201_006"))+"</HDSB040201_006>");
		    		str.append("<HDSA0001_001>"+String.valueOf(map.get("HDSA0001_001"))+"</HDSA0001_001>");
		    		str.append("<HDSA0001_003>"+String.valueOf(map.get("HDSA0001_003"))+"</HDSA0001_003>");
		    		str.append("<HDSB040201_003>"+String.valueOf(map.get("HDSB040201_003"))+"</HDSB040201_003>");
		    		str.append("<HDSB040201_004>"+String.valueOf(map.get("HDSB040201_004"))+"</HDSB040201_004>");
		    		str.append("<HDSB04020101_004>"+String.valueOf(map.get("HDSB04020101_004"))+"</HDSB04020101_004>");
		    		str.append("<HDSB04020101_005>"+String.valueOf(map.get("HDSB04020101_005"))+"</HDSB04020101_005>");
		    		str.append("<HDSB04020101_033>"+String.valueOf(map.get("HDSB04020101_033"))+"</HDSB04020101_033>");
		    		str.append("<HDSB04020101_008>"+String.valueOf(map.get("HDSB04020101_008"))+"</HDSB04020101_008>");
		    		str.append("<HDSB04020101_006>"+String.valueOf(map.get("HDSB04020101_006"))+"</HDSB04020101_006>");
		    		str.append("<HDSB04020101_011>"+String.valueOf(map.get("HDSB04020101_011"))+"</HDSB04020101_011>");
		    		str.append("<HDSB04020101_032>"+String.valueOf(map.get("HDSB04020101_032"))+"</HDSB04020101_032>");
		    		str.append("<HDSB04020101_004>"+String.valueOf(map.get("HDSB04020101_004"))+"</HDSB04020101_004>");
		    		str.append("</data_row>");
				}
		    else if("2".equals(querytype)){//糖尿病
		    	str.append("<data_row>");
	    		str.append("<guid>"+String.valueOf(map.get("GUID"))+"</guid>");
	    		str.append("<HDSB040501_003>"+String.valueOf(map.get("HDSB040501_003"))+"</HDSB040501_003>");
	    		str.append("<HDSB040501_004>"+String.valueOf(map.get("HDSB040501_004"))+"</HDSB040501_004>");
	    		str.append("<HDSB040501_005>"+String.valueOf(map.get("HDSB040501_005"))+"</HDSB040501_005>");
	    		str.append("<HDSB040501_006>"+String.valueOf(map.get("HDSB040501_006"))+"</HDSB040501_006>");
	    		str.append("<HDSA0001_001>"+String.valueOf(map.get("HDSA0001_001"))+"</HDSA0001_001>");
	    		str.append("<HDSA0001_003>"+String.valueOf(map.get("HDSA0001_003"))+"</HDSA0001_003>");
	    		str.append("<HDSB04050101_003>"+String.valueOf(map.get("HDSB04050101_003"))+"</HDSB04050101_003>");
	    		str.append("<HDSB04050101_005>"+String.valueOf(map.get("HDSB04050101_005"))+"</HDSB04050101_005>");
	    		str.append("<HDSB04050101_006>"+String.valueOf(map.get("HDSB04050101_006"))+"</HDSB04050101_006>");
	    		str.append("<HDSB04050101_007>"+String.valueOf(map.get("HDSB04050101_007"))+"</HDSB04050101_007>");
	    		str.append("<HDSB04050101_008>"+String.valueOf(map.get("HDSB04050101_008"))+"</HDSB04050101_008>");
	    		str.append("<HDSB04050101_010>"+String.valueOf(map.get("HDSB04050101_010"))+"</HDSB04050101_010>");
	    		str.append("<HDSB04050101_032>"+String.valueOf(map.get("HDSB04050101_032"))+"</HDSB04050101_032>");
	    		str.append("<HDSB04050101_033>"+String.valueOf(map.get("HDSB04050101_032"))+"</HDSB04050101_033>");
	    		str.append("<HDSB04050101_034>"+String.valueOf(map.get("HDSB04050101_034"))+"</HDSB04050101_034>");
	    		str.append("<HDSB04050101_046>"+String.valueOf(map.get("HDSB04050101_046"))+"</HDSB04050101_046>");
	    		str.append("<HDSB04050101_047>"+String.valueOf(map.get("HDSB04050101_047"))+"</HDSB04050101_047>");
	    		str.append("<HDSB04050101_034>"+String.valueOf(map.get("HDSB04050101_034"))+"</HDSB04050101_034>");
	    		str.append("</data_row>");
				}
		    else {//精神病 3
		    	str.append("<data_row>");
	    		str.append("<guid>"+String.valueOf(map.get("SFID"))+"</guid>");
	    		str.append("<HDSB040301_003>"+String.valueOf(map.get("HDSB040301_003"))+"</HDSB040301_003>");
	    		str.append("<HDSB040301_004>"+String.valueOf(map.get("HDSB040301_004"))+"</HDSB040301_004>");
	    		str.append("<HDSB040301_005>"+String.valueOf(map.get("HDSB040301_005"))+"</HDSB040301_005>");
	    		str.append("<HDSB040301_006>"+String.valueOf(map.get("HDSB040301_006"))+"</HDSB040301_006>");
	    		str.append("<HDSA0001_001>"+String.valueOf(map.get("HDSA0001_001"))+"</HDSA0001_001>");
	    		str.append("<HDSA0001_003>"+String.valueOf(map.get("HDSA0001_003"))+"</HDSA0001_003>");
	    		str.append("<HDSB040301_007>"+String.valueOf(map.get("HDSB040301_007"))+"</HDSB040301_007>");
	    		str.append("<hdsb04030101_004>"+String.valueOf(map.get("hdsb04030101_004"))+"</hdsb04030101_004>");
	    		str.append("<hdsb04030101_030>"+String.valueOf(map.get("hdsb04030101_030"))+"</hdsb04030101_030>");
	    		str.append("</data_row>");
			}
		    }
		   str.append("</data>");
		    str.append("</response>");

		return str.toString();
	}
	


}

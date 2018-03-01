package com.tbyf.ehr.xmlparser.UserGener;
import java.util.Map;
import java.util.UUID;
import com.tbyf.ehr.util.PageData;
import com.tbyf.ehr.xmlparser.InputXmlParser;
public class UserGenerBean {

	@SuppressWarnings("rawtypes")
	public static PageData getPaObj(Map argsMap) {
		PageData pd = new PageData();
		String hdsa0001_001=String.valueOf(argsMap.get("hdsa0001_001"));
		//String hdsa0001_002=String.valueOf(argsMap.get("hdsa0001_002"));
		String idcode=String.valueOf(argsMap.get("idcode"));
		String hdsa0001_004=String.valueOf(argsMap.get("hdsa0001_004"));
		String hdsa0001_005=String.valueOf(argsMap.get("hdsa0001_005"));
		String hdsa0001_006=String.valueOf(argsMap.get("hdsa0001_006"));
		String hdsa0001_007=String.valueOf(argsMap.get("hdsa0001_007"));
		String hdsa0001_008=String.valueOf(argsMap.get("hdsa0001_008"));
		String hdsa0001_009=String.valueOf(argsMap.get("hdsa0001_009"));
		String hdsa0001_010=String.valueOf(argsMap.get("hdsa0001_010"));
		String hdsa0001_011=String.valueOf(argsMap.get("hdsa0001_011"));
		String hdsa0001_012=String.valueOf(argsMap.get("hdsa0001_012"));
		String hdsa0001_013=String.valueOf(argsMap.get("hdsa0001_013"));
		String hdsa0001_014=String.valueOf(argsMap.get("hdsa0001_014"));
		String hdsa0001_015=String.valueOf(argsMap.get("hdsa0001_015"));
		String hdsa0001_016=String.valueOf(argsMap.get("hdsa0001_016"));
		String hdsa0001_017=String.valueOf(argsMap.get("hdsa0001_017"));
		String hdsa0001_018=String.valueOf(argsMap.get("hdsa0001_018"));
		String hdsa0001_019=String.valueOf(argsMap.get("hdsa0001_019"));
		String hdsa0001_020=String.valueOf(argsMap.get("hdsa0001_020"));
		String hdsa0001_021=String.valueOf(argsMap.get("hdsa0001_021"));
		String hdsa0001_022=String.valueOf(argsMap.get("hdsa0001_022"));
		String hdsa0001_024=String.valueOf(argsMap.get("hdsa0001_024"));
		//String hdsa0001_025=String.valueOf(argsMap.get("hdsa0001_025"));
		//String hdsa0001_026=String.valueOf(argsMap.get("hdsa0001_026"));
		String hdsa0001_027=String.valueOf(argsMap.get("hdsa0001_027"));
		String hdsa0001_028=String.valueOf(argsMap.get("hdsa0001_028"));
		String hdsa0001_029=String.valueOf(argsMap.get("hdsa0001_029"));
		String hdsa0001_030=String.valueOf(argsMap.get("hdsa0001_030"));
		String hdsa0001_031=String.valueOf(argsMap.get("hdsa0001_031"));
		String hdsa0001_032=String.valueOf(argsMap.get("hdsa0001_032"));
		String hdsa0001_033=String.valueOf(argsMap.get("hdsa0001_033"));
		/*String hdsa0001_034=String.valueOf(argsMap.get("hdsa0001_034"));
		String hdsa0001_035=String.valueOf(argsMap.get("hdsa0001_035"));
		String hdsa0001_036=String.valueOf(argsMap.get("hdsa0001_036"));
		String hdsa0001_037=String.valueOf(argsMap.get("hdsa0001_037"));
		String hdsa0002_002=String.valueOf(argsMap.get("hdsa0002_002"));
		String hdsa000101_047=String.valueOf(argsMap.get("hdsa000101_047"));
		String hdsa0000_002=String.valueOf(argsMap.get("hdsa0000_002"));
		String hdsa0000_003=String.valueOf(argsMap.get("hdsa0000_003"));
		String hdsa0000_004=String.valueOf(argsMap.get("hdsa0000_004"));
		String hdsa0000_005=String.valueOf(argsMap.get("hdsa0000_005"));
		String hdsa0000_006=String.valueOf(argsMap.get("hdsa0000_006"));
		String hdsa0000_007=String.valueOf(argsMap.get("hdsa0000_007"));
		String hdsa0000_008=String.valueOf(argsMap.get("hdsa0000_008"));
		String hdsa0000_009=String.valueOf(argsMap.get("hdsa0000_009"));
		String hdsa0000_010=String.valueOf(argsMap.get("hdsa0000_010"));
		String hdsa0000_011=String.valueOf(argsMap.get("hdsa0000_011"));
		String hdsa0000_012=String.valueOf(argsMap.get("hdsa0000_012"));
		String hdsa0000_013=String.valueOf(argsMap.get("hdsa0000_013"));
		String hdsa0000_014=String.valueOf(argsMap.get("hdsa0000_014"));
		String hdsa0000_015=String.valueOf(argsMap.get("hdsa0000_015"));
		String hdsa0000_016=String.valueOf(argsMap.get("hdsa0000_016"));
		String hdsa0000_017=String.valueOf(argsMap.get("hdsa0000_017"));
		String hdsa0000_018=String.valueOf(argsMap.get("hdsa0000_018"));
		String hdsa0000_019=String.valueOf(argsMap.get("hdsa0000_019"));
		String hdsa0000_020=String.valueOf(argsMap.get("hdsa0000_020"));
		String hdsa0000_021=String.valueOf(argsMap.get("hdsa0000_021"));
		String hdsa0000_022=String.valueOf(argsMap.get("hdsa0000_022"));
		String hdsa0000_023=String.valueOf(argsMap.get("hdsa0000_023"));
		String hdsa0000_024=String.valueOf(argsMap.get("hdsa0000_024"));
		String hdsa0000_025=String.valueOf(argsMap.get("hdsa0000_025"));
		String hdsa0000_026=String.valueOf(argsMap.get("hdsa0000_026"));
		String hdsa0000_027=String.valueOf(argsMap.get("hdsa0000_027"));
		String hdsa0000_028=String.valueOf(argsMap.get("hdsa0000_028"));
		String hdsa0000_029=String.valueOf(argsMap.get("hdsa0000_029"));
		String hdsa0000_030=String.valueOf(argsMap.get("hdsa0000_030"));
		String hdsa0000_031=String.valueOf(argsMap.get("hdsa0000_031"));
		String hdsa0000_032=String.valueOf(argsMap.get("hdsa0000_032"));
		String hdsa0000_033=String.valueOf(argsMap.get("hdsa0000_033"));
		String hdsa0000_034=String.valueOf(argsMap.get("hdsa0000_034"));
		String hdsa000101_008=String.valueOf(argsMap.get("hdsa000101_008"));
		String hdsb0503_004=String.valueOf(argsMap.get("hdsb0503_004"));
		String hdsa0001_023=String.valueOf(argsMap.get("hdsa0001_023"));
	  */
		pd.put("guid",  UUID.randomUUID().toString());
		pd.put("hdsa0001_001", hdsa0001_001);
		//pd.put("hdsa0001_002", hdsa0001_002);
		pd.put("idcode", idcode);
		pd.put("hdsa0001_004", hdsa0001_004);
		pd.put("hdsa0001_005", hdsa0001_005);
		pd.put("hdsa0001_006", hdsa0001_006);
		pd.put("hdsa0001_007", hdsa0001_007);
		pd.put("hdsa0001_008", hdsa0001_008);
		pd.put("hdsa0001_009", hdsa0001_009);
		pd.put("hdsa0001_010", hdsa0001_010);
		pd.put("hdsa0001_011", hdsa0001_011);
		pd.put("hdsa0001_012", hdsa0001_012);
		pd.put("hdsa0001_013", hdsa0001_013);
		pd.put("hdsa0001_014", hdsa0001_014);
		pd.put("hdsa0001_015", hdsa0001_015);
		pd.put("hdsa0001_016", hdsa0001_016);
		pd.put("hdsa0001_017", hdsa0001_017);
		pd.put("hdsa0001_018", hdsa0001_018);
		pd.put("hdsa0001_019", hdsa0001_019);
		pd.put("hdsa0001_020", hdsa0001_020);
		pd.put("hdsa0001_021", hdsa0001_021);
		pd.put("hdsa0001_022", hdsa0001_022);
		pd.put("hdsa0001_024", hdsa0001_024);
		//pd.put("hdsa0001_025", hdsa0001_025);
		//pd.put("hdsa0001_026", hdsa0001_026);
		pd.put("hdsa0001_027", hdsa0001_027);
		pd.put("hdsa0001_028", hdsa0001_028);
		pd.put("hdsa0001_029", hdsa0001_029);
		pd.put("hdsa0001_030", hdsa0001_030);
		pd.put("hdsa0001_031", hdsa0001_031);
		pd.put("hdsa0001_032", hdsa0001_032);
    	pd.put("hdsa0001_033", hdsa0001_033);
	/* pd.put("hdsa0001_034", hdsa0001_034);
		pd.put("hdsa0001_035", hdsa0001_035);
		pd.put("hdsa0001_036", hdsa0001_036);
		pd.put("hdsa0001_037", hdsa0001_037);
		pd.put("hdsa0002_002", hdsa0002_002);
		pd.put("hdsa000101_047", hdsa000101_047);
		pd.put("hdsa0000_002", hdsa0000_002);
		pd.put("hdsa0000_003", hdsa0000_003);
		pd.put("hdsa0000_004", hdsa0000_004);
		pd.put("hdsa0000_005", hdsa0000_005);
		pd.put("hdsa0000_006", hdsa0000_006);
		pd.put("hdsa0000_007", hdsa0000_007);
		pd.put("hdsa0000_008", hdsa0000_008);
		pd.put("hdsa0000_009", hdsa0000_009);
		pd.put("hdsa0000_010", hdsa0000_010);
		pd.put("hdsa0000_011", hdsa0000_011);
		pd.put("hdsa0000_012", hdsa0000_012);
		pd.put("hdsa0000_013", hdsa0000_013);
		pd.put("hdsa0000_014", hdsa0000_014);
		pd.put("hdsa0000_015", hdsa0000_015);
		pd.put("hdsa0000_016", hdsa0000_016);
		pd.put("hdsa0000_017", hdsa0000_017);
		pd.put("hdsa0000_018", hdsa0000_018);
		pd.put("hdsa0000_019", hdsa0000_019);
		pd.put("hdsa0000_013", hdsa0000_013);
		pd.put("hdsa0000_014", hdsa0000_014);
		pd.put("hdsa0000_015", hdsa0000_015);
		pd.put("hdsa0000_016", hdsa0000_016);
		pd.put("hdsa0000_017", hdsa0000_017);
		pd.put("hdsa0000_018", hdsa0000_018);
		pd.put("hdsa0000_019", hdsa0000_019);
		pd.put("hdsa0000_020", hdsa0000_020);
		pd.put("hdsa0000_021", hdsa0000_021);
		pd.put("hdsa0000_022", hdsa0000_022);
		pd.put("hdsa0000_023", hdsa0000_023);
		pd.put("hdsa0000_024", hdsa0000_024);
		pd.put("hdsa0000_025", hdsa0000_025);
		pd.put("hdsa0000_026", hdsa0000_026);
		pd.put("hdsa0000_027", hdsa0000_027);
		pd.put("hdsa0000_028", hdsa0000_028);
		pd.put("hdsa0000_029", hdsa0000_029);
		pd.put("hdsa0000_030", hdsa0000_030);
		pd.put("hdsa0000_031", hdsa0000_031);
		pd.put("hdsa0000_032", hdsa0000_032);
		pd.put("hdsa0000_033", hdsa0000_033);
		pd.put("hdsa0000_034", hdsa0000_034);
		pd.put("hdsa000101_008", hdsa000101_008);
		pd.put("hdsb0503_004", hdsb0503_004);
		pd.put("hdsa0001_023", hdsa0001_023);*/
		return pd;
	}

	/**
	 * 高血压建档
	 * 
	 * @param argsMap
	 * @return
	 */
	
	@SuppressWarnings("rawtypes")
	public static PageData getBuildSpecialFile(Map argsMap,String zttype,PageData pd) {
		if("1".equals(zttype)){
		String hdsb0402_001=String.valueOf(argsMap.get("hdsb0402_001"));
		String hdsb0402_003=String.valueOf(argsMap.get("hdsb0402_003"));
		String hdsb0402_004=String.valueOf(argsMap.get("hdsb0402_004"));
		String hdsb0402_005=String.valueOf(argsMap.get("hdsb0402_005"));
		String hdsb0402_006=String.valueOf(argsMap.get("hdsb0402_006"));
		String hdsb0402_007=String.valueOf(argsMap.get("hdsb0402_007"));
		String hdsb0402_008=String.valueOf(argsMap.get("hdsb0402_008"));
		String hdsb0402_009=String.valueOf(argsMap.get("hdsb0402_009"));
		String hdsb0402_010=String.valueOf(argsMap.get("hdsb0402_010"));
		String hdsb0402_011=String.valueOf(argsMap.get("hdsb0402_011"));
		String hdsb0402_012=String.valueOf(argsMap.get("hdsb0402_012"));
		String hdsb0402_013=String.valueOf(argsMap.get("hdsb0402_013"));
		String flag=String.valueOf(argsMap.get("flag"));
		String hdsb0402_014=String.valueOf(argsMap.get("hdsb0402_014"));
		String hdsb0402_015=String.valueOf(argsMap.get("hdsb0402_015"));
		/*String hdsa0001_001=String.valueOf(argsMap.get("hdsa0001_001"));
		String hdsa0001_002=String.valueOf(argsMap.get("hdsa0001_002"));
		String hdsa0001_004=String.valueOf(argsMap.get("hdsa0001_004"));
		String hdsa0001_005=String.valueOf(argsMap.get("hdsa0001_005"));
		String hdsa0001_006=String.valueOf(argsMap.get("hdsa0001_006"));
		String hdsa0001_007=String.valueOf(argsMap.get("hdsa0001_007"));
		String hdsa0001_009=String.valueOf(argsMap.get("hdsa0001_009"));
		String hdsa0001_010=String.valueOf(argsMap.get("hdsa0001_010"));
		String hdsa0001_017=String.valueOf(argsMap.get("hdsa0001_017"));
		String hdsa0001_018=String.valueOf(argsMap.get("hdsa0001_018"));
		String hdsa0001_024=String.valueOf(argsMap.get("hdsa0001_024"));
		String hdsa0001_035=String.valueOf(argsMap.get("hdsa0001_035"));
		String hdsa0001_036=String.valueOf(argsMap.get("hdsa0001_036"));
		String hdsa0002_002=String.valueOf(argsMap.get("hdsa0002_002"));
		String hdsa0000_005=String.valueOf(argsMap.get("hdsa0000_005"));
		String hdsa0000_006=String.valueOf(argsMap.get("hdsa0000_006"));
		String hdsa0000_007=String.valueOf(argsMap.get("hdsa0000_007"));
		String hdsa0000_009=String.valueOf(argsMap.get("hdsa0000_009"));
		String hdsa0001_029=String.valueOf(argsMap.get("hdsa0001_029"));
		String hdsa0001_033=String.valueOf(argsMap.get("hdsa0001_033"));
		String hdsb0402_016=String.valueOf(argsMap.get("hdsb0402_016"));
		String hdsa0000_035=String.valueOf(argsMap.get("hdsa0000_035"));
		String hdsa0000_010=String.valueOf(argsMap.get("hdsa0000_010"));
	 */
		pd.put("guid",  UUID.randomUUID().toString());
		pd.put("hdsb0402_001", hdsb0402_001);
		pd.put("hdsb0402_003", hdsb0402_003);
		pd.put("hdsb0402_004", hdsb0402_004);
		pd.put("hdsb0402_005", hdsb0402_005);
		pd.put("hdsb0402_006", hdsb0402_006);
		pd.put("hdsb0402_007", hdsb0402_007);
		pd.put("hdsb0402_008", hdsb0402_008);
		pd.put("hdsb0402_009", hdsb0402_009);
		pd.put("hdsb0402_010", hdsb0402_010);
		pd.put("hdsb0402_011", hdsb0402_011);
		pd.put("hdsb0402_012", hdsb0402_012);
		pd.put("hdsb0402_013", hdsb0402_013);
		pd.put("flag", flag);
		
		pd.put("hdsb0402_014", hdsb0402_014);
		pd.put("hdsb0402_015", hdsb0402_015);
		String idcode=String.valueOf(argsMap.get("idcode"));
		if(!"".equals(idcode)&&null==idcode){//防止 调用随访时专不输入身份证 在添加个人信息里面添加身份证 导致空覆盖
			pd.put("idcode", idcode);
		}

		pd.put("zttype", zttype);
		}
		else if("2".equals(zttype)){//糖尿病
			String hdsb0405_001=String.valueOf(argsMap.get("hdsb0405_001"));
			String hdsb0405_002=String.valueOf(argsMap.get("hdsb0405_002"));
			String hdsb0405_003=String.valueOf(argsMap.get("hdsb0405_003"));
			String hdsb0405_004=String.valueOf(argsMap.get("hdsb0405_004"));
			String hdsb0405_005=String.valueOf(argsMap.get("hdsb0405_005"));
			String hdsb0405_006=String.valueOf(argsMap.get("hdsb0405_006"));
			String hdsb0405_007=String.valueOf(argsMap.get("hdsb0405_007"));
			String hdsb0405_008=String.valueOf(argsMap.get("hdsb0405_008"));
			String hdsb0405_009=String.valueOf(argsMap.get("hdsb0405_009"));
			String hdsb0405_010=String.valueOf(argsMap.get("hdsb0405_010"));
			String hdsb0405_011=String.valueOf(argsMap.get("hdsb0405_011"));
			String hdsb0405_012=String.valueOf(argsMap.get("hdsb0405_012"));
			String flag=String.valueOf(argsMap.get("flag"));
			String hdsb0405_013=String.valueOf(argsMap.get("hdsb0405_013"));
			String hdsb0405_014=String.valueOf(argsMap.get("hdsb0405_014"));
			String hdsb0405_015=String.valueOf(argsMap.get("hdsb0405_015"));
			String hdsb0405_016=String.valueOf(argsMap.get("hdsb0405_016"));
			String idcode=String.valueOf(argsMap.get("idcode"));

			
			pd.put("guid",  UUID.randomUUID().toString());
			pd.put("hdsb0405_001", hdsb0405_001);
			pd.put("hdsb0405_002", hdsb0405_002);
			pd.put("hdsb0405_003", hdsb0405_003);
			pd.put("hdsb0405_004", hdsb0405_004);
			pd.put("hdsb0405_005", hdsb0405_005);
			pd.put("hdsb0405_006", hdsb0405_006);
			pd.put("hdsb0405_007", hdsb0405_007);
			pd.put("hdsb0405_008", hdsb0405_008);
			pd.put("hdsb0405_009", hdsb0405_009);
			pd.put("hdsb0405_010", hdsb0405_010);
			pd.put("hdsb0405_011", hdsb0405_011);
			pd.put("hdsb0405_012", hdsb0405_012);
			pd.put("flag", flag);
			pd.put("hdsb0405_013", hdsb0405_013);
			pd.put("hdsb0405_014", hdsb0405_014);
			pd.put("hdsb0405_015", hdsb0405_015);
			pd.put("hdsb0405_016", hdsb0405_016);
			if(!"".equals(idcode)&&null==idcode){//防止 调用随访时专不输入身份证 在添加个人信息里面添加身份证 导致空覆盖
				pd.put("idcode", idcode);
			}
			
			pd.put("zttype", zttype);
			
		}
		else{//精神病
			String hdsb0403_001=String.valueOf(argsMap.get("hdsb0403_001"));
			String hdsb0403_002=String.valueOf(argsMap.get("hdsb0403_002"));
			String hdsb0403_003=String.valueOf(argsMap.get("hdsb0403_003"));
			String hdsb0403_004=String.valueOf(argsMap.get("hdsb0403_004"));
			String hdsb0403_005=String.valueOf(argsMap.get("hdsb0403_005"));
			String hdsb0403_006=String.valueOf(argsMap.get("hdsb0403_006"));
			String hdsb0403_007=String.valueOf(argsMap.get("hdsb0403_007"));
			String hdsb0403_008=String.valueOf(argsMap.get("hdsb0403_008"));
			String hdsb0403_009=String.valueOf(argsMap.get("hdsb0403_009"));
			String hdsb0403_010=String.valueOf(argsMap.get("hdsb0403_010"));
			String hdsb0403_011=String.valueOf(argsMap.get("hdsb0403_011"));
			String hdsb0403_012=String.valueOf(argsMap.get("hdsb0403_012"));
			String flag=String.valueOf(argsMap.get("flag"));
			String hdsb0403_013=String.valueOf(argsMap.get("hdsb0403_013"));
			String hdsb0403_014=String.valueOf(argsMap.get("hdsb0403_014"));
			String hdsb0403_015=String.valueOf(argsMap.get("hdsb0403_015"));
			String idcode=String.valueOf(argsMap.get("idcode"));

			
			pd.put("guid",  UUID.randomUUID().toString());
			pd.put("hdsb0403_001", hdsb0403_001);
			pd.put("hdsb0403_002", hdsb0403_002);
			pd.put("hdsb0403_003", hdsb0403_003);
			pd.put("hdsb0403_004", hdsb0403_004);
			pd.put("hdsb0403_005", hdsb0403_005);
			pd.put("hdsb0403_006", hdsb0403_006);
			pd.put("hdsb0403_007", hdsb0403_007);
			pd.put("hdsb0403_008", hdsb0403_008);
			pd.put("hdsb0403_009", hdsb0403_009);
			pd.put("hdsb0403_010", hdsb0403_010);
			pd.put("hdsb0403_011", hdsb0403_011);
			pd.put("hdsb0403_012", hdsb0403_012);
			pd.put("flag", flag);
			pd.put("hdsb0403_013", hdsb0403_013);
			pd.put("hdsb0403_014", hdsb0403_014);
			pd.put("hdsb0403_015", hdsb0403_015);
			if(!"".equals(idcode)&&null==idcode){//防止 调用随访时专不输入身份证 在添加个人信息里面添加身份证 导致空覆盖
				pd.put("idcode", idcode);
			}
			pd.put("zttype", zttype);
			
			
		}
			
		return pd;
	}

	/**
	 * 
	 * 将建档个人信息数据分装为专档需要的参数
	 * @param userData
	 * @param xmladdtype
	 * @return 
	 */
	public static PageData getDatatoZdinfo(PageData pd ,PageData userData, String zttype) {
		//注意userData重数据库里面取值 这个地方用大写
		String guid=String.valueOf(userData.get("GUID"));//人员id  
		//String  name =String.valueOf(userData.get("HDSA0001_001"));//姓名   *****触发器补全
		String code=String.valueOf(userData.get("HDSA0001_005"));//现居地编码
		if("1".equals(zttype)){//高血压
			pd.put("hdsb0402_001", guid);
			//pd.put("hdsa0001_001", name);
			pd.put("hdsb0402_015", code);
			pd.put("flag", "0");// 0未归档 1 归档
			
		}
		else if("2".equals(zttype)){//糖尿病
			pd.put("hdsb0405_001", guid);
			//pd.put("hdsa0001_001", name);
			pd.put("hdsb0405_016", code);
			pd.put("flag", "0");// 0未归档 1 归档
		}
		else {//精神病
			pd.put("hdsb0403_001", guid);
			//pd.put("hdsa0001_001", name); 
			pd.put("hdsb0403_015", code);
			pd.put("flag", "0");// 0未归档 1 归档
		 	
		}
		
	return pd;
		
	}
	@SuppressWarnings("rawtypes")
	public static PageData getHypertensionObj(String xml) throws Exception {
		//PageData pa =new PageData();
		//获取用户信息
		Map patientinfoMap = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/patientinfo");
		PageData patitientData=getPaObj(patientinfoMap);
		Map specialfileMap = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/specialfile");
		PageData buildData=getBuildSpecialFile(specialfileMap,"1",patitientData);
		Map hdsb040201Map = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/hdsb040201");
		PageData pd201Data=gethdsb040201Map(buildData,hdsb040201Map);
		Map hdsb04020101Map = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/hdsb04020101");
		PageData pa=gethdsb04020101Map(pd201Data,hdsb04020101Map);
		return pa;
	}
	
	@SuppressWarnings("rawtypes")
	public static PageData getDiabetesObj(String xml) throws Exception {
		PageData pa =new PageData();
		//获取用户信息
		Map patientinfoMap = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/patientinfo");
		pa=getPaObj(patientinfoMap);
		Map specialfileMap = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/specialfile");
		pa=getBuildSpecialFile(specialfileMap,"2",pa);
		Map hdsb040501Map = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/hdsb040501");
		pa=gethdsb040501Map(pa,hdsb040501Map);
		Map hdsb04050101Map = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/hdsb04050101");
		pa=gethdsb04050101Map(pa,hdsb04050101Map);
		return pa;
	}
	@SuppressWarnings("rawtypes")
	public static PageData getMentalillnessObj(String xml) throws Exception {
		PageData pa =new PageData();
		//获取用户信息
		Map patientinfoMap = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/patientinfo");
		pa=getPaObj(patientinfoMap);
		Map specialfileMap = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/specialfile");
		pa=getBuildSpecialFile(specialfileMap,"3",pa);
		Map hdsb040301Map = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/hdsb040301");
		pa=gethdsb040301Map(pa,hdsb040301Map);
		Map hdsb04030101Map = InputXmlParser.argsToMap(xml, "/request/inputvalues/data/data_row/hdsb04030101");
		pa=gethdsb04030101Map(pa,hdsb04030101Map);
		return pa;
	}

	//高血压随访主表
	@SuppressWarnings("rawtypes")
	private static PageData gethdsb040201Map(PageData pa, Map hdsb040201Map ) {
		pa.put("hdsb040201_001", String.valueOf(hdsb040201Map.get("hdsb040201_001")));
		pa.put("hdsb040201_002", String.valueOf(hdsb040201Map.get("hdsb040201_002")));
		pa.put("hdsb040201_003", String.valueOf(hdsb040201Map.get("hdsb040201_003")));
		pa.put("hdsb040201_004", String.valueOf(hdsb040201Map.get("hdsb040201_004")));
		pa.put("hdsb040201_005", String.valueOf(hdsb040201Map.get("hdsb040201_005")));
		pa.put("hdsb040201_006", String.valueOf(hdsb040201Map.get("hdsb040201_006")));
		pa.put("hdsb040201_007", String.valueOf(hdsb040201Map.get("hdsb040201_007")));
		pa.put("hdsb040201_008", String.valueOf(hdsb040201Map.get("hdsb040201_008")));
		pa.put("hdsb040201_009", String.valueOf(hdsb040201Map.get("hdsb040201_009")));
		pa.put("hdsb040201_010", String.valueOf(hdsb040201Map.get("hdsb040201_010")));
		pa.put("hdsb040201_011", String.valueOf(hdsb040201Map.get("hdsb040201_011")));
		pa.put("hdsb040201_012", String.valueOf(hdsb040201Map.get("hdsb040201_012")));
		pa.put("hdsb040201_013", String.valueOf(hdsb040201Map.get("hdsb040201_013")));
		pa.put("hdsb040201_014", String.valueOf(hdsb040201Map.get("hdsb040201_014")));
		pa.put("hdsb040201_015", String.valueOf(hdsb040201Map.get("hdsb040201_015")));
		pa.put("hdsb040201_016", String.valueOf(hdsb040201Map.get("hdsb040201_016")));
		pa.put("hdsb040201_017", String.valueOf(hdsb040201Map.get("hdsb040201_017"))); 
		pa.put("hdsb040201_018", String.valueOf(hdsb040201Map.get("hdsb040201_018")));
		pa.put("hdsb040201_019", String.valueOf(hdsb040201Map.get("hdsb040201_019")));
		pa.put("hdsb040201_020", String.valueOf(hdsb040201Map.get("hdsb040201_020")));
		return pa;
	}
	//高血压随访从表
	@SuppressWarnings("rawtypes")
	private static PageData gethdsb04020101Map(PageData pa, Map hdsb04020101Map) {
		pa.put("hdsb04020101_001", String.valueOf(hdsb04020101Map.get("hdsb04020101_001")));
		pa.put("hdsb04020101_002", String.valueOf(hdsb04020101Map.get("hdsb04020101_002")));
		pa.put("hdsb04020101_003", String.valueOf(hdsb04020101Map.get("hdsb04020101_003")));
		pa.put("hdsb04020101_004", String.valueOf(hdsb04020101Map.get("hdsb04020101_004")));
		pa.put("hdsb04020101_005", String.valueOf(hdsb04020101Map.get("hdsb04020101_005")));
		pa.put("hdsb04020101_006", String.valueOf(hdsb04020101Map.get("hdsb04020101_006")));
		pa.put("hdsb04020101_007", String.valueOf(hdsb04020101Map.get("hdsb04020101_007")));
		pa.put("hdsb04020101_008", String.valueOf(hdsb04020101Map.get("hdsb04020101_008")));
		pa.put("hdsb04020101_009", String.valueOf(hdsb04020101Map.get("hdsb04020101_009")));
		pa.put("hdsb04020101_010", String.valueOf(hdsb04020101Map.get("hdsb04020101_010")));
		pa.put("hdsb04020101_011", String.valueOf(hdsb04020101Map.get("hdsb04020101_011")));
		pa.put("hdsb04020101_012", String.valueOf(hdsb04020101Map.get("hdsb04020101_012")));
		pa.put("hdsb04020101_013", String.valueOf(hdsb04020101Map.get("hdsb04020101_013")));
		pa.put("hdsb04020101_014", String.valueOf(hdsb04020101Map.get("hdsb04020101_014")));
		pa.put("hdsb04020101_015", String.valueOf(hdsb04020101Map.get("hdsb04020101_015")));
		pa.put("hdsb04020101_016", String.valueOf(hdsb04020101Map.get("hdsb04020101_016")));
		pa.put("hdsb04020101_017", String.valueOf(hdsb04020101Map.get("hdsb04020101_017")));
		pa.put("hdsb04020101_018", String.valueOf(hdsb04020101Map.get("hdsb04020101_018")));
		pa.put("hdsb04020101_019", String.valueOf(hdsb04020101Map.get("hdsb04020101_019")));
		pa.put("hdsb04020101_020", String.valueOf(hdsb04020101Map.get("hdsb04020101_020")));
		
		pa.put("hdsb04020101_021", String.valueOf(hdsb04020101Map.get("hdsb04020101_021")));
		pa.put("hdsb04020101_022", String.valueOf(hdsb04020101Map.get("hdsb04020101_022")));
		pa.put("hdsb04020101_023", String.valueOf(hdsb04020101Map.get("hdsb04020101_023")));
		pa.put("hdsb04020101_024", String.valueOf(hdsb04020101Map.get("hdsb04020101_024")));
		pa.put("hdsb04020101_025", String.valueOf(hdsb04020101Map.get("hdsb04020101_025")));
		pa.put("hdsb04020101_026", String.valueOf(hdsb04020101Map.get("hdsb04020101_026")));
		pa.put("hdsb04020101_028", String.valueOf(hdsb04020101Map.get("hdsb04020101_028")));
		pa.put("hdsb04020101_029", String.valueOf(hdsb04020101Map.get("hdsb04020101_029")));
		pa.put("hdsb04020101_030", String.valueOf(hdsb04020101Map.get("hdsb04020101_030")));
		pa.put("hdsb04020101_031", String.valueOf(hdsb04020101Map.get("hdsb04020101_031")));
		pa.put("hdsb04020101_032", String.valueOf(hdsb04020101Map.get("hdsb04020101_032")));
		pa.put("hdsb04020101_033", String.valueOf(hdsb04020101Map.get("hdsb04020101_033")));
		
		return pa;
	}


	//糖尿病随访主表
	@SuppressWarnings("rawtypes")
	private static PageData gethdsb040501Map(PageData pa, Map hdsb040501Map ) {
		pa.put("hdsb040501_001", String.valueOf(hdsb040501Map.get("hdsb040501_001")));
		pa.put("hdsb040501_002", String.valueOf(hdsb040501Map.get("hdsb040501_002")));
		pa.put("hdsb040501_003", String.valueOf(hdsb040501Map.get("hdsb040501_003")));
		pa.put("hdsb040501_004", String.valueOf(hdsb040501Map.get("hdsb040501_004")));
		pa.put("hdsb040501_005", String.valueOf(hdsb040501Map.get("hdsb040501_005")));
		pa.put("hdsb040501_006", String.valueOf(hdsb040501Map.get("hdsb040501_006")));
		pa.put("hdsb040501_007", String.valueOf(hdsb040501Map.get("hdsb040501_007")));
		pa.put("hdsb040501_008", String.valueOf(hdsb040501Map.get("hdsb040501_008")));
		pa.put("hdsb040501_009", String.valueOf(hdsb040501Map.get("hdsb040501_009")));
		pa.put("hdsb040501_010", String.valueOf(hdsb040501Map.get("hdsb040501_010")));
		pa.put("hdsb040501_011", String.valueOf(hdsb040501Map.get("hdsb040501_011")));
		pa.put("hdsb040501_012", String.valueOf(hdsb040501Map.get("hdsb040501_012")));
		pa.put("hdsb040501_013", String.valueOf(hdsb040501Map.get("hdsb040501_013")));
		pa.put("hdsb040501_014", String.valueOf(hdsb040501Map.get("hdsb040501_014")));
		pa.put("hdsb040501_015", String.valueOf(hdsb040501Map.get("hdsb040501_015")));
		pa.put("hdsb040501_016", String.valueOf(hdsb040501Map.get("hdsb040501_016")));
		pa.put("hdsb040501_017", String.valueOf(hdsb040501Map.get("hdsb040501_017")));
		pa.put("hdsb040501_018", String.valueOf(hdsb040501Map.get("hdsb040501_018")));
		pa.put("hdsb040501_019", String.valueOf(hdsb040501Map.get("hdsb040501_019")));
		pa.put("hdsb040501_020", String.valueOf(hdsb040501Map.get("hdsb040501_020")));
		return pa;
	}
	//糖尿病随访从表
	@SuppressWarnings("rawtypes")
	private static PageData gethdsb04050101Map(PageData pa, Map hdsb04050101Map) {
		pa.put("hdsb04050101_001", String.valueOf(hdsb04050101Map.get("hdsb04050101_001")));
		pa.put("hdsb04050101_002", String.valueOf(hdsb04050101Map.get("hdsb04050101_002")));
		pa.put("hdsb04050101_003", String.valueOf(hdsb04050101Map.get("hdsb04050101_003")));
		pa.put("hdsb04050101_004", String.valueOf(hdsb04050101Map.get("hdsb04050101_004")));
		pa.put("hdsb04050101_005", String.valueOf(hdsb04050101Map.get("hdsb04050101_005")));
		pa.put("hdsb04050101_006", String.valueOf(hdsb04050101Map.get("hdsb04050101_006")));
		pa.put("hdsb04050101_007", String.valueOf(hdsb04050101Map.get("hdsb04050101_007")));
		pa.put("hdsb04050101_008", String.valueOf(hdsb04050101Map.get("hdsb04050101_008")));
		pa.put("hdsb04050101_009", String.valueOf(hdsb04050101Map.get("hdsb04050101_009")));
		pa.put("hdsb04050101_010", String.valueOf(hdsb04050101Map.get("hdsb04050101_010")));
		pa.put("hdsb04050101_011", String.valueOf(hdsb04050101Map.get("hdsb04050101_011")));
		pa.put("hdsb04050101_012", String.valueOf(hdsb04050101Map.get("hdsb04050101_012")));
		pa.put("hdsb04050101_013", String.valueOf(hdsb04050101Map.get("hdsb04050101_013")));
		pa.put("hdsb04050101_014", String.valueOf(hdsb04050101Map.get("hdsb04050101_014")));
		pa.put("hdsb04050101_015", String.valueOf(hdsb04050101Map.get("hdsb04050101_015")));
		pa.put("hdsb04050101_016", String.valueOf(hdsb04050101Map.get("hdsb04050101_016")));
		pa.put("hdsb04050101_017", String.valueOf(hdsb04050101Map.get("hdsb04050101_017")));
		pa.put("hdsb04050101_018", String.valueOf(hdsb04050101Map.get("hdsb04050101_018")));
		pa.put("hdsb04050101_019", String.valueOf(hdsb04050101Map.get("hdsb04050101_019")));
		pa.put("hdsb04050101_020", String.valueOf(hdsb04050101Map.get("hdsb04050101_020")));
		pa.put("hdsb04050101_021", String.valueOf(hdsb04050101Map.get("hdsb04050101_021")));
		pa.put("hdsb04050101_022", String.valueOf(hdsb04050101Map.get("hdsb04050101_022")));
		pa.put("hdsb04050101_023", String.valueOf(hdsb04050101Map.get("hdsb04050101_023")));
		pa.put("hdsb04050101_024", String.valueOf(hdsb04050101Map.get("hdsb04050101_024")));
		pa.put("hdsb04050101_025", String.valueOf(hdsb04050101Map.get("hdsb04050101_025")));
		pa.put("hdsb04050101_026", String.valueOf(hdsb04050101Map.get("hdsb04050101_026")));
		pa.put("hdsb04050101_028", String.valueOf(hdsb04050101Map.get("hdsb04050101_028")));
		pa.put("hdsb04050101_029", String.valueOf(hdsb04050101Map.get("hdsb04050101_029")));
		pa.put("hdsb04050101_030", String.valueOf(hdsb04050101Map.get("hdsb04050101_030")));
		pa.put("hdsb04050101_031", String.valueOf(hdsb04050101Map.get("hdsb04050101_031")));
		pa.put("hdsb04050101_032", String.valueOf(hdsb04050101Map.get("hdsb04050101_032")));
		pa.put("hdsb04050101_033", String.valueOf(hdsb04050101Map.get("hdsb04050101_033")));
		
		pa.put("hdsb04050101_034", String.valueOf(hdsb04050101Map.get("hdsb04050101_034")));
		pa.put("hdsb04050101_035", String.valueOf(hdsb04050101Map.get("hdsb04050101_035")));
		pa.put("hdsb04050101_036", String.valueOf(hdsb04050101Map.get("hdsb04050101_036")));
		pa.put("hdsb04050101_037", String.valueOf(hdsb04050101Map.get("hdsb04050101_037")));
		pa.put("hdsb04050101_038", String.valueOf(hdsb04050101Map.get("hdsb04050101_038")));
		pa.put("hdsb04050101_039", String.valueOf(hdsb04050101Map.get("hdsb04050101_039")));
		pa.put("hdsb04050101_040", String.valueOf(hdsb04050101Map.get("hdsb04050101_040")));
		pa.put("hdsb04050101_041", String.valueOf(hdsb04050101Map.get("hdsb04050101_041")));
		pa.put("hdsb04050101_042", String.valueOf(hdsb04050101Map.get("hdsb04050101_042")));
		pa.put("hdsb04050101_043", String.valueOf(hdsb04050101Map.get("hdsb04050101_043")));
		pa.put("hdsb04050101_044", String.valueOf(hdsb04050101Map.get("hdsb04050101_044")));
		pa.put("hdsb04050101_045", String.valueOf(hdsb04050101Map.get("hdsb04050101_045")));
		pa.put("hdsb04050101_046", String.valueOf(hdsb04050101Map.get("hdsb04050101_046")));
		pa.put("hdsb04050101_047", String.valueOf(hdsb04050101Map.get("hdsb04050101_047")));
		pa.put("hdsb04050101_048", String.valueOf(hdsb04050101Map.get("hdsb04050101_048")));
		pa.put("hdsb04050101_049", String.valueOf(hdsb04050101Map.get("hdsb04050101_049")));
		pa.put("hdsb04050101_050", String.valueOf(hdsb04050101Map.get("hdsb04050101_050")));
		pa.put("hdsb04050101_051", String.valueOf(hdsb04050101Map.get("hdsb04050101_051")));
		pa.put("hdsb04050101_052", String.valueOf(hdsb04050101Map.get("hdsb04050101_052")));
		return pa;
	}
	
	

	//精神病随访主表
	@SuppressWarnings("rawtypes")
	private static PageData gethdsb040301Map(PageData pa, Map hdsb040301Map ) {
		pa.put("hdsb040301_001", String.valueOf(hdsb040301Map.get("hdsb040301_001")));
		pa.put("hdsb040301_002", String.valueOf(hdsb040301Map.get("hdsb040301_002")));
		pa.put("hdsb040301_003", String.valueOf(hdsb040301Map.get("hdsb040301_003")));
		pa.put("hdsb040301_004", String.valueOf(hdsb040301Map.get("hdsb040301_004")));
		pa.put("hdsb040301_005", String.valueOf(hdsb040301Map.get("hdsb040301_005")));
		pa.put("hdsb040301_006", String.valueOf(hdsb040301Map.get("hdsb040301_006")));
		pa.put("hdsb040301_007", String.valueOf(hdsb040301Map.get("hdsb040301_007")));
		pa.put("hdsb040301_008", String.valueOf(hdsb040301Map.get("hdsb040301_008")));
		pa.put("hdsb040301_009", String.valueOf(hdsb040301Map.get("hdsb040301_009")));
		pa.put("hdsb040301_010", String.valueOf(hdsb040301Map.get("hdsb040301_010")));
		pa.put("hdsb040301_011", String.valueOf(hdsb040301Map.get("hdsb040301_011")));
		pa.put("hdsb040301_012", String.valueOf(hdsb040301Map.get("hdsb040301_012")));
		pa.put("hdsb040301_013", String.valueOf(hdsb040301Map.get("hdsb040301_013")));
		pa.put("hdsb040301_014", String.valueOf(hdsb040301Map.get("hdsb040301_014")));
		pa.put("hdsb040301_015", String.valueOf(hdsb040301Map.get("hdsb040301_015")));
		pa.put("hdsb040301_016", String.valueOf(hdsb040301Map.get("hdsb040301_016")));
		pa.put("hdsb040301_017", String.valueOf(hdsb040301Map.get("hdsb040301_017")));
		pa.put("hdsb040301_018", String.valueOf(hdsb040301Map.get("hdsb040301_018")));
		pa.put("hdsb040301_019", String.valueOf(hdsb040301Map.get("hdsb040301_019")));
		pa.put("hdsb040301_020", String.valueOf(hdsb040301Map.get("hdsb040301_020")));
		return pa;
	}
	//糖尿病随访从表
	@SuppressWarnings("rawtypes")
	private static PageData gethdsb04030101Map(PageData pa, Map hdsb04030101Map) {
		pa.put("hdsb04030101_001", String.valueOf(hdsb04030101Map.get("hdsb04030101_001")));
		pa.put("hdsb04030101_002", String.valueOf(hdsb04030101Map.get("hdsb04030101_002")));
		pa.put("hdsb04030101_003", String.valueOf(hdsb04030101Map.get("hdsb04030101_003")));
		pa.put("hdsb04030101_004", String.valueOf(hdsb04030101Map.get("hdsb04030101_004")));
		pa.put("hdsb04030101_005", String.valueOf(hdsb04030101Map.get("hdsb04030101_005")));
		pa.put("hdsb04030101_006", String.valueOf(hdsb04030101Map.get("hdsb04030101_006")));
		pa.put("hdsb04030101_007", String.valueOf(hdsb04030101Map.get("hdsb04030101_007")));
		pa.put("hdsb04030101_008", String.valueOf(hdsb04030101Map.get("hdsb04030101_008")));
		pa.put("hdsb04030101_009", String.valueOf(hdsb04030101Map.get("hdsb04030101_009")));
		pa.put("hdsb04030101_010", String.valueOf(hdsb04030101Map.get("hdsb04030101_010")));
		pa.put("hdsb04030101_011", String.valueOf(hdsb04030101Map.get("hdsb04030101_011")));
		pa.put("hdsb04030101_012", String.valueOf(hdsb04030101Map.get("hdsb04030101_012")));
		pa.put("hdsb04030101_013", String.valueOf(hdsb04030101Map.get("hdsb04030101_013")));
		pa.put("hdsb04030101_014", String.valueOf(hdsb04030101Map.get("hdsb04030101_014")));
		pa.put("hdsb04030101_015", String.valueOf(hdsb04030101Map.get("hdsb04030101_015")));
		pa.put("hdsb04030101_016", String.valueOf(hdsb04030101Map.get("hdsb04030101_016")));
		pa.put("hdsb04030101_017", String.valueOf(hdsb04030101Map.get("hdsb04030101_017")));
		pa.put("hdsb04030101_018", String.valueOf(hdsb04030101Map.get("hdsb04030101_018")));
		pa.put("hdsb04030101_019", String.valueOf(hdsb04030101Map.get("hdsb04030101_019")));
		pa.put("hdsb04030101_020", String.valueOf(hdsb04030101Map.get("hdsb04030101_020")));
		pa.put("hdsb04030101_021", String.valueOf(hdsb04030101Map.get("hdsb04030101_021")));
		pa.put("hdsb04030101_022", String.valueOf(hdsb04030101Map.get("hdsb04030101_022")));
		pa.put("hdsb04030101_023", String.valueOf(hdsb04030101Map.get("hdsb04030101_023")));
		pa.put("hdsb04030101_024", String.valueOf(hdsb04030101Map.get("hdsb04030101_024")));
		pa.put("hdsb04030101_025", String.valueOf(hdsb04030101Map.get("hdsb04030101_025")));
		pa.put("hdsb04030101_026", String.valueOf(hdsb04030101Map.get("hdsb04030101_026")));
		pa.put("hdsb04030101_028", String.valueOf(hdsb04030101Map.get("hdsb04030101_028")));
		pa.put("hdsb04030101_029", String.valueOf(hdsb04030101Map.get("hdsb04030101_029")));
		pa.put("hdsb04030101_030", String.valueOf(hdsb04030101Map.get("hdsb04030101_030")));
		pa.put("hdsb04030101_031", String.valueOf(hdsb04030101Map.get("hdsb04030101_031")));
		pa.put("hdsb04030101_032", String.valueOf(hdsb04030101Map.get("hdsb04030101_032")));
		pa.put("hdsb04030101_033", String.valueOf(hdsb04030101Map.get("hdsb04030101_033")));
	
		
		return pa;
	}


	
	
	
}

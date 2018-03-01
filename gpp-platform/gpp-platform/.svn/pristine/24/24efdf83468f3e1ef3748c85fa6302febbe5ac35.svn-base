package com.tbyf.ehr.xmlparser;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jdom.xpath.XPath;
public class InputXmlParser {
	

	public static Map argsToMap(String inputxml, String nodeName)throws Exception{
		Map map = new HashMap();
		StringReader reader = null;
		try {
			SAXBuilder builder = new SAXBuilder(false);
        	reader = new StringReader(inputxml);
        	Document document = builder.build(reader);
        	XPath xpath = XPath.newInstance("/request/requestid");
			Element node = (Element) xpath.selectSingleNode(document);
			if(node != null){
				map.put("requestid", node.getText());
			}
			//getPageActionInInfo(map, document);
			getChildMap(document, nodeName, map);
		} catch (Exception e) {
			throw e;
		}finally{
			if(reader != null)
				reader.close();
		}
		return map;
	}
	
	public static Map argsToMap(String inputxml, String nodeName, String...childNodeName)throws Exception{
		Map map = new HashMap();
		StringReader reader = null;
		try {
			SAXBuilder builder = new SAXBuilder(false);
        	reader = new StringReader(inputxml);
        	Document document = builder.build(reader);
        	XPath xpath = XPath.newInstance("/request/requestid");
			Element node = (Element) xpath.selectSingleNode(document);
			if(node != null){
				map.put("requestid", node.getText());
			}
			
			getChildMap(document, nodeName, map);
			
			node = null;
			xpath = null;
			for (int k = 0; k < childNodeName.length; k++) {
				node = null;
				xpath = null;
				xpath = XPath.newInstance(childNodeName[k]);
				node = (Element) xpath.selectSingleNode(document);
				/*************sub item*************/
				if(node != null){
					List sublist = new ArrayList();
					List list = node.getChildren();
					if(list != null && list.size() >0){
						int size = list.size();
						for (int i = 0; i < size; i++) {
							Element e = (Element) list.get(i);
							if(e == null)
								continue;
							List elist = e.getChildren();
							if(elist == null)
								continue;
							int ss = elist.size();
							Map submap = new HashMap();
							for (int j = 0; j < ss; j++) {
								Element ee = (Element) elist.get(j);
								String key = ee.getName();
								submap.put(key.toLowerCase(), ee.getValue());
							}
							sublist.add(submap);
						}
					}
					map.put(childNodeName[k], sublist);
				}
				/*************sub item*************/
			}
			
			
		} catch (Exception e) {
			throw e;
		}finally{
			if(reader != null)
				reader.close();
		}
		return map;
	}
	
	public static Map argsToExtMap(String inputxml, String nodeName)throws Exception{
		Map map = new HashMap();
		StringReader reader = null;
		try {
			SAXBuilder builder = new SAXBuilder(false);
        	reader = new StringReader(inputxml);
        	Document document = builder.build(reader);
			getChildMap(document, nodeName, map);
		} catch (Exception e) {
			throw e;
		}finally{
			if(reader != null)
				reader.close();
		}
		return map;
	}
	
	/*public static void getPageActionInInfo(Map map, Document document)throws Exception{
		XPath xpath = XPath.newInstance("/request/pageactionin");
		Element node = (Element) xpath.selectSingleNode(document);
		if(node == null){
			xpath = null;
			return;
		}
		getChildMap(document, "/request/pageactionin", map);
		PageActionInInfo pagein = new PageActionInInfo();
		pagein.setPageaction((String)map.get("pageaction"));
		pagein.setCurrentpagenum(StringUtil.parseInt((String)map.get("currentpagenum"), 1));
		pagein.setRowsperpage(StringUtil.parseInt((String)map.get("rowsperpage"), 20));
		pagein.setTopagenum(StringUtil.parseInt((String)map.get("topagenum"), 1));
		map.put("pageactionininfo", pagein);
	}*/
	public static void getChildMap(Document document, String nodeName, Map map) throws Exception{
		XPath xpath = XPath.newInstance(nodeName);
		Element node = (Element) xpath.selectSingleNode(document);
		if(node == null)
			return;
		List list = node.getChildren();
		if(list != null && list.size() >0){
			int size = list.size();
			for (int i = 0; i < size; i++) {
				Element ee = (Element) list.get(i);
				String key = ee.getName();
				String value = ee.getValue();
				map.put(key.toLowerCase(), value);
			}
		}
		
	}
	
	public static Map argsToBill(String inputxml, String nodeName)throws Exception{
		Map map = new HashMap();
		StringReader reader = null;
		try {
			SAXBuilder builder = new SAXBuilder(false);
        	reader = new StringReader(inputxml);
        	Document document = builder.build(reader);
        	XPath xpath = XPath.newInstance("/request/requestid");
			Element node = (Element) xpath.selectSingleNode(document);
			if(node != null){
				map.put("requestid", node.getText());
			}
			
			getChildMap(document, nodeName, map);
			
			node = null;
			xpath = null;
			xpath = XPath.newInstance("/request/bills");
			node = (Element) xpath.selectSingleNode(document);
			/*************sub item*************/
			if(node != null){
				List sublist = new ArrayList();
				List list = node.getChildren();
				if(list != null && list.size() >0){
					int size = list.size();
					for (int i = 0; i < size; i++) {
						Element e = (Element) list.get(i);
						if(e == null)
							continue;
						List elist = e.getChildren();
						if(elist == null)
							continue;
						int ss = elist.size();
						Map submap = new HashMap();
						for (int j = 0; j < ss; j++) {
							Element ee = (Element) elist.get(j);
							String key = ee.getName();
							submap.put(key.toLowerCase(), ee.getValue());
						}
						sublist.add(submap);
					}
				}
				map.put("sublist", sublist);
			}
			/*************sub item*************/
			
		} catch (Exception e) {
			throw e;
		}finally{
			if(reader != null)
				reader.close();
		}
		return map;
	}
	
	public static Map argsToBloodTube(String inputxml, String nodeName)throws Exception{
		Map map = new HashMap();
		StringReader reader = null;
		try {
			SAXBuilder builder = new SAXBuilder(false);
        	reader = new StringReader(inputxml);
        	Document document = builder.build(reader);
//        	XPath xpath = XPath.newInstance("/request/requestid");
//			Element node = (Element) xpath.selectSingleNode(document);
//			if(node != null){
//				map.put("requestid", node.getText());
//			}
//			
//			getChildMap(document, nodeName, map);
			
        	Element node = null;
			XPath xpath = null;
			xpath = XPath.newInstance("/request/ChangeTempTubeInfos");
			node = (Element) xpath.selectSingleNode(document);
			/*************sub item*************/
			if(node != null){
				List sublist = new ArrayList();
				List list = node.getChildren();
				if(list != null && list.size() >0){
					int size = list.size();
					for (int i = 0; i < size; i++) {
						Element e = (Element) list.get(i);
						if(e == null)
							continue;
						List elist = e.getChildren();
						if(elist == null)
							continue;
						int ss = elist.size();
						Map submap = new HashMap();
						for (int j = 0; j < ss; j++) {
							Element ee = (Element) elist.get(j);
							String key = ee.getName();
							submap.put(key.toLowerCase(), ee.getValue());
						}
						sublist.add(submap);
					}
				}
				map.put("bloodTubelist", sublist);
			}
			/*************sub item*************/
			
		} catch (Exception e) {
			throw e;
		}finally{
			if(reader != null)
				reader.close();
		}
		return map;
	}
	
	public static void main(String[] args) {
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?><request><requestid>访问者id.</requestid><inputvalues><orderId>订单号</orderId><payType>支付类型（支付宝、微信、其他）</payType><outTradeNo>商户订单号</outTradeNo><payId>支付ID</payId><payAmount>支付金额（元）</payAmount><userNo>用户标识</userNo><createIp>生成订单客户端IP</createIp><payTime>支付时间</payTime><termId>设备终端号</termId><extInfo>扩展信息（JSON格式）<extInfo /><reqReserved>透传信息</reqReserved></extInfo></inputvalues></request>";
		try {
			Map map = InputXmlParser.argsToMap(xml, "/request/inputvalues");
			System.out.println(map.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

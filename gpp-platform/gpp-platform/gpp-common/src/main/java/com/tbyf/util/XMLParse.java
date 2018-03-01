package com.tbyf.util;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

public class XMLParse {
	/**
	 * 得到list集合的xml解析参数
	 * @Description TODO
	 * @param @param IntroductionXML
	 * @param @return 参数
	 * @return ArrayList<String> 返回类型 
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public static ArrayList<String> getXMLParamToList(String IntroductionXML){
		//参数集合
		ArrayList<String> parameters=new ArrayList<String>();
		//参数对象
		//ChargeInfo ci=new ChargeInfo();
		//创建新的字符串
		StringReader read=new StringReader(IntroductionXML);
		//创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
		InputSource source=new InputSource(read);
		//创建一个新的SAXBuilder
		SAXBuilder  sax=new SAXBuilder();
		//通过输入源构造一个Document
		try {
			Document doc=sax.build(source);
			// 取得根元素
			Element root = doc.getRootElement();
			//System.out.println(root.getName());// 输出根元素的名称（测试）
			// 得到根元素所有子元素的集合
			List node = root.getChildren();
			Element el = null;
			for (int i = 0; i < node.size(); i++) {
				el = (Element) node.get(i);
				//这是打印元素集合
				//System.out.println("el's name=" + el.getName());
				//System.out.println("el's value=" + el.getValue());
				List node1 = el.getChildren();
				Element el1 = null;
				
				for (int j = 0; j < node1.size(); j++) {
					el1 = (Element) node1.get(j);
					//这是打印所有元素的值
					//System.out.print("传入的参数"+el1.getName()+"="+el1.getValue()+"\t");
					parameters.add(el1.getValue());
				}
			}
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return parameters;
	}
	/**
	 * 得到map解析的xml参数
	 * @Description TODO
	 * @param @param IntroductionXML
	 * @param @return 参数
	 * @return Map<String,String> 返回类型 
	 * @throws
	 */
	public static Map<String, String> getXMLParamToMap(String IntroductionXML){
		//参数集合
		//ArrayList<String> parameters=new ArrayList<String>();
		Map<String, String> map=new HashMap<String, String>();
		//参数对象
		//ChargeInfo ci=new ChargeInfo();
		//创建新的字符串
		StringReader read=new StringReader(IntroductionXML);
		//创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
		InputSource source=new InputSource(read);
		//创建一个新的SAXBuilder
		SAXBuilder  sax=new SAXBuilder();
		//通过输入源构造一个Document
		try {
			Document doc=sax.build(source);
			// 取得根元素
			Element root = doc.getRootElement();
			//System.out.println(root.getName());// 输出根元素的名称（测试）
			// 得到根元素所有子元素的集合
			List node = root.getChildren();
			Element el = null;
			for (int i = 0; i < node.size(); i++) {
				el = (Element) node.get(i);
				//这是打印元素集合
				//System.out.println("el's name=" + el.getName());
				//System.out.println("el's value=" + el.getValue());
				List node1 = el.getChildren();
				Element el1 = null;
				
				for (int j = 0; j < node1.size(); j++) {
					el1 = (Element) node1.get(j);
					//这是打印所有元素的值
					//System.out.print("传入的参数"+el1.getName()+"="+el1.getValue()+"\t");
					//parameters.add(el1.getValue());
					map.put(el1.getName(), el1.getValue());
				}
			}
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
}

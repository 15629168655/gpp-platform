package com.tbyf.entity.enums;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.management.openmbean.ArrayType;

/**
 * Created by lizk on 2017/2/23.
 * 1:高血压、2:65岁以上、3:孕产妇、4:新生儿、5:恶性肿瘤、6:精神异常、7:精神病、8:残疾人、9:健康、10:6岁以下、11:脑卒中、12:冠心病、13:糖尿病、99:其他、
 */
public enum EnumTsxxJmbq {

	GXY(1,"高血压"),LNR(2,"65岁以上"),YCF(3,"孕产妇"),XSE(4,"新生儿"),EXZL(5,"恶性肿瘤"),JSYC(6,"精神异常"),JSB(7,"精神病"),CJR(8,"残疾人"),
	JK(9,"健康"),ET(10,"6岁以下"),NCZ(11,"脑卒中"),GXB(12,"冠心病"),TNB(13,"糖尿病"),QT(99,"其他");
	 
 	private Integer code;
    private String name;
    
    EnumTsxxJmbq(Integer code, String name) {
        this.code = code;
        this.name = name;
    }

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
	public static Map<Integer, String> toMap() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumTsxxJmbq type : EnumTsxxJmbq.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
	public static List<Integer> getKey() {
		List<Integer> key = new ArrayList<Integer>();
        for (EnumTsxxJmbq type : EnumTsxxJmbq.values()) {
        	key.add(type.getCode());
        }
        return key;
    }
	
	public static List<String> getValue() {
		List<String> value = new ArrayList<String>();
        for (EnumTsxxJmbq type : EnumTsxxJmbq.values()) {
        	value.add(type.getName());
        }
        return value;
    }
}

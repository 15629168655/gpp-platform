package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院医嘱——皮试判断
 * Created by lizk on 2016/10/26.
 */
public enum EnumZyyzPSPD {

	YES(1,"是"),NO(0,"否");

	private Integer code;
	private String name;
	
	EnumZyyzPSPD(Integer code, String name) {
	    this.code = code;
	    this.name = name;
	}
	
	public String getName() {
	    return name;
	}
	
	public void setName(String name) {
	    this.name = name;
	}
	
	public Integer getCode() {
	    return code;
	}
	
	public void setCode(Integer code) {
	    this.code = code;
	}
	
	public static Map<Integer, String> toMap() {
	    Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
	    for (EnumZyyzPSPD type : EnumZyyzPSPD.values()) {
	        enumDataMap.put(type.getCode(), type.getName());
	    }
	    return enumDataMap;
	}
}

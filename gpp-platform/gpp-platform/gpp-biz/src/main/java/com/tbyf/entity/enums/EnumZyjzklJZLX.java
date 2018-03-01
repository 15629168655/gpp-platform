package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院就诊记录——就诊类型
 * Created by lizk on 2016/10/26.
 */
public enum EnumZyjzklJZLX {

	JZGC(300,"急诊观察"),PTZY(400,"普通住院"),TXZY(401,"特需住院"),JC(500,"家床"),QT(999,"其他");
	private Integer code;
	private String name;
	
	EnumZyjzklJZLX(Integer code, String name) {
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
	    for (EnumZyjzklJZLX type : EnumZyjzklJZLX.values()) {
	        enumDataMap.put(type.getCode(), type.getName());
	    }
	    return enumDataMap;
	}
}

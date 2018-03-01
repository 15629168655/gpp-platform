package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院就诊记录——诊断编码类型
 * Created by lizk on 2016/10/26.
 */
public enum EnumZyjzjlZDBMLX {

	ICD(01,"ICD-10"),GB(02,"GB/T 15657-1995");
	private Integer code;
	private String name;
	
	EnumZyjzjlZDBMLX(Integer code, String name) {
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
	    for (EnumZyjzjlZDBMLX type : EnumZyjzjlZDBMLX.values()) {
	        enumDataMap.put(type.getCode(), type.getName());
	    }
	    return enumDataMap;
	}
}

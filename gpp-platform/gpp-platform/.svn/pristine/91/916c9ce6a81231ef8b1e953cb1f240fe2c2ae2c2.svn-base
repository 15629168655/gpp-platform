package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院就诊记录患者归属地
 * Created by lizk on 2016/10/24.
 */
public enum EnumZyjzjlHZGSD {

	BXQ(1,"本县区"),BSHIQTXQ(2,"本市其他县区"),BSHENGQTXQ(3,"本市其他县区"),WS(4,"外省"),GAT(5,"港澳台"),WJ(6,"外籍");

	private Integer code;
	private String name;
	
	EnumZyjzjlHZGSD(Integer code, String name) {
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
	    for (EnumZyjzjlHZGSD type : EnumZyjzjlHZGSD.values()) {
	        enumDataMap.put(type.getCode(), type.getName());
	    }
	    return enumDataMap;
	}
}

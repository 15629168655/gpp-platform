package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author zanxc
 * @创建日期2017年7月27日下午4:17:13
 * 是否重点人群枚举
 */
public enum EnumIsImprotantP {

	YES(1,"是"),NO(0,"否");

	private Integer code;
	private String name;

	EnumIsImprotantP(Integer code, String name) {
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
		for (EnumIsImprotantP type : EnumIsImprotantP.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
	
}

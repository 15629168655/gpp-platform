package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 是否有链接枚举
 * @author zanxc
 * @创建日期2017年8月14日下午3:30:07
 */
public enum EnumIsUrl {

	NO(0,"没有"),YES(1,"有");

	private Integer code;
	private String name;

	EnumIsUrl(Integer code, String name) {
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
		for (EnumIsUrl type : EnumIsUrl.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**
 * 是否签约
 * @author zanxc
 * @创建日期2017年7月28日下午5:03:52
 */
public enum EnumIsSign {

	NO(0,"未签约"),CHECK(1,"审核"),YES(2,"签约");

	private Integer code;
	private String name;

	EnumIsSign(Integer code, String name) {
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
		for (EnumIsSign type : EnumIsSign.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

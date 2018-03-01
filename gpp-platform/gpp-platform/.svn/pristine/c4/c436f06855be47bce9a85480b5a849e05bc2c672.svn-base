package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 执行的效果
 * @author zanxc
 * @创建日期2017年8月21日上午11:52:22
 */
public enum EnumImplEffect {

	NO(0,"无"),VERYGOOD(1,"非常好"),GOOD(2,"一般"), BAD(3, "差");

	private Integer code;
	private String name;

	EnumImplEffect(Integer code, String name) {
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
		for (EnumImplEffect type : EnumImplEffect.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

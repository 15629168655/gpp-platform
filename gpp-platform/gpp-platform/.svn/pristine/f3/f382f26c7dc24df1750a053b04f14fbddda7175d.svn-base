package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**
 * 治疗方案的类型
 * @author zanxc
 * @创建日期2017年8月21日上午11:43:46
 */
public enum EnumTreateCaseModelType {

	PUBLIC(0,"公共的"),PRIVATE(1,"私有的");

	private Integer code;
	private String name;

	EnumTreateCaseModelType(Integer code, String name) {
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
		for (EnumTreateCaseModelType type : EnumTreateCaseModelType.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

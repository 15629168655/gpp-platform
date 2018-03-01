package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**
 * 治疗方案的状态
 * @author zanxc
 * @创建日期2017年8月21日上午10:08:10
 */
public enum EnumTreateCaseModelState {

	
	ENABLE(0,"启用"),DEL(1,"删除");

	private Integer code;
	private String name;

	EnumTreateCaseModelState(Integer code, String name) {
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
		for (EnumTreateCaseModelState type : EnumTreateCaseModelState.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

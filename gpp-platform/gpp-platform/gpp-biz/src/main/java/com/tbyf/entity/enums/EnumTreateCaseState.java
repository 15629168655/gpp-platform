package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**
 *治疗方案的状态 0未执行、1执行中、2完成 3删除
 * @author zanxc
 * @创建日期2017年8月21日上午11:46:29
 */
public enum EnumTreateCaseState {

	UNEXECUTED(0,"未执行"),EXECUTED(1,"执行中"),COMPLETED(2,"完结"), DEL(3, "删除");

	private Integer code;
	private String name;

	EnumTreateCaseState(Integer code, String name) {
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
		for (EnumTreateCaseState type : EnumTreateCaseState.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

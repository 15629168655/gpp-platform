package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumMessageType {

	NOTIFICTION(1,"通知公告"),STOP(2,"站内信"),CONSULT(3,"咨询消息"),JOB(4,"任务提醒");

	private Integer code;
	private String name;

	EnumMessageType(Integer code, String name) {
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
		for (EnumMessageType type : EnumMessageType.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}

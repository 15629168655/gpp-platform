package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumPushMessageType {

    BROAD(1,"广播消息"),STOP(2,"站内信"),CONSULT(3,"消息咨询"),JOB(4,"任务提醒"), OTHER(9,"其他");
	
	private Integer code;
    private String name;
    
    EnumPushMessageType(Integer code, String name) {
        this.code = code;
        this.name = name;
    }

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
	public static Map<Integer, String> toMap() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumPushMessageType type : EnumPushMessageType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

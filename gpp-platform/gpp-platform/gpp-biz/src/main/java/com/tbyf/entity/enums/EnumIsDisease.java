package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumIsDisease {

	NO(0,"否"),IS(1,"是");
	
	private Integer code;
    private String name;
    
    EnumIsDisease(Integer code, String name) {
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
        for (EnumIsDisease type : EnumIsDisease.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumShbj {
	
	PASS(0,"通过"),BACK(1,"拒绝");
	
	private Integer code;
    private String name;
    
    EnumShbj(Integer code, String name) {
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
        for (EnumShbj type : EnumShbj.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

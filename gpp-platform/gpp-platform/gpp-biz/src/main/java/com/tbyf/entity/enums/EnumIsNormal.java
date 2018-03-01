package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 是否正常
 * @author lizk
 *2016-12-05
 */
public enum EnumIsNormal {

	NORMAL(0,"正常"),ABNORMAL(1,"不正常");
	
	private Integer code;
    private String name;
    
    EnumIsNormal(Integer code, String name) {
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
        for (EnumIsNormal type : EnumIsNormal.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

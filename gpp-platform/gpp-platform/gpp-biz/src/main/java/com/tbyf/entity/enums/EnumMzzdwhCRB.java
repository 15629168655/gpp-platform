package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 门诊诊断维护，是否传染病
 * @author lizk
 *2016-09-30
 */
public enum EnumMzzdwhCRB {

	YES(0,"是"),NO(1,"否");
	
	private Integer code;
    private String name;
    
    EnumMzzdwhCRB(Integer code, String name) {
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
        for (EnumMzzdwhCRB type : EnumMzzdwhCRB.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 版本管理类型
 * @author ad
 *
 */
public enum EnumVersionStatus {
	
	f(0,"否"),s(1,"是");
	
	private Integer code;
    private String name;
    
    EnumVersionStatus(Integer code, String name) {
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
        for (EnumVersionStatus type : EnumVersionStatus.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

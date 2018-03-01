package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 不良反应药品管理状态
 * @author lizk
 *2016-09-28
 */
public enum EnumBlfyypglState {

	NORMAL(0,"正常"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumBlfyypglState(Integer code, String name) {
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
        for (EnumBlfyypglState type : EnumBlfyypglState.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

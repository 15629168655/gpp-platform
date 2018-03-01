package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 输液登记表状态
 * @author lizk
 *2016-10-09
 */
public enum EnumSydjState {

	NORMAL(0,"正常"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumSydjState(Integer code, String name) {
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
        for (EnumSydjState type : EnumSydjState.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

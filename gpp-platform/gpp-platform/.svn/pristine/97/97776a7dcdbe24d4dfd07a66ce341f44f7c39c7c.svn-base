package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 临床项目是否启用
 * @author lizk
 *2017-02-08
 */
public enum EnumLcxmQY {

	ENABLE(0,"启用"),DISABLE(1,"停用");
	
	private Integer code;
    private String name;
    
    EnumLcxmQY(Integer code, String name) {
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
        for (EnumLcxmQY type : EnumLcxmQY.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
}

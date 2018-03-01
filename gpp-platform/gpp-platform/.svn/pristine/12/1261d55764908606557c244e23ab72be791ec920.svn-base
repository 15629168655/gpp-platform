package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 服务包类型（0：基本服务包；1：个性服务包）
 * @author lizk
 *2016-11-17
 */
public enum EnumServicePackLX {

	BASIC(0,"基本服务包"),PERSONALITY(1,"个性服务包");
	
	private Integer code;
    private String name;
    
    EnumServicePackLX(Integer code, String name) {
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
        for (EnumServicePackLX type : EnumServicePackLX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

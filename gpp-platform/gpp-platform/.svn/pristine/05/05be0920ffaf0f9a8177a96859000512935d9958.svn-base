package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 元素分类状态
 * @author lizk
 *2016-10-19
 */
public enum EnumYsflZT {

	DISABLE(0,"停用"),ENABLE(1,"启用"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumYsflZT(Integer code, String name) {
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
        for (EnumYsflZT type : EnumYsflZT.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

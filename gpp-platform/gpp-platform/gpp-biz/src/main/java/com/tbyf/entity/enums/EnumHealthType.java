package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 * app健康资讯类型枚举
 * @author ad
 *
 */
public enum EnumHealthType {
	
XW(1,"新闻"),JKZS(2,"健康知识");
	
	private Integer code;
    private String name;
    
    EnumHealthType(Integer code, String name) {
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
        for (EnumHealthType type : EnumHealthType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }	
	
}

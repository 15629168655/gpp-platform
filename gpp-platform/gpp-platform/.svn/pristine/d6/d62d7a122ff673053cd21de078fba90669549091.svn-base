package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 是否是公用模版
 * @author liwb
 *2017-08-03
 */
public enum EnumIsCommonSfTemp {
	NO(0,"否"),YES(1,"是");
	
	private Integer code;
    private String name;
    
    EnumIsCommonSfTemp(Integer code, String name) {
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
        for (EnumIsCommonSfTemp type : EnumIsCommonSfTemp.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
}

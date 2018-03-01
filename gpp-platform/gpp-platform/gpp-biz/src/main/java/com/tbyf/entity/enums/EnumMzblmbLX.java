package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 门诊病历模板类型（0：个人、1：公共）
 * @author lizk
 *2017-02-14
 */
public enum EnumMzblmbLX {

	PERSONAL(0,"个人"),PUBLIC(1,"公共");
	
	private Integer code;
    private String name;
    
    EnumMzblmbLX(Integer code, String name) {
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
        for (EnumMzblmbLX type : EnumMzblmbLX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 不良反应药品管理类别
 * @author lizk
 *2016-09-28
 */
public enum EnumBlfyypglLB {


	INFUSION(0,"输液"),SKINTEST(1,"皮试"),INJECTION(2,"注射"),OTHER(3,"其他");
	
	private Integer code;
    private String name;
    
    EnumBlfyypglLB(Integer code, String name) {
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
        for (EnumBlfyypglLB type : EnumBlfyypglLB.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

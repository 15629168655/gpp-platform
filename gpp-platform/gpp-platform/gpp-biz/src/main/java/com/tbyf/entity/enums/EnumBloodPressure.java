package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 门诊测血压，是否用药
 * @author lizk
 *2016-09-26
 */
public enum EnumBloodPressure {

	YES(1,"用药"),NO(0,"不用药");
	
	private Integer code;
    private String name;
    
    EnumBloodPressure(Integer code, String name) {
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
        for (EnumBloodPressure type : EnumBloodPressure.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

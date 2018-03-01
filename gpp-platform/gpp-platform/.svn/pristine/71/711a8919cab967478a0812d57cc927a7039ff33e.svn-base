package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 间隔的单位
 * @author zanxc
 * @创建日期2017年8月21日上午10:22:25
 */
public enum EnumIntervalCompany {

	DAY(0,"日"), MONTH(5, "月");
	private Integer code;
    private String name;
    
    EnumIntervalCompany(Integer code, String name) {
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
        for (EnumIntervalCompany type : EnumIntervalCompany.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 通知公告类型
 * @author ad
 *
 */
public enum EnumNotice {
	
	TZ(1,"通知"),GG(2,"公告");
	
	private Integer code;
    private String name;
    
    EnumNotice(Integer code, String name) {
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
        for (EnumNotice type : EnumNotice.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

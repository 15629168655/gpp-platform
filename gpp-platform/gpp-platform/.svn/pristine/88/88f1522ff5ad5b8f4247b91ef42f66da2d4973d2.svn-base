package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 随访记录表——随访方式
 * @author lizk
 *2016-10-12
 */
public enum EnumSfjlSFFS {

	MENZ(0,"门诊"),JIAT(1,"家庭"),DIANH(2,"电话");
	
	private Integer code;
    private String name;
    
    EnumSfjlSFFS(Integer code, String name) {
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
        for (EnumSfjlSFFS type : EnumSfjlSFFS.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

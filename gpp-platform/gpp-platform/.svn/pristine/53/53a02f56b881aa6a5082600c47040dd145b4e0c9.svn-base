package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 随访记录表——是否处理
 * @author lizk
 *2016-10-12
 */
public enum EnumSfjlSFCL {

	WFS(0,"未访视"),YFS(1,"已访视");
	
	private Integer code;
    private String name;
    
    EnumSfjlSFCL(Integer code, String name) {
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
        for (EnumSfjlSFCL type : EnumSfjlSFCL.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

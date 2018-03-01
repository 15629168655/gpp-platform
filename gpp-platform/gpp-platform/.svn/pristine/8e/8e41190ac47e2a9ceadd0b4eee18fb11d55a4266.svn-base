package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 模板类型
 * @author zanxc
 *
 */
public enum EnumModelType {
	//0：输入 1：下拉
	INPUT(0,"输入"), UPPULL(1,"下拉");
	private Integer code;
    private String name;
    
    EnumModelType(Integer code, String name) {
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
        for (EnumModelType type : EnumModelType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }


}

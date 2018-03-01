package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumStatusTeam {
	
	ENABLE(0,"启用"),DISABLE(1,"取消"),DELETE(2,"删除");
	
	private Integer code;
    private String name;
    
    EnumStatusTeam(Integer code, String name) {
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
        for (EnumStatusTeam type : EnumStatusTeam.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
}

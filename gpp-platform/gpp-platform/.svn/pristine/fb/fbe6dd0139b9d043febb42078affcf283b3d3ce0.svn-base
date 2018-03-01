package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumHospitalizationTsclsy {
	
	POLICE(0,"110"), SALVAGE(1,"危重抢救"),OTHERS(2,"其他情况");
	
	private Integer code;
    private String name;
    
    EnumHospitalizationTsclsy(Integer code, String name) {
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
        for (EnumHospitalizationTsclsy type : EnumHospitalizationTsclsy.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }


}

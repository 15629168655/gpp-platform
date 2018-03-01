package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院证--病情
 * Created by nf on 2016/10/10.
 */

public enum EnumHospitalizationBq {
	
	DANGER(0,"危"), URGENCY(1,"急"),GENERAL(2,"一般");
	
	private Integer code;
    private String name;
    
    EnumHospitalizationBq(Integer code, String name) {
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
        for (EnumHospitalizationBq type : EnumHospitalizationBq.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

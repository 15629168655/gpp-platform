package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院证--费用类别
 * Created by nf on 2016/12/15.
 */
public enum EnumHospitalizationFylb {
	
	SELFPAYING(0,"自费"), BASICMEDICAL(1,"基本医疗"),SPECIALACCOUNT(2,"特约户"),OTHERS(3,"其他");
	
	private Integer code;
    private String name;
    
    EnumHospitalizationFylb(Integer code, String name) {
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
        for (EnumHospitalizationFylb type : EnumHospitalizationFylb.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

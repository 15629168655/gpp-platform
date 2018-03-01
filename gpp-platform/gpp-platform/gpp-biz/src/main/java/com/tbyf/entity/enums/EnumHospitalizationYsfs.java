package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院证--运送方式
 * Created by nf on 2016/10/10.
 */

public enum EnumHospitalizationYsfs {
	

	LS(0,"领送"), FX(1,"扶行"),CS(2,"车送"),TS(3,"抬送");
	
	private Integer code;
    private String name;
    
    EnumHospitalizationYsfs(Integer code, String name) {
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
        for (EnumHospitalizationYsfs type : EnumHospitalizationYsfs.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

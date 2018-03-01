package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院证--隔离
 * Created by nf on 2016/10/10.
 */

public enum EnumHospitalizationGl {
	
	WXGL(0,"毋需隔离"), HXDGL(1,"呼吸道隔离"),CBGL(2,"床边隔离");
	
	private Integer code;
    private String name;
    
    EnumHospitalizationGl(Integer code, String name) {
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
        for (EnumHospitalizationGl type : EnumHospitalizationGl.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }


}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院证--卫生处理
 * Created by nf on 2016/10/10.
 */

public enum EnumHospitalizationWscl {
	
    BATH(0,"沐浴"), TUB(1,"盆浴"),SPONGE(2,"擦浴"),NONE(3,"免浴");
	
	private Integer code;
    private String name;
    
    EnumHospitalizationWscl(Integer code, String name) {
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
        for (EnumHospitalizationWscl type : EnumHospitalizationWscl.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }


}

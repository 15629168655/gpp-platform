package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 预约方式
 * @author lh
 *
 */
public enum EnumAgreementType {
	
	SM(0,"上门"),MZ(1,"门诊");
	
	private Integer code;
    private String name;
    
    EnumAgreementType(Integer code, String name) {
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
        for (EnumAgreementType type : EnumAgreementType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

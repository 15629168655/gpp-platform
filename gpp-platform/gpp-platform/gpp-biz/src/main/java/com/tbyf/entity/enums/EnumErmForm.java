package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 * 模板类型
 */
public enum EnumErmForm {
		
	BZ_TEMPLATE(0,"标准模板"),ZK_TEMPLATE(1,"专科模板"),GR_TEMPLATE(2,"个人模板");	
	
	private Integer code;
    private String name;
	
	EnumErmForm(Integer code, String name) {
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
        for (EnumErmForm type : EnumErmForm.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 门诊病历状态（0：保存；1:提交； 9：删除）
 * @author lizk
 *2017-02-14
 */
public enum EnumMzblZT {

	SAVE(0,"保存"),SUBMIT(1,"提交"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumMzblZT(Integer code, String name) {
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
        for (EnumMzblZT type : EnumMzblZT.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

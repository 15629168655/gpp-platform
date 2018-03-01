package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumAgreementService {
	
	SAVED(0,"保存"),SIGN(1,"签约"),CHANGE(2,"变更"),SURRENDER(3,"解约"),RENEW(4,"续约"),SIGNED(5,"转签"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumAgreementService(Integer code, String name) {
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
        for (EnumAgreementService type : EnumAgreementService.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
	/**
	 * 去除删除状态
	 * @return
	 */
	public static Map<Integer, String> toMapNoDELETE() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumAgreementService type : EnumAgreementService.values()) {
        	if(type.getCode()!=DELETE.getCode()){
        		enumDataMap.put(type.getCode(), type.getName());
        	}
        }
        return enumDataMap;
    }
}

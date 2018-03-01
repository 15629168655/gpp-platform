package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 患者信息--归属地
 * Created by nf on 2016/10/11.
 */
public enum EnumPatientGsd {

    BXQ(1,"本县区"), BSQTXQ(2,"本市其他县区"),BSQTDS(3,"本省其他地市"),WS(4,"外省"),GAT(5,"港澳台"),WJ(6,"外籍");
	
	private Integer code;
    private String name;
    
    EnumPatientGsd(Integer code, String name) {
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
        for (EnumPatientGsd type : EnumPatientGsd.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

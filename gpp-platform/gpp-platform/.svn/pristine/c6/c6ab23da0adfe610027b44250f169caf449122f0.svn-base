package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 随访记录表——状态
 * @author lizk
 *2016-10-12
 */
public enum EnumSfjlZT {

	NORMAL(0,"正常"),TO_VOID(1,"作废"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumSfjlZT(Integer code, String name) {
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
        for (EnumSfjlZT type : EnumSfjlZT.values()) {
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
        for (EnumSfjlZT type : EnumSfjlZT.values()) {
        	if(type.getCode()!=DELETE.getCode()){
        		enumDataMap.put(type.getCode(), type.getName());
        	}
        }
        return enumDataMap;
    } 
}

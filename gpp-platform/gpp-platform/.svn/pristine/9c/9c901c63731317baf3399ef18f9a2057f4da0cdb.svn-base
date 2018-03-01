package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 基层卫生提醒状态
 * @author lizk
 *2006-09-23
 */
public enum EnumJcwstxZT {
	UNREAD(0,"未读"),READ(1,"已读"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumJcwstxZT(Integer code, String name) {
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
        for (EnumJcwstxZT type : EnumJcwstxZT.values()) {
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
        for (EnumJcwstxZT type : EnumJcwstxZT.values()) {
        	if(type.getCode()!=DELETE.getCode()){
        		enumDataMap.put(type.getCode(), type.getName());
        	}
        }
        return enumDataMap;
    }

}

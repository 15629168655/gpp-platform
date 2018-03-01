package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 * 任务状态
 * @author nief
 *2016-12-01
 */
public enum EnumTaskStatus {
	
	UNTREATED(0,"未处理"),PROCESSED(1,"已处理"),DELETE(9,"删除");
	
	private Integer code;
    private String name;
    
    EnumTaskStatus(Integer code, String name) {
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
        for (EnumTaskStatus type : EnumTaskStatus.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
	public static Map<Integer, String> toMapNoDELETE() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumTaskStatus type : EnumTaskStatus.values()) {
        	if(type.getCode()!=DELETE.getCode()){
        		enumDataMap.put(type.getCode(), type.getName());
        	}
        }
        return enumDataMap;
    } 

}

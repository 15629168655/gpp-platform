package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 基层卫生提醒类型
 * @author lizk
 *2016-09-23
 */
public enum EnumJcwstxLX {

	NOTICE(0,"公告"),NEWS(1,"消息"),INSPECT(2,"检查"),TEST(3,"检验");
	
	private Integer code;
    private String name;
    
    EnumJcwstxLX(Integer code, String name) {
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
        for (EnumJcwstxLX type : EnumJcwstxLX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

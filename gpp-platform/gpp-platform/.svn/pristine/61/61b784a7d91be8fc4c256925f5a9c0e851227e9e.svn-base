package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 是否推荐
 * @author lizk
 *2016-12-02
 */
public enum EnumIsRecommend {

	NO(0,"不推荐"),YES(1,"推荐");
	
	private Integer code;
    private String name;
    
    EnumIsRecommend(Integer code, String name) {
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
        for (EnumIsRecommend type : EnumIsRecommend.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

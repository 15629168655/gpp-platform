package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**是否放弃
 * 
 * @author zanxc
 *
 */
public enum EnumIsGiveUp {


	//（0 不放弃，1放弃）
	GIVEUP(1,"放弃"), NO(0,"不放弃");
	private Integer code;
    private String name;
    
    EnumIsGiveUp(Integer code, String name) {
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
        for (EnumIsGiveUp type : EnumIsGiveUp.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

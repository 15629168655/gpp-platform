package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 模板的状态
 * @author ad
 *
 */
public enum EnumIndexState {

	//0正常、1删除
	NORAML(0,"正常"), DEL(1,"删除");
	private Integer code;
    private String name;
    
    EnumIndexState(Integer code, String name) {
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
        for (EnumIndexState type : EnumIndexState.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

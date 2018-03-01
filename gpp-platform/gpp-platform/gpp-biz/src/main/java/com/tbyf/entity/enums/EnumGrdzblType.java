package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 个人电子病历类型
 * @author lh
 *
 */
public enum EnumGrdzblType {
	
BL(1,"病历"),TJ(2,"体检"),BGD(3,"报告单"),CF(4,"处方");
	
	private Integer code;
    private String name;
    
    EnumGrdzblType(Integer code, String name) {
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
        for (EnumGrdzblType type : EnumGrdzblType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

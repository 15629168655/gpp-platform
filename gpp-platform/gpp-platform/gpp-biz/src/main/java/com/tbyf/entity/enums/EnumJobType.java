package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 任务类型
 * @author nief
 *2016-12-01
 */
public enum EnumJobType {
	
	AGREEMENT(0,"签约"),TREATMENT(1,"诊疗"),VISIT(2,"随访");

   private Integer code;
    private String name;
    
    EnumJobType(Integer code, String name) {
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
        for (EnumJobType type : EnumJobType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

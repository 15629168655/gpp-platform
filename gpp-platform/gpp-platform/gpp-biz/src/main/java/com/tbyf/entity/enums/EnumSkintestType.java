package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 皮试不良反应--皮试类型
 * Created by nf on 2016/12/15.
 */

public enum EnumSkintestType {
	
	INTRADERMAL(0,"皮内试验"), PRICK(1,"挑刺试验"),PATCH(2,"斑贴试验");
	
	private Integer code;
    private String name;
    
    EnumSkintestType(Integer code, String name) {
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
        for (EnumSkintestType type : EnumSkintestType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 随访记录表——随访类型
 * @author lizk
 *2016-10-12
 */
public enum EnumSfjlSFLX {

	GXY(0,"高血压"),TNB(1,"糖尿病"),JSB(2,"精神病"),LNR(3,"老年人"),FY(4,"妇幼"),CY(5,"出院"),TJ(6,"体检"),QT(7,"其他");
	
	private Integer code;
    private String name;
    
    EnumSfjlSFLX(Integer code, String name) {
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
        for (EnumSfjlSFLX type : EnumSfjlSFLX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**指标结果的适用类型
 * 
 * @author zanxc
 *EnumResult
 */
public enum EnumFitSex {

	//0：不限制、1：男、2：女
	ANY(0,"不限制"), BOY(1,"男"),GIRL(2,"女");
	private Integer code;
    private String name;
    
    EnumFitSex(Integer code, String name) {
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
        for (EnumFitSex type : EnumFitSex.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

	
}

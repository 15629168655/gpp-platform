package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 给药途径
 * @author zhangy
 *2016-12-13
 */
public enum EnumChannel {
	JMZS("iv","静脉注射"),FQZS("ip","腹腔注射"),KF("po","口服"),PXZS("sc","皮下注射"),GW("ig","灌胃"),JMDZ("ivdrip","静脉滴注");
	
	private String code;
    private String name;
    
    EnumChannel(String code, String name) {
        this.code = code;
        this.name = name;
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
	public static Map<String, String> toMap() {
        Map<String, String> enumDataMap = new TreeMap<String, String>();
        for (EnumChannel type : EnumChannel.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
}

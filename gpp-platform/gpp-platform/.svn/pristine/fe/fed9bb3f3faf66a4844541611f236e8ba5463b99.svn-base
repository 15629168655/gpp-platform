package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 * 患者信息--卡类型
 * Created by nf on 2016/10/11.
 */
public enum EnumPatientKlx {
	
    SSC(0,"社保卡"), MC(1,"医保卡"),RHC(2,"居民健康卡"),HIC(3,"院内卡"),NCMSC(5,"新农合卡"),OTHERS(9,"其他卡");
	
	private Integer code;
    private String name;
    
    EnumPatientKlx(Integer code, String name) {
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
        for (EnumPatientKlx type : EnumPatientKlx.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

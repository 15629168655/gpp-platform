package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 签约申请状态
 * @author lh
 *
 */
public enum EnumAgreementApply {
	
	EXAMINE(0,"审核中"),PASS(1,"通过"),BACK(2,"退回"),INVALID(3,"作废");
	
	private Integer code;
    private String name;
    
    EnumAgreementApply(Integer code, String name) {
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
        for (EnumAgreementApply type : EnumAgreementApply.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

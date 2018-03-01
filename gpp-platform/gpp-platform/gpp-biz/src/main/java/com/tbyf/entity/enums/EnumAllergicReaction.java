package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 * 皮试不良反应--过敏反应
 * Created by nf on 2016/10/14.
 */
public enum EnumAllergicReaction {
	
	RASH(0,"皮疹"), URTICARIA(1,"荨麻疹"),DERMATITIS(2,"皮炎"),FEVER(3,"发热"),OEDEMA(4,"血管神经性水肿"),ASTHMA(5,"哮喘"),SHOCK(6,"过敏性休克"),OTHERS(9,"其他");
	
	private Integer code;
    private String name;
    
    EnumAllergicReaction(Integer code, String name) {
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
        for (EnumAllergicReaction type : EnumAllergicReaction.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

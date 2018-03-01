package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 随访记录表——身体症状
 * @author liwb
 *2017-8-3
 */
public enum EnumSfjlSTZZ {

	WZZ(0,"无症状"),TYTT(1,"头晕头痛"),EXOT(2,"恶心呕吐"),YHEM(3,"眼花耳鸣"),HXKN(4,"呼吸困难"),XJXM(5,"心悸胸闷"),BNCXBZ(6,"鼻衄出血不止"),SZFM(7,"四肢发麻"),XZSZ(8,"下肢水肿"),QT(9,"其它");
	
	private Integer code;
    private String name;
    
    EnumSfjlSTZZ(Integer code, String name) {
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
        for (EnumSfjlSTZZ type : EnumSfjlSTZZ.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

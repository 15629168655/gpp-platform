package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumZdfhqk {
	DHAVE(0,"未作 "),HAVE(1,"符合 "),DSURE(2,"不符合"),DKNOW(3,"诊断符合情况扩充内容"),NOTHING(9,"无对照默认为‘0");
	
	 private Integer code;
	    private String name;

	    EnumZdfhqk(Integer code, String name) {
	        this.code = code;
	        this.name = name;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public Integer getCode() {
	        return code;
	    }

	    public void setCode(Integer code) {
	        this.code = code;
	    }

	    public static Map<Integer, String> toMap() {
	        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
	        for (EnumZdfhqk type : EnumZdfhqk.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

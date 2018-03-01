package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumRybq {
	HAVE(1,"有 "),DSURE(2,"临床未确定"),DKNOW(3,"情况不明"),NOTHING(4,"无 ");
	 
	 private Integer code;
	    private String name;

	    EnumRybq(Integer code, String name) {
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
	        for (EnumRybq type : EnumRybq.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

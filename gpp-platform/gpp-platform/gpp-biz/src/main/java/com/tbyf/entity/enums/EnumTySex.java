package com.tbyf.entity.enums;
import java.util.Map;
import java.util.TreeMap;


public enum EnumTySex {
	
	    MAN(0,"通用"),WOMAN(1,"男性"),OTHER(2,"女性");

	    private Integer code;
	    private String name;

	    EnumTySex(Integer code, String name) {
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
	        for (EnumTySex type : EnumTySex.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
	}
	
	

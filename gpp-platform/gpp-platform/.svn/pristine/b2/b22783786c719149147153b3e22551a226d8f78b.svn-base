package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumHyzk {
	 WH(10,"未婚 "),YH(20,"已婚"),CH(21,"初婚"),ZH(22,"再婚 "),FH(23,"复婚  "),SO(30,"丧偶 "),LH(40,"离婚 "),OTHER(90,"未说明的婚姻状况");
	 
	 private Integer code;
	    private String name;

	    EnumHyzk(Integer code, String name) {
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
	        for (EnumHyzk type : EnumHyzk.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

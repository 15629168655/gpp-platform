package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumRylx {
	 MZRY(1,"门诊入院"),JZRY(1,"急诊入院"),QTRY(2,"其他医疗机构转入"),OTHER(9,"其他");
	 
	 private Integer code;
	    private String name;

	    EnumRylx(Integer code, String name) {
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
	        for (EnumRylx type : EnumRylx.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

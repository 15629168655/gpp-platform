package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumLxrgx {
	 PO(1,"配偶 "),Z(2,"子"),V(3,"女"),SZ(4,"孙子、孙女或外孙子、外孙女 "),FM(5,"父母  "),ZF(6,"祖父母或外祖父母 "),X(7,"兄、弟、姐、妹 "),OTHER(8,"其他");
	 
	 private Integer code;
	    private String name;

	    EnumLxrgx(Integer code, String name) {
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
	        for (EnumLxrgx type : EnumLxrgx.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

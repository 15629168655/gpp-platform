package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

public enum EnumQuesState {

		//0问卷 1提交
		SUBMIT(1,"提交"), QUES(0,"问卷");
		private Integer code;
	    private String name;
	    
	    EnumQuesState(Integer code, String name) {
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
	        for (EnumQuesState type : EnumQuesState.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

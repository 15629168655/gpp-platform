package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 任务来源
 * @author nief
 *2016-12-01
 */
public enum EnumJobSource {
	
	SELF(0,"自建"),SYSTEM(1,"系统");

	   private Integer code;
	    private String name;
	    
	    EnumJobSource(Integer code, String name) {
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
	        for (EnumJobSource type : EnumJobSource.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }


}

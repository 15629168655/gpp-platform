package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 协议内容表状态
 * @author lizk
 *2016-09-13
 */
public enum EnumStatus {

	SAVE(0,"保存"),ENABLE(1,"启用"),DISABLE(2,"停用"),DELETE(9,"删除");
		
		private Integer code;
	    private String name;
	    
	    EnumStatus(Integer code, String name) {
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
	        for (EnumStatus type : EnumStatus.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
		
		/**
		 * 删除状态不显示
		 * @return
		 */
		public static Map<Integer, String> toMapNoDELETE() {
	        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
	        for (EnumStatus type : EnumStatus.values()) {
	        	if(type.getCode()!=DELETE.getCode()){
	        		enumDataMap.put(type.getCode(), type.getName());
	        	}
	        }
	        return enumDataMap;
	    } 
}

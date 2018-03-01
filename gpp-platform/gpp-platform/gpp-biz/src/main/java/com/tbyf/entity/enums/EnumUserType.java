package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**
 * 用户类型枚举
 * @author zanxc
 * @创建日期2017年8月16日上午12:08:06
 */
public enum EnumUserType {

	//0：不限制、1：男、2：女
		RESIDENT(1,"居民"), DOCTOR(1,"医生");
		private Integer code;
	    private String name;
	    
	    EnumUserType(Integer code, String name) {
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
	        for (EnumUserType type : EnumUserType.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

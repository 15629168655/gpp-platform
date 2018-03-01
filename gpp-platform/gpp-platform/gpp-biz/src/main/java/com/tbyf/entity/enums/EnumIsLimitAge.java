package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**是否年龄限制
 * 
 * @author zanxc
 *
 */
public enum EnumIsLimitAge {

		//（1 是 0 否）
		LIMIT(1,"是"), NOTLIMIT(0,"否");
		private Integer code;
	    private String name;
	    
	    EnumIsLimitAge(Integer code, String name) {
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
	        for (EnumIsLimitAge type : EnumIsLimitAge.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }
}

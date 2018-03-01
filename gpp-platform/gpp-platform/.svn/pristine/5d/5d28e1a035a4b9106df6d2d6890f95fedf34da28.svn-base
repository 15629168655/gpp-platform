package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**是否呈阳性
 * 
 * @author zanxc
 *
 */
public enum EnumIsPositive {

		//(1是 0否)
		POSITIVE(1,"是"), NOTPOSITIVE(0,"否");
		private Integer code;
	    private String name;
	    
	    EnumIsPositive(Integer code, String name) {
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
	        for (EnumIsPositive type : EnumIsPositive.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }

}

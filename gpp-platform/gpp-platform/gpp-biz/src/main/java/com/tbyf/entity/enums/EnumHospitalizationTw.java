package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

	/**
	 * 住院证--体位
	 * Created by nf on 2016/10/10.
	 */

	public enum EnumHospitalizationTw {
		
		AUTOMATIC(0,"自动"), PROSTRATION(1,"平卧"),SEMIRECLINING(2,"半卧");
		
		private Integer code;
	    private String name;
	    
	    EnumHospitalizationTw(Integer code, String name) {
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
	        for (EnumHospitalizationTw type : EnumHospitalizationTw.values()) {
	            enumDataMap.put(type.getCode(), type.getName());
	        }
	        return enumDataMap;
	    }

}

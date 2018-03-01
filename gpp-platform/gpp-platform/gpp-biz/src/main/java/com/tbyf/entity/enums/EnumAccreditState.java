package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
* @author zanxc:
* @version 创建时间：2017年7月24日 下午3:17:50
* 授权状态
*/
public enum EnumAccreditState {

	//（1 是 0 否）
			STOP(0,"停用"), NORMAL(1,"正常");
			private Integer code;
		    private String name;
		    
		    EnumAccreditState(Integer code, String name) {
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
		        for (EnumAccreditState type : EnumAccreditState.values()) {
		            enumDataMap.put(type.getCode(), type.getName());
		        }
		        return enumDataMap;
		    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 团队成员表——状态
 * @author liwb
 *2017-08-10
 */
public enum EnumTeamMemberStatus {

	NORMAL(0,"正常"),TO_VOID(1,"退出");
	
	private Integer code;
    private String name;
    
    EnumTeamMemberStatus(Integer code, String name) {
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
        for (EnumTeamMemberStatus type : EnumTeamMemberStatus.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

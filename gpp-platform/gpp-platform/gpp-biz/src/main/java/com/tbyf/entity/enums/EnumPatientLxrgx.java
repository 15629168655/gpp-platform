package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 患者信息--与联系人关系
 * Created by nief on 2016/10/13.
 */
public enum EnumPatientLxrgx {
	
	SPOUSE(1,"配偶"),SON(2,"子"),DAUGHTER(3,"女"),GRANDCHILDREN(4,"孙子、孙女或外孙子、外孙女"),PARENTS(5,"父母"),GRANDPARENTS(6,"祖父母或外祖父母"),BROTHERS(7,"兄弟姐妹"),OTHERS(8,"其他");

    private Integer code;
    private String name;

    EnumPatientLxrgx(Integer code, String name) {
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
        for (EnumPatientLxrgx type : EnumPatientLxrgx.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }

}

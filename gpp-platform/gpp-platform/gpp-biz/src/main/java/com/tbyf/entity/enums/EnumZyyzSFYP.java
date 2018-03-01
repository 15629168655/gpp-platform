package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院医嘱——是否药品
 * Created by lizk on 2016/10/26.
 */
public enum EnumZyyzSFYP {

	YES(1,"药品"),NO(0,"非药品");

    private Integer code;
    private String name;

    EnumZyyzSFYP(Integer code, String name) {
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
        for (EnumZyyzSFYP type : EnumZyyzSFYP.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

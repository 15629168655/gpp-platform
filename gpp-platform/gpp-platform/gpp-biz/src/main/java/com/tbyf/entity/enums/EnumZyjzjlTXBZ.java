package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院就诊记录特需标志
 * Created by lizk on 2016/10/24.
 */
public enum EnumZyjzjlTXBZ {

	NO_SPECIAL(0,"非特需"),SPECIAL(1,"特需");

    private Integer code;
    private String name;

    EnumZyjzjlTXBZ(Integer code, String name) {
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
        for (EnumZyjzjlTXBZ type : EnumZyjzjlTXBZ.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * Created by yecp on 2016/6/22
 */
public enum EnumSx {
    TREAT(0,"治疗性操作"), DIAGNOSE(1,"诊断性操作"),OTHER(2,"其他");

    private Integer code;
    private String name;

    EnumSx(Integer code, String name) {
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
        for (EnumSx type : EnumSx.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

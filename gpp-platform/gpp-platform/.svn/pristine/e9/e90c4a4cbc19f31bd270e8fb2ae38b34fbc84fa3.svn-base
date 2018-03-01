package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * Created by zhangdp on 2016/6/17.
 */
public enum EnumSex {
    MAN(0,"男"),WOMAN(1,"女"),OTHER(2,"其他");

    private Integer code;
    private String name;

    EnumSex(Integer code, String name) {
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
        for (EnumSex type : EnumSex.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

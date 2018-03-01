package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院医嘱——医嘱类别
 * Created by lizk on 2016/10/26.
 */
public enum EnumZyyzYZLB {

	CQ(1,"长期（在院）"),LS(2,"临时（在院）"),CYDY(3,"出院带药"),QT(9,"其他");

    private Integer code;
    private String name;

    EnumZyyzYZLB(Integer code, String name) {
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
        for (EnumZyyzYZLB type : EnumZyyzYZLB.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 * 住院医嘱记录撤销标志
 * Created by lizk on 2016/10/26.
 */
public enum EnumZyyzjlCXBZ {

	 NORMAL(1,"正常"),REVOKE(2,"撤销");

    private Integer code;
    private String name;

    EnumZyyzjlCXBZ(Integer code, String name) {
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
        for (EnumZyyzjlCXBZ type : EnumZyyzjlCXBZ.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

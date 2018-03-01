package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 卡类型
 * Created by lizk on 2016/10/26.
 */
public enum EnumKLX {

	SBK(0,"社保卡"),YBK(1,"医保卡"),JMJKK(2,"居民健康卡"),YNK(3,"院内卡"),XNHK(5,"新农合卡"),QTK(9,"其他卡");

    private Integer code;
    private String name;

    EnumKLX(Integer code, String name) {
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
        for (EnumKLX type : EnumKLX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

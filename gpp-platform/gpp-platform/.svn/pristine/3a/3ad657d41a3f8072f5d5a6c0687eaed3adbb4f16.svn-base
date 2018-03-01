package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by zzx on 2016/6/21.
 */
public enum EnumDiseaseType
{
    HXNK(0,"传染性疾病"),XXGNK(1,"非传染性疾病");
    private Integer code;
    private String name;

    EnumDiseaseType(Integer code, String name) {
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
        for (EnumDiseaseType type : EnumDiseaseType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

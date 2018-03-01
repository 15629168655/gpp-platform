package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by zzx on 2016/7/11.
 */
public enum EnumHospitalType
{
    ZHYY(0,"综合医院"),ZKYY(1,"专科医院"),MY(2,"民营"),MZ(3,"门诊");
    private Integer code;
    private String name;

    EnumHospitalType(Integer code, String name)
    {
        this.code = code;
        this.name = name;
    }

    public Integer getCode()
    {
        return code;
    }

    public void setCode(Integer code)
    {
        this.code = code;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public static Map<Integer, String> toMap() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumHospitalType type : EnumHospitalType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

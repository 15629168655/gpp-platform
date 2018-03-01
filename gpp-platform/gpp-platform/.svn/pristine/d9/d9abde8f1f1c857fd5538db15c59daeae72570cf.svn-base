package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by zzx on 2016/6/30.
 */
public enum EnumReferralType
{
    TO_UP(0,"上转"),TO_DOWN(1,"下转");
    private Integer code;
    private String name;

    EnumReferralType(Integer code, String name)
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
        for (EnumReferralType type : EnumReferralType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

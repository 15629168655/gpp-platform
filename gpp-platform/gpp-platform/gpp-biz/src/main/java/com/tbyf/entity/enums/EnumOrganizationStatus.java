package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by zzx on 2016/6/24.
 */
public enum EnumOrganizationStatus
{
    NORMAL(0,"正常"),REVOKE(1,"注销"),OTHER(2,"其他");
    private Integer code;
    private String name;

    EnumOrganizationStatus(Integer code, String name)
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
        for (EnumOrganizationStatus type : EnumOrganizationStatus.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

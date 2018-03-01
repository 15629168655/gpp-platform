package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by ycp on 2016/7/6.
 */
public enum EnumSubmissinWay
{
	POST(0, "POST"), GET (1, "GET");
    private Integer code;
    private String name;

    EnumSubmissinWay(Integer code, String name)
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
        for (EnumSubmissinWay type : EnumSubmissinWay.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by ycp on 2016/7/6.
 */
public enum EnumRespondType
{
	JSON(0, "application/json"), XML(1, "application/xml");
    private Integer code;
    private String name;

    EnumRespondType(Integer code, String name)
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
        for (EnumRespondType type : EnumRespondType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

package com.tbyf.entity.enums;

import java.util.*;

/**
 * 全科医生团队---角色名称
 * @author zhangy
 */
public enum EnumRoleName
{
    QKTDDZ(1,"全科团队队长"),QKYS(2,"全科医师"),GGWSYS(3,"公共卫生医师");
    private Integer code;
    private String name;

    EnumRoleName(Integer code, String name)
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
        for (EnumRoleName type : EnumRoleName.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

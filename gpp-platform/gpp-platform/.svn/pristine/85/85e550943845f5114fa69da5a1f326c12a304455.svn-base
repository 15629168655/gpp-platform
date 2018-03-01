package com.tbyf.entity.enums;

import java.util.*;

/**
 * Created by ycp on 2016/7/6.
 */
public enum EnumModule
{
	USER_MANAGE(0, "用户管理"), ORG_MANAGE (1, "机构管理"), DEP_MANAGE(2,"科室管理"), YHRY_MANAGE(3,"医护人员管理");
    private Integer code;
    private String name;

    EnumModule(Integer code, String name)
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
        for (EnumModule type : EnumModule.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

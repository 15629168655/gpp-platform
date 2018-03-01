package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 验证码类型
 * @author wml
 *
 */
public enum EnumMobileCode {


	JMZC(1,"居民注册"),YH(2,"居民登陆");

    private Integer code;
    private String name;

    EnumMobileCode(Integer code, String name) {
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
        for (EnumMarriage type : EnumMarriage.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

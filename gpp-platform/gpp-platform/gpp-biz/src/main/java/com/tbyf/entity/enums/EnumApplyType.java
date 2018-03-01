package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * Created by zhangdp on 2016/6/17.
 */
public enum EnumApplyType {
    TO_CLIENT(1,"转门诊"),TO_INSPECT(2,"转检查"),TO_HOSPITALIZATION(3,"转住院"),TO_RECOVERY(4,"转康复");

    private Integer code;
    private String name;

    EnumApplyType(Integer code, String name){
        this.code = code;
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static Map<Integer, String> toMap() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumApplyType type : EnumApplyType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

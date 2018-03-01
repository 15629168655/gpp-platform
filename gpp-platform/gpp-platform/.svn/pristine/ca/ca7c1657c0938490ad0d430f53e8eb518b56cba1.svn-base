package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 医学影像检查报告--是否放射性-----0、阴 1、阳
 * Created by lizk on 2016/10/27.
 */
public enum EnumRisReportYYX {

	YIN(0,"阴"),YANG(1,"阳");

    private Integer code;
    private String name;

    EnumRisReportYYX(Integer code, String name) {
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
        for (EnumRisReportYYX type : EnumRisReportYYX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

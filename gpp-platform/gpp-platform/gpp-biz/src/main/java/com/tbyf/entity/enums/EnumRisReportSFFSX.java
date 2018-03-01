package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 医学影像检查报告--是否放射性-----1、是 0、否
 * Created by lizk on 2016/10/27.
 */
public enum EnumRisReportSFFSX {

	YES(1,"是"),NO(2,"否");

    private Integer code;
    private String name;

    EnumRisReportSFFSX(Integer code, String name) {
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
        for (EnumRisReportSFFSX type : EnumRisReportSFFSX.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

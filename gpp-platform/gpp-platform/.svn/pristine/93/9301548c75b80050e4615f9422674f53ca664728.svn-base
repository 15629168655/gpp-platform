package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 医学影像检查报告--门诊住院标志-----1门诊，2住院
 * Created by lizk on 2016/10/27.
 */
public enum EnumRisReportMZZYBZ {

	MZ(1,"门诊"),ZY(2,"住院");

    private Integer code;
    private String name;

    EnumRisReportMZZYBZ(Integer code, String name) {
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
        for (EnumRisReportMZZYBZ type : EnumRisReportMZZYBZ.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

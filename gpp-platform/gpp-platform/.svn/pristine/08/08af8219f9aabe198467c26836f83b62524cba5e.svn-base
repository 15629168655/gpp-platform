package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 医学影像检查报告--是否有影像-----1：有；2：无；3：未定
 * Created by lizk on 2016/10/27.
 */
public enum EnumRisReportSFYYY {

	YES(1,"有"),NO(2,"无"),UNDECIDED(3,"未定");

    private Integer code;
    private String name;

    EnumRisReportSFYYY(Integer code, String name) {
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
        for (EnumRisReportSFYYY type : EnumRisReportSFYYY.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

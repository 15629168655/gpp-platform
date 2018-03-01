package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 住院就诊记录医疗费用来源类别
 * Created by lizk on 2016/10/24.
 */
public enum EnumZyjzjlYLFYLYLB {
	
	CZZGJBYLBX("01","城镇职工基本医疗保险"),CZJMJBYLBX("02","城镇居民基本医疗保险"),XXNCHZYL("03","新型农村合作医疗"),PGJZ("04","贫困救助"),SYYLBX("05","商业医疗保险"),QGF("06","全公费"),QZF("07","全自费"),QTSHBX("08","其他社会保险"),QT("99","其他");

    private String code;
    private String name;

    EnumZyjzjlYLFYLYLB(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public static Map<String, String> toMap() {
        Map<String, String> enumDataMap = new TreeMap<String, String>();
        for (EnumZyjzjlYLFYLYLB type : EnumZyjzjlYLFYLYLB.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

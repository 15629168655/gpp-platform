package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 血糖检测的时间段
 * @author ad
 *时段（0：凌晨:1：早餐前:2：早餐后:3：午餐前:4：午餐后:5：晚餐前:6：晚餐后:7：睡前）
 */
public enum EnumTimeSlot {

	
	BEFOREDAWN(0,"凌晨"),BREAKFORSTBEFORE(1,"早餐前"),BREAKFORSTAFTET(2,"早餐后"),LUNCHBEFORE(4,"午餐前"),LUNCHAFTER(5,"午餐后"),DINNERBEFORE(6,"晚餐前"),DINNERAFTER(7,"晚餐后"),SLEEP(8,"睡前");
	
	 private Integer code;
	 private String name;

    EnumTimeSlot(Integer code, String name) {
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
        for (EnumTimeSlot type : EnumTimeSlot.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}

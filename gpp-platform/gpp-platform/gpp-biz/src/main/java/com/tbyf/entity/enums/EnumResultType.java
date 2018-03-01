package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**检验结果的类型
 * 
 * @author zanxc
 *
 */
public enum EnumResultType {
	//（0：数值型、1：阴阳型、2：字符型、3：计算型）
	NUM(0,"数值型"), YY(1,"阴阳型"),STR(2,"字符型"),CAL(3,"计算型");
	private Integer code;
    private String name;
    
    EnumResultType(Integer code, String name) {
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
        for (EnumResultType type : EnumResultType.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }


}

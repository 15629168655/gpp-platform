package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;


/**
 *过敏原种类：
	A、吸入式过敏原：如花粉、柳絮、粉尘、螨虫、动物皮屑、油烟、油漆、汽车尾气、煤气、香烟等。 
	B、食入式过敏原：如牛奶、鸡蛋、鱼虾、牛羊肉、海鲜、动物脂肪、异体蛋白、酒精、毒品、抗菌素、消炎药、香油、香精、葱、姜、大蒜以及一些蔬菜、水果等。 
	C、接触式过敏原：如冷空气、热空气、紫外线、辐射、化妆品、洗发水、洗洁精、染发剂、肥皂、化纤用品、塑料、金属饰品（手表、项链、戒指、耳环）、细菌、霉菌、病毒、寄生虫等。 
	D、注射式过敏原：如青霉素、链霉素、异种血清等。 
	E、自身组织抗原：精神紧张、工作压力、受微生物感染、电离辐射、烧伤等生物、理化因素影响而使结构或组成发生改变的自身组织抗原，以及由于外伤或感染而释放的自身隐蔽抗原，也可成为过敏原。
 * @author ad
 *
 */
public enum EnumAllergy {
	
	INHALED(0,"吸入式过敏源"),INTAKE(1,"食入式过敏源"),CONTACT(2,"接触式过敏源"),INJECTION(3,"注射式过敏源"),ANTIGEN(4,"自身组织抗原");
	
	private Integer code;
    private String name;
    
    EnumAllergy(Integer code, String name) {
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
        for (EnumAllergy type : EnumAllergy.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
	
}

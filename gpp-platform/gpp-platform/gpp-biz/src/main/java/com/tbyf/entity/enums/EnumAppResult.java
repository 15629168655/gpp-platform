package com.tbyf.entity.enums;
/**
 * 接口调用返回结果枚举
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整
 * 04   用户名或密码错误
 * 05   KEY验证失败
 * EnumAppResult.java
 * @author WillLe
 * @date 2016年12月13日 下午3:27:11
 */
public enum EnumAppResult {
	REQUEST_FAILED("00","请求失败"),REQUEST_SUCCEED("01","请求成功"),RETURN_NULL("02","返回空值"),
	PARAM_ABSENT("03","请求协议参数不完整或参数格式不正确"),USER_PW_INCORRECT("04","用户名或密码错误"),KEY_INCORRECT("05","KEY验证失败");

    private String code;
    private String name;

    EnumAppResult(String code, String name){
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

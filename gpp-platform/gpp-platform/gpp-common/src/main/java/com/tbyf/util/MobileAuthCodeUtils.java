package com.tbyf.util;

/**
 * 生成验证码工具类
 * @author wuml
 *
 */
public class MobileAuthCodeUtils {

    private MobileAuthCodeUtils(){
    }

    private static MobileAuthCodeUtils instance = null;

    public static MobileAuthCodeUtils getInstance() {
        if (instance == null) {
            instance = new MobileAuthCodeUtils();
        }
        return instance;
    }

    public String generateCode() {
        return (int) ((Math.random() * 9 + 1) * 100000) + "";
    }

    public String generateFourCode() {
        return (int) ((Math.random() * 9 + 1) * 1000) + "";
    }

}

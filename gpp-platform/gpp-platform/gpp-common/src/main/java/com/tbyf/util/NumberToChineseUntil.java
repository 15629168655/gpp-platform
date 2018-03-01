package com.tbyf.util;
/**
 * 将数字转化成一、二、。。。。。
 * @author ad
 *
 */
public class NumberToChineseUntil {
	public static String numberToChinese(int number) {
		String [] ad = { "0", "一", "二", "三", "四", "五", "六", "七", "八", "九","十"};
		if(number > 0 && number <= 10) {
			return ad[number];
		}
		else if(number > 10 && number < 20) {
			return ad[10] + ad[number % 10];
		}
		else {
			if(number % 10 == 0) {
				return ad[number/10] + ad[10];
			}
			else {
				return ad[number/10] + ad[number % 10];
			}
		}
	}

}


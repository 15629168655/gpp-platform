package com.tbyf.util;

public class DecimalConversion {
	/**
	 * 十六进制的字符串的
	 * @param ten
	 * @return
	 */
	public static int sixteenToTen(String Sixteen) {
		Sixteen = Sixteen.substring(1);//去掉#号
		//小写转大写
		Sixteen = Sixteen.toUpperCase();
		return Integer.valueOf(Sixteen,16);
	}
	public static String tenToSixteen(String ten) {
		return "#" + Integer.toHexString(Integer.parseInt(ten));
	}

	public static void main(String[] args) {
		System.out.println(DecimalConversion.sixteenToTen("#4986e7"));
		System.out.println(DecimalConversion.tenToSixteen("4818663"));
	}
}

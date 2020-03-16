package com.fund.util;

public class Regular {
	//必須為@的信箱
	public static final String EMAIL = "^[a-zA-Z][a-zA-Z0-9]*@[a-zA-Z0-9]+(\\.[a-zA-Z0-9]+){1,2}$" ;
	//必須為英數混和的6~12碼
	public static final String PASSWORD = "^(?=^.{6,12}$)((?=.*[0-9])(?=.*[a-z|A-Z]))^.*$";
	//第一英文字母大寫 加九碼數字
	public static final String TWID = "^[A-Z]\\d{9}$";
	//日期 會計算閏年閏月
	public static final String HB = "((^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(10|12|0?[13578])([-\\/\\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(11|0?[469])([-\\/\\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\\d{2})|([2-9]\\d{3}))([-\\/\\._])(0?2)([-\\/\\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([3579][26]00)([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][0][48])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][0][48])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][2468][048])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][2468][048])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([1][89][13579][26])([-\\/\\._])(0?2)([-\\/\\._])(29)$)|(^([2-9][0-9][13579][26])([-\\/\\._])(0?2)([-\\/\\._])(29)$))";
	//必須為09開頭 加後八碼數字
	public static final String PHONE = "^09[0-9]{8}$";
	//必須為8位數字
	public static final String STORENUMBER = "^\\d{8}$";
	//必須為數字
	public static final String STOREACCOUNT = "^[0-9]*$";
	//必須為數字
	public static final String STORETEL = "^[0-9]*$";
	//必須為中文
	public static final String CHINESE = "^[\\u4e00-\\u9fa5]*$";

}

package com.warehouse.utils;

import java.util.Calendar;

/**
 * 获取当前时间的工具类
 * 2018.5.8
 */
public class TimeUtil {

	public static String getNowerTime() {
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改   

		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int day = c.get(Calendar.DATE);
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);

		return year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	}
}

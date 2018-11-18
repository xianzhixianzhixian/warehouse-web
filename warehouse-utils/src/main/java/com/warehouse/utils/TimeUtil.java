package com.warehouse.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
	
	/**
	 * 格式化时间日期为yyyy-MM-dd hh:mm:ss
	 * @param date
	 * @return
	 */
	public static Date formatDate(Date date) {
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			return dateFormat.parse(date.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

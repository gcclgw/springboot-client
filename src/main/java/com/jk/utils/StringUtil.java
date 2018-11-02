package com.jk.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class StringUtil {

	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 传入两位大写的字母前缀
	 * @param str
	 * @return String
	 */
	public static String getTime(String str){

		//得到long类型当前时间
		long l = System.currentTimeMillis();
		//new日期对象
		Date date = new Date(l);
		//转换提日期输出格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String newTime = dateFormat.format(date);

		return str+newTime;

	}

}

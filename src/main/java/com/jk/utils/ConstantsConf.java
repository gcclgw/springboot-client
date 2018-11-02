/** 
 * <pre>项目名称:ssm-maven 
 * 文件名称:StringUuid.java 
 * 包名:com.jk.utils 
 * 创建日期:2018年8月4日下午3:56:13 
 * Copyright (c) 2018, meng412@gmail.com All Rights Reserved.</pre> 
 */   
package com.jk.utils;

/**
 * <pre>项目名称：ssm-maven   
 * 类名称：ConstantsConf    
 * 类描述：    
 * 创建人：李孟 meng_java@412.com    
 * 创建时间：2018年8月8日 下午11:55:20    
 * 修改人：李孟 meng_java@412.com  
 * 修改时间：2018年8月8日 下午11:55:20    
 * 修改备注：       
 * @version </pre>
 */
public class ConstantsConf {
	
	/**
	 * 左侧导航缓存key
	 */
	public static final String NAV_CACHE = "navCache";
	
	/**
	 * 登录验证码缓存key
	 */
	public static final	String LOGIN_CODE = "loginCode";
	
	/**
	 * 短信验证吗过期时间 单位 分钟
	 */
	public static final Integer LOGIN_CODE_TIME_OUT = 5;
	
	/**
	 * 1分钟不能重复获取锁
	 */
	public static final	String LOGIN_CODE_LOCK ="loginCodeLock";
	
	public static final	String SMS_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	
	public static final	String ACCOUNTSID = "0da9a5e47f544e3f9c08705f2553c9ea";
	
	public static final	String TEMPLATEID = "517365028";
	
	public static final	String AUTH_TOKEN = "b4d98f4c4ed24f57a7d719e9821ab202";
	
	/*public static final String SMS_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	
	public static final String ACCOUNTSID = "3ffeaf531acf4065949aba61b4194039";
	
	public static final String TEMPLATEID= "516575604";
	
	public static final String AUTH_TOKEN ="f8e2c76147cc40fbb40e048c86c58c96";*/
	
	public static final String AUTH = "admin";

	/**
	 * 新增成功
	 */
	public static final int INSERT_SUCCESS_FLAG = 1 ;

	/**
	 * 区域编码已存在
	 */
	public static final int REGION_CODE_EXISTS = 2 ;

	/**
	 * 已超出当前仓库的总面积
	 */
	public static final int EXCEEDING_WAREHOUSE_ACREAGE = 3 ;
	
}

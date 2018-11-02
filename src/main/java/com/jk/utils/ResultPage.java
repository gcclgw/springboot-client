/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:Resultpage.java 
 * 包名:com.jk.model.user 
 * 创建日期:2018年8月6日下午3:24:22 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.utils;

import java.io.Serializable;

/**
 * 
 * <pre>项目名称：NewMaven1    
 * 类名称：Resultpage    
 * 类描述：    
 * 创建人：橘子 619110620@qq.com   
 * 创建时间：2018年8月18日 下午10:01:40    
 * 修改人：橘子 619110620@qq.com  
 * 修改时间：2018年8月18日 下午10:01:40    
 * 修改备注：       
 * @version </pre>
 */
public class ResultPage implements Serializable {

	private static final long serialVersionUID = -8958649138436511794L;

	private Integer  total;
	
	private Object   rows;

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}
	
}

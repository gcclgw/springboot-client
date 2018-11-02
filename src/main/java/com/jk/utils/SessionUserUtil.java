package com.jk.utils;



import com.jk.model.user.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 获取session用户信息工具类
 * @author songxj
 *
 */
public class SessionUserUtil {

	/**
	 * 获取session用户Bean
	 * @param request
	 * @return
	 */
	public static User getUserInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User attribute = (User)session.getAttribute("userInfo");
		return attribute;
	}
	
	/**
	 * 获取session中的用户id
	 * @param request
	 * @return
	 */
	public static String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User attribute = (User)session.getAttribute("userInfo");
		return attribute == null ? "" : attribute.getUid().toString();
	}
	
}

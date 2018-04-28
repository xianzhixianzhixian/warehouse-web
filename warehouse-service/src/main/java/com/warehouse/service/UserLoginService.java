package com.warehouse.service;

import com.warehouse.bean.Userinfo;

/**
 * 用户登陆service
 * 2018.4.27
 */
public interface UserLoginService{
	
	/**
	 * 检查用户名密码是否正确，返回用户角色等级
	 * @param user
	 * @return
	 */
	public Integer checkUserGetLevel(Userinfo user);
}
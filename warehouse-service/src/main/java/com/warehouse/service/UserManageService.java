package com.warehouse.service;

import java.util.List;

import com.warehouse.bean.Userinfo;

/**
 * 用户管理service
 * 2018.5.2
 */
public interface UserManageService {

	
	/**
	 * 更改用户密码
	 * @param username
	 * @param password
	 * @return
	 */
	public Integer updatePassword(Userinfo userinfo) throws Exception;
	
	/**
	 * 检查新密码是否和旧密码相同
	 * @param userinfo
	 * @return
	 * @throws Exception
	 */
	public Boolean checkPasswdIsSameByUsername(Userinfo userinfo) throws Exception;
	
	
}

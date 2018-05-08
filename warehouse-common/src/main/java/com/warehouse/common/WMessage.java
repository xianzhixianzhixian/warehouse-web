package com.warehouse.common;

/**
 * 定义统一的消息
 * 2018.5.2
 */

public class WMessage {

	/**
	 * 操作失败
	 */
	public static String MSG_FAIL="fail";
	
	/**
	 * 操作成功
	 */
	public static String MSG_SUCCESS="success";
	
	/**
	 * 新密码与原密码相同
	 */
	public static String MSG_SAME_PASSWD="passwd_same";
	
	/**
	 * 用户名已存在
	 */
	public static String MSG_USER_EXISTS="user_exists";
	
	/**
	 * 仓库信息已存在
	 */
	public static String MSG_WAREHOUSE_EXISTS="warehouse_exists";
	
	/**
	 * 操作类型：添加
	 */
	public static String MSG_OPREATION_ADD="add";
	
	/**
	 * 操作类型：修改
	 */
	public static String MSG_OPREATION_CHANGE="change";
	
	/**
	 * 操作类型：删除
	 */
	public static String MSG_OPREATION_DELETE="delete";
	
	/**
	 * 操作类型：登陆
	 */
	public static String MSG_OPREATION_LOGIN="login";
}

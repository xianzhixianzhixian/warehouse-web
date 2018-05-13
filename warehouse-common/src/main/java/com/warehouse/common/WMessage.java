package com.warehouse.common;

import java.io.Serializable;

/**
 * 定义统一的消息
 * 2018.5.2
 */

public class WMessage implements Serializable {

	/**
	 * 操作失败
	 */
	public static final String MSG_FAIL="fail";
	
	/**
	 * 操作成功
	 */
	public static final String MSG_SUCCESS="success";
	
	/**
	 * 新密码与原密码相同
	 */
	public static final String MSG_SAME_PASSWD="passwd_same";
	
	/**
	 * 用户名已存在
	 */
	public static final String MSG_USER_EXISTS="user_exists";
	
	/**
	 * 仓库信息已存在
	 */
	public static final String MSG_WAREHOUSE_EXISTS="warehouse_exists";
	
	/**
	 * 供应商信息已存在
	 */
	public static final String MSG_SUPPILER_EXISTS="suppiler_exists";
	
	/**
	 * 物资信息已存在
	 */
	public static final String MSG_GOODS_EXISTS="goods_exists";
	
	/**
	 * 操作类型：添加
	 */
	public static final String MSG_OPREATION_ADD="添加";
	
	/**
	 * 操作类型：修改
	 */
	public static final String MSG_OPREATION_UPDATE="更新";
	
	/**
	 * 操作类型：删除
	 */
	public static final String MSG_OPREATION_DELETE="删除";
	
	/**
	 * 操作类型：登陆
	 */
	public static final String MSG_OPREATION_LOGIN="登陆";
	
	/**
	 * 操作类型：商品入库
	 */
	public static final String MSG_OPREATION_ADD_GOODS="商品入库";
	
	/**
	 * 操作类型：商品出库
	 */
	public static final String MSG_OPREATION_OUT_GOODS="商品出库";
	
	/**
	 * 更新库存信息
	 */
	public static final String MSG_OPREATION_UPDATE_GOODS = "更新库存信息";
	
	/**
	 * 操作类型：添加配置
	 */
	public static final String MSG_OPREATION_ADD_CONFIG="添加配置";
	
	/**
	 * 操作类型：更新配置
	 */
	public static final String MSG_OPREATION_UPDATE_CONFIG="更新配置";
}

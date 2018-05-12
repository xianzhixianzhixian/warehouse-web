package com.warehouse.service;

import java.util.List;

import com.warehouse.bean.Log;

/**
 * 系统操作日志service
 * 2018.5.8
 */
public interface LogService {

	/**
	 * 插入log
	 * @param log
	 */
	public Integer insertLog(Log log);
	
	/**
	 * 获取所有日志
	 * @return
	 */
	public List<Log> selectAllLog();
	
	/**
	 * 生成log实体
	 * @param operator
	 * @param operationType
	 * @param operationDetail
	 * @return
	 */
	public Log createLog(String operator,String operationType,String operationDetail);
	
	/**
	 * 根据用户名和操作类型来搜索日志
	 * @param username
	 * @param operationtype
	 * @return
	 */
	public List<Log> selectLogByUsernameAndOperationType(String username,String operationtype);
}

package com.warehouse.service;

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
	 * 生成log实体
	 * @param operator
	 * @param operationType
	 * @param operationDetail
	 * @return
	 */
	public Log createLog(String operator,String operationType,String operationDetail);
}

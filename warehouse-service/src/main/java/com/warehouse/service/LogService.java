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
}

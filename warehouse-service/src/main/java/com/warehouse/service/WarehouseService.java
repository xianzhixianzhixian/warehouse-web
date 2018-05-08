package com.warehouse.service;

import com.warehouse.bean.Warehouse;

/**
 * 仓库管理service
 * 2018.5.8
 */
public interface WarehouseService {

	/**
	 * 插入新的仓库
	 * @param warehouse
	 */
	public Integer insertWarehouse(Warehouse warehouse) throws Exception;
	
	/**
	 * 检测仓库是否已存在
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public Boolean checkWarehouseExists(String num) throws Exception;
}

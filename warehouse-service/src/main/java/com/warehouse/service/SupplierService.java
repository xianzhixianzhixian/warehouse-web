package com.warehouse.service;

import java.util.List;

import com.warehouse.bean.Supplier;

/**
 * 供应商信息service
 * 2018.5.11
 */
public interface SupplierService {
	
	/**
	 * 获得所有供应商的信息
	 * @return
	 * @throws Exception
	 */
	public List<Supplier> getAllSupplier() throws Exception;
	
	/**
	 * 添加供应商信息
	 * @param supplier
	 * @return
	 */
	public Integer addSupplier(Supplier supplier) throws Exception;
	
	/**
	 * 检查供应商信息是否存在
	 * @param suppliernum
	 * @return
	 * @throws Exception
	 */
	public Boolean checkSupplierExist(String suppliernum) throws Exception;
	
	 /**
	 * 更新供应商信息
	 * @param supplier
	 * @return
	 * @throws Exception
	 */
	public Integer updateSupplier(Supplier supplier) throws Exception;
	
	/**
	 * 根据供应商编号删除供应商信息
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public Integer deleteSupplierByNum(String num) throws Exception;
}

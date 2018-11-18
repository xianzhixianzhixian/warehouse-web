package com.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.bean.Supplier;
import com.warehouse.bean.SupplierExample;
import com.warehouse.bean.SupplierExample.Criteria;
import com.warehouse.mapper.SupplierMapper;
import com.warehouse.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierMapper supplierMapper;
	
	@Override
	public Integer addSupplier(Supplier supplier) throws Exception {
		return supplierMapper.insertSelective(supplier);
	}

	@Override
	public Boolean checkSupplierExist(String suppliernum) throws Exception {
		
		SupplierExample example=new SupplierExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(suppliernum);
		
		Long count=supplierMapper.countByExample(example);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public Integer updateSupplier(Supplier supplier) throws Exception {
		SupplierExample example=new SupplierExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(supplier.getNum());
		return supplierMapper.updateByExampleSelective(supplier, example);
	}

	@Override
	public List<Supplier> getAllSupplier() throws Exception {
		return supplierMapper.selectByExample(null);
	}

	@Override
	public Integer deleteSupplierByNum(String num) throws Exception {
		SupplierExample example=new SupplierExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(num);
		return supplierMapper.deleteByExample(example);
	}

}

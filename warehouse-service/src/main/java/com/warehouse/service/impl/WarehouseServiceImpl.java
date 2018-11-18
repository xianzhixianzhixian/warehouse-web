package com.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.bean.Warehouse;
import com.warehouse.bean.WarehouseExample;
import com.warehouse.bean.WarehouseExample.Criteria;
import com.warehouse.mapper.WarehouseMapper;
import com.warehouse.service.WarehouseService;

@Service
public class WarehouseServiceImpl implements WarehouseService {

	@Autowired
	private WarehouseMapper warehouseMapper;
	
	@Override
	public Integer insertWarehouse(Warehouse warehouse) throws Exception {
		return warehouseMapper.insertSelective(warehouse);
	}

	@Override
	public Boolean checkWarehouseExists(String num) throws Exception {
		WarehouseExample example=new WarehouseExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(num);
		Long count=warehouseMapper.countByExample(example);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Warehouse> selectAllWarehouse()  throws Exception {
		WarehouseExample example=new WarehouseExample();
		return warehouseMapper.selectByExample(example);
	}

	@Override
	public Integer updateWarehouse(Warehouse warehouse)  throws Exception {
		
		WarehouseExample example=new WarehouseExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(warehouse.getNum());
		return warehouseMapper.updateByExampleSelective(warehouse, example);
	}

}

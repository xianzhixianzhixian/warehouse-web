package com.warehouse.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.bean.Goods;
import com.warehouse.bean.Warehouse;
import com.warehouse.bean.WarehouseGoods;
import com.warehouse.bean.WarehouseGoodsExample;
import com.warehouse.bean.WarehouseGoodsExample.Criteria;
import com.warehouse.mapper.GoodsMapper;
import com.warehouse.mapper.WarehouseGoodsMapper;
import com.warehouse.mapper.WarehouseMapper;
import com.warehouse.service.ManageService;

@Service
public class ManageServiceImpl implements ManageService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private WarehouseMapper warehouseMapper;
	
	@Autowired
	private WarehouseGoodsMapper warehouseGoodsMapper;

	@Override
	public Map<String,Object> selectGoodsAndWarehouse() {
		
		List<Goods> goodslist=goodsMapper.selectByExample(null);
		List<Warehouse> warehouselist=warehouseMapper.selectByExample(null);
		Map<String, Object> map=new HashMap<>();
		map.put("goodslist", goodslist);
		map.put("warehouselist", warehouselist);
		return map;
	}

	@Override
	public Boolean checkRecordExist(WarehouseGoods record) throws Exception {
		WarehouseGoodsExample example=new WarehouseGoodsExample();
		Criteria criteria=example.createCriteria();
		criteria.andGoodsNumEqualTo(record.getGoodsNum());
		criteria.andWarehouseNumEqualTo(record.getWarehouseNum());
		Long count=warehouseGoodsMapper.countByExample(example);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public Integer insertRecord(WarehouseGoods record) throws Exception {
		return warehouseGoodsMapper.insertSelective(record);
	}

	@Override
	public Integer updateRecord(WarehouseGoods record) throws Exception {
		WarehouseGoodsExample example=new WarehouseGoodsExample();
		Criteria criteria=example.createCriteria();
		criteria.andGoodsNameEqualTo(record.getGoodsNum());
		criteria.andWarehouseNumEqualTo(record.getWarehouseNum());
		return warehouseGoodsMapper.updateByExampleSelective(record, example);
	}
}

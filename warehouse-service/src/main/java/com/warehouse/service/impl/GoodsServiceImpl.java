package com.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.bean.Goods;
import com.warehouse.bean.GoodsExample;
import com.warehouse.bean.GoodsExample.Criteria;
import com.warehouse.bean.WarehouseGoods;
import com.warehouse.bean.WarehouseGoodsExample;
import com.warehouse.mapper.GoodsMapper;
import com.warehouse.mapper.WarehouseGoodsMapper;
import com.warehouse.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public Integer addGoods(Goods goods) throws Exception {
		return goodsMapper.insertSelective(goods);
	}

	@Override
	public Integer updateGoods(Goods goods) throws Exception {
		GoodsExample example=new GoodsExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(goods.getNum());
		return goodsMapper.updateByExampleSelective(goods, example);
	}

	@Override
	public Boolean checkGoodsExists(String num) throws Exception {
		GoodsExample example=new GoodsExample();
		Criteria criteria=example.createCriteria();
		criteria.andNumEqualTo(num);
		
		Long count = goodsMapper.countByExample(example);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Goods> getAllGoods() throws Exception {
		return goodsMapper.selectByExample(null);
	}

}

package com.warehouse.service;

import java.util.List;

import com.warehouse.bean.Goods;

public interface GoodsService {

	/**
	 * 添加商品信息
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	public Integer addGoods(Goods goods) throws Exception;
	
	/**
	 * 更新商品信息
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	public Integer updateGoods(Goods goods) throws Exception;
	
	/**
	 * 检查商品是否已存在数据库中
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public Boolean checkGoodsExists(String num) throws Exception;
	
	/**
	 * 获取所有商品信息
	 * @return
	 * @throws Exception
	 */
	public List<Goods> getAllGoods() throws Exception;
}

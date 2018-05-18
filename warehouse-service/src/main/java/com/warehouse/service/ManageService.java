package com.warehouse.service;

import java.util.List;
import java.util.Map;

import com.warehouse.bean.Goods;
import com.warehouse.bean.WarehouseGoods;

/**
 * 仓库管理service
 * 2018.5.13
 */
public interface ManageService {

	/**
	 * 获取goods表中所有物资编号和warehouse表中所有仓库编号
	 * @return
	 */
	public Map<String,Object> selectGoodsAndWarehouse();
	
	/**
	 * 查找记录是否存在
	 * @param record
	 * @return
	 * @throws Exception
	 */
	public Boolean checkRecordExist(WarehouseGoods record) throws Exception;
	
	/**
	 * 插入一条记录
	 * @return
	 * @throws Exception
	 */
	public Integer insertRecord(WarehouseGoods record) throws Exception;
	
	/**
	 * 更新记录
	 * @param record
	 * @return
	 */
	public Integer updateRecord(WarehouseGoods record) throws Exception;
	
	/**
	 * 根据商品编号和仓库编号获取库存相关信息
	 * @param goodsNum
	 * @param warehouseNum
	 * @return
	 * @throws Exception
	 */
	public List<WarehouseGoods> getWarehouseGoodsNumInfo(String goodsNum,String warehouseNum) throws Exception;
	
	/**
	 * 根据搜索关键字和搜索类型查询物资数据（模糊查询或精确查询）
	 * @param words
	 * @param type
	 * @return
	 */
	public List<Goods> selectGoodsByType(String words,String type) throws Exception;
}

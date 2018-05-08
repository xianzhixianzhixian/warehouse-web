package com.warehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 仓库管理的controller
 * 2018.5.2
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Warehouse;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.WarehouseService;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController {

	@Autowired
	private WarehouseService warehouseService;
	
	@ResponseBody
	@RequestMapping(value = "/addWarehouse", method = RequestMethod.POST)
	public WResponse addWarehouse(Warehouse warehouse) throws Exception {
		WResponse response=new WResponse();
		response.setMessage(WMessage.MSG_FAIL);
		
		if(warehouseService.checkWarehouseExists(warehouse.getNum())) {
			response.setMessage(WMessage.MSG_WAREHOUSE_EXISTS);
			return response;
		}
		
		Integer num=warehouseService.insertWarehouse(warehouse);
		if(num>0) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		return response;
	}
}

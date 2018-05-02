package com.warehouse.controller;

/**
 * 仓库管理的controller
 * 2018.5.2
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Warehouse;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController {

	@ResponseBody
	@RequestMapping(value = "/addWarehouse", method = RequestMethod.POST)
	public String addWarehouse(Warehouse warehouse) throws Exception {
		
		return "fail";
	}
}

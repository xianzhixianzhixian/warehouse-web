package com.warehouse.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Log;
import com.warehouse.bean.WarehouseGoods;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.LogService;
import com.warehouse.service.ManageService;
import com.warehouse.utils.TimeUtil;

/**
 * 仓库管理controller
 * 2018.5.13
 */
@Controller
@RequestMapping("/manage")
public class ManageController {

	@Autowired
	private ManageService manageService;
	
	@Autowired
	private LogService logService;
	
	@ResponseBody
	@RequestMapping(value = "/selectGoodsAndWarehouse", method = RequestMethod.GET)
	public WResponse selectGoodsAndWarehouse() {
		WResponse response=new WResponse();
		Map<String, Object> map=manageService.selectGoodsAndWarehouse();
		
		if (map==null || map.isEmpty()) {
			response.setMessage(WMessage.MSG_FAIL);
		}else {
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		
		response.setObject(map);
		return  response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/addRecord", method = RequestMethod.POST)
	public WResponse addRecord(WarehouseGoods record,HttpSession session) throws Exception {
		WResponse response=new WResponse();
		String operation="";
		if(manageService.checkRecordExist(record)) {
			operation=WMessage.MSG_OPREATION_ADD_GOODS;
			manageService.updateRecord(record);
		}else {
			operation=WMessage.MSG_OPREATION_ADD_GOODS;
			manageService.insertRecord(record);
		}
		
		Log log = logService.createLog((String)session.getAttribute("username"),
				operation,
				"用户： "+session.getAttribute("username")
				+" 等级： "+session.getAttribute("level")
				+" 于 "+TimeUtil.getNowerTime()
				+" 操作物资入库： "+record.toString()
				+" 结果： "+ response.getMessage());
		log.setOperatorNum(record.getContainNumber().toString());
		logService.insertLog(log);
		
		return response;
	}
}

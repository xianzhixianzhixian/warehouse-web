package com.warehouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Goods;
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
	@RequestMapping(value = "/addConfig", method = RequestMethod.POST)
	public WResponse addConfig(WarehouseGoods config,HttpSession session) throws Exception {
		WResponse response=new WResponse();
		String operation="";
		Integer num=0;
		if(manageService.checkRecordExist(config)) {
			operation=WMessage.MSG_OPREATION_UPDATE_CONFIG;
			num=manageService.updateRecord(config);
		}else {
			operation=WMessage.MSG_OPREATION_ADD_CONFIG;
			num=manageService.insertRecord(config);
		}
		
		if(num>0) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}else {
			response.setMessage(WMessage.MSG_FAIL);
		}
		
		Log log = logService.createLog((String)session.getAttribute("username"),
				operation,
				"用户： "+session.getAttribute("username")
				+" 等级： "+session.getAttribute("level")
				+" 于 "+TimeUtil.getNowerTime()
				+" 配置物资仓库： "+config.toString()
				+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/addRecord", method = RequestMethod.POST)
	public WResponse addRecord(WarehouseGoods record,HttpSession session,@RequestParam("operation") String operationTpye) throws Exception {
		WResponse response=new WResponse();
		String operation="";
		Integer num=0;
		if(!manageService.checkRecordExist(record)) {
			operation=WMessage.MSG_OPREATION_ADD_GOODS;
			num=manageService.insertRecord(record);
		}else {
			if(operationTpye.equals("add")) {
				operation=WMessage.MSG_OPREATION_ADD_GOODS;
			}else if(operationTpye.equals("remove")) {
				operation=WMessage.MSG_OPREATION_OUT_GOODS;
			}
			num=manageService.updateRecord(record);
		}
		if(num>0) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}else {
			response.setMessage(WMessage.MSG_FAIL);
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
	
	@ResponseBody
	@RequestMapping(value = "/getWarehouseGoodsNumInfo", method = RequestMethod.GET)
	public WResponse getWarehouseGoodsNumInfo(String goodsNum,String warehouseNum) throws Exception {
		WResponse response=new WResponse();
		List<WarehouseGoods> list=manageService.getWarehouseGoodsNumInfo(goodsNum, warehouseNum);
		if(list.size()==0) {
			response.setMessage(WMessage.MSG_FAIL);
		}else {
			response.setMessage(WMessage.MSG_SUCCESS);
			response.setObject(list.get(0));
		}
		
		return response;
	}
	
	@RequestMapping(value = "/goodsSelect", method = RequestMethod.GET)
	public String goodsSelect(HttpSession session,Model model) throws Exception {
		if (session.getAttribute("username")==null) {
			return "error";
		}
		List<Goods> goodslist=manageService.selectGoodsByType(null, null);
		model.addAttribute("goodslist", goodslist);
		return "goodsSelect";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectGoodsByType", method = RequestMethod.GET)
	public WResponse selectGoodsByType(String words,String type) throws Exception {
		WResponse response=new WResponse();
		List<Goods> goodslist=null;
		if(words==null) {
			goodslist=manageService.selectGoodsByType(null, null);
		}else {
			goodslist=manageService.selectGoodsByType(words, type);
		}
		if(goodslist==null || goodslist.size()==0) {
			response.setMessage(WMessage.MSG_FAIL);
		}else if(goodslist!=null && goodslist.size()>0) {
			response.setMessage(WMessage.MSG_SUCCESS);
			response.setObject(goodslist);
		}
		return response;
	}
	
	@RequestMapping(value = "/selectAllWarehouseGoods", method = RequestMethod.GET)
	public String selectAllWarehouseGoods(HttpSession session,Model model) throws Exception {
		if (session.getAttribute("username")==null) {
			return "error";
		}
		
		List<WarehouseGoods> warehousegoodslist=manageService.selectAllWarehouseGoods();
		model.addAttribute("warehousegoodslist", warehousegoodslist);
		return "goodsAnalyse";
	}
	
	@RequestMapping(value = "/containWarning", method = RequestMethod.GET)
	public String containWarning(HttpSession session,Model model) throws Exception {
		if (session.getAttribute("username")==null) {
			return "error";
		}
		
		List<WarehouseGoods> warehousegoodslist=manageService.selectAllWarehouseGoods();
		model.addAttribute("warehousegoodslist", warehousegoodslist);
		return "containWarning";
	}
}

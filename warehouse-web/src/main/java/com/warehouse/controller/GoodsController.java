package com.warehouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Goods;
import com.warehouse.bean.Log;
import com.warehouse.bean.Supplier;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.GoodsService;
import com.warehouse.service.LogService;
import com.warehouse.utils.TimeUtil;

/**
 * 商品操作controller
 * 2018.5.12
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private LogService logService;
	
	@ResponseBody
	@RequestMapping(value = "/addGoods", method = RequestMethod.POST)
	public WResponse addGoods(Goods goods,HttpSession session) throws Exception {
		WResponse response=new WResponse();
		
		if(goodsService.checkGoodsExists(goods.getNum())) {
			response.setMessage(WMessage.MSG_GOODS_EXISTS);
		}else {
			goods.setOperator((String)session.getAttribute("username"));
			Integer num = goodsService.addGoods(goods);
			if(num>0) {
				response.setMessage(WMessage.MSG_SUCCESS);
			}else {
				response.setMessage(WMessage.MSG_FAIL);
			}
		}
		
		Log log = logService.createLog((String)session.getAttribute("username"),
				WMessage.MSG_OPREATION_ADD,
				"用户： "+session.getAttribute("username")
				+" 等级： "+session.getAttribute("level")
				+" 于 "+TimeUtil.getNowerTime()
				+" 添加物资信息： "
				+" 物资编号： "+goods.getNum()
				+" 物资名称： "+goods.getName()
				+" 物资配件： "+goods.getExtendsParts()
				+" 物资价格(元/件)："+goods.getPrice()
				+" 备注： "+goods.getRemark()
				+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}
	
	@RequestMapping(value = "/manageGoods", method = RequestMethod.GET)
	public String manageSupplier(HttpSession session,Model model) throws Exception {
		if(session.getAttribute("username")==null) {
			return "error";
		}
		List<Goods> goodslist = goodsService.getAllGoods();
		model.addAttribute("goodslist", goodslist);
		
		return "manageGoods";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateGoods", method = RequestMethod.POST)
	public WResponse updateSupplier(HttpSession session,Goods goods) throws Exception{
		WResponse response=new WResponse();
		goods.setOperator((String)session.getAttribute("username"));
		Integer num = goodsService.updateGoods(goods);
		if(num>0) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}else{
			response.setMessage(WMessage.MSG_FAIL);
		}
		
		Log log = logService.createLog((String)session.getAttribute("username"),
				WMessage.MSG_OPREATION_UPDATE,
				"用户： "+session.getAttribute("username")
				+" 等级： "+session.getAttribute("level")
				+" 于 "+TimeUtil.getNowerTime()
				+" 更新物资信息： "
				+" 物资编号： "+goods.getNum()
				+" 物资名称： "+goods.getName()
				+" 物资配件： "+goods.getExtendsParts()
				+" 物资价格(元/件)："+goods.getPrice()
				+" 备注： "+goods.getRemark()
				+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}
}

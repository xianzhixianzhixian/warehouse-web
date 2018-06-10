package com.warehouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Log;
import com.warehouse.bean.Supplier;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.LogService;
import com.warehouse.service.SupplierService;
import com.warehouse.utils.TimeUtil;

/**
 * 供应商信息管理controller
 * 2018.5.11
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {

	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private LogService logService;
	
	@ResponseBody
	@RequestMapping(value = "/addSupplier", method = RequestMethod.POST)
	public WResponse addSupplier(HttpSession session,Supplier supplier) throws Exception {
		WResponse response=new WResponse();
		
		if(supplierService.checkSupplierExist(supplier.getNum())) {
			response.setMessage(WMessage.MSG_SUPPILER_EXISTS);
		}else {
			supplier.setOperator((String)session.getAttribute("username"));
			Integer num = supplierService.addSupplier(supplier);
			if(num>0) {
				response.setMessage(WMessage.MSG_SUCCESS);
			}else{
				response.setMessage(WMessage.MSG_FAIL);
			}
		}
		Log log = logService.createLog((String)session.getAttribute("username"),
									WMessage.MSG_OPREATION_ADD,
									"用户： "+session.getAttribute("username")
									+" 等级： "+session.getAttribute("level")
									+" 于 "+TimeUtil.getNowerTime()
									+" 添加供应商： "
									+" 编号： "+supplier.getNum()
									+" 名称： "+supplier.getName()
									+" 对接人： "+supplier.getReceiver()
									+" 对接人联系方式： "+supplier.getReceiverPhone()
									+" 负责人： "+supplier.getResponser()
									+" 负责人联系方式： "+supplier.getResponserPhone()
									+" 备注： "+supplier.getRemark()
									+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}
	
	@RequestMapping(value = "/manageSupplier", method = RequestMethod.GET)
	public String manageSupplier(HttpSession session,Model model) throws Exception {
		if(session.getAttribute("username")==null) {
			return "error";
		}
		List<Supplier> supplierlist = supplierService.getAllSupplier();
		model.addAttribute("supplierlist", supplierlist);
		
		return "manageSupplier";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateSupplier", method = RequestMethod.POST)
	public WResponse updateSupplier(HttpSession session,Supplier supplier) throws Exception{
		WResponse response=new WResponse();
		supplier.setOperator((String)session.getAttribute("username"));
		Integer num = supplierService.updateSupplier(supplier);
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
				+" 更新供应商为： "
				+" 编号： "+supplier.getNum()
				+" 名称： "+supplier.getName()
				+" 对接人： "+supplier.getReceiver()
				+" 对接人联系方式： "+supplier.getReceiverPhone()
				+" 负责人： "+supplier.getResponser()
				+" 负责人联系方式： "+supplier.getResponserPhone()
				+" 备注： "+supplier.getRemark()
				+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteSupplier", method = RequestMethod.POST)
	public WResponse deleteSupplier(@RequestParam("num") String suppliernum,HttpSession session) throws Exception {
		WResponse response=new WResponse();
		Integer num = supplierService.deleteSupplierByNum(suppliernum);
		if(num>0) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}else{
			response.setMessage(WMessage.MSG_FAIL);
		}
		
		Log log = logService.createLog((String)session.getAttribute("username"),
				WMessage.MSG_OPREATION_DELETE,
				"用户： "+session.getAttribute("username")
				+" 等级： "+session.getAttribute("level")
				+" 于 "+TimeUtil.getNowerTime()
				+" 删除供应商： "+suppliernum
				+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		return response;
	}
}

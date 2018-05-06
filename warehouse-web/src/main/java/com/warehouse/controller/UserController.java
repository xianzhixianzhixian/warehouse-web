package com.warehouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Userinfo;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.UserManageService;
import com.warehouse.utils.MD5;

/**
 * 人员管理controller
 * 2018.5.2
 */
@Controller
@RequestMapping("/person")
public class UserController {
	
	@Autowired
	private UserManageService userManageService;
	
	@ResponseBody
	@RequestMapping(value = "/addPerson", method=RequestMethod.POST)
	public WResponse addPerson(Userinfo userinfo) throws Exception {
		WResponse response=new WResponse();
		
		if (userManageService.checkUserExists(userinfo.getUsername())) {
			response.setMessage(WMessage.MSG_USER_EXISTS);
			return response;
		}
		
		Integer num=userManageService.addPerson(userinfo);
		if(num<1) {
			response.setMessage(WMessage.MSG_FAIL);
		}else{
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/changePassword", method=RequestMethod.POST)
	public WResponse changePassword(Userinfo userinfo,HttpSession session) throws Exception {
		
		WResponse response=new WResponse();
		userinfo.setUsername((String)session.getAttribute("username"));
		userinfo.setPassword(MD5.getMD5(userinfo.getPassword()));
		if (userManageService.checkPasswdIsSameByUsername(userinfo)) {
			response.setMessage(WMessage.MSG_SAME_PASSWD);
			return response;
		}
		
		response.setMessage(WMessage.MSG_FAIL);
		Integer num=userManageService.updatePassword(userinfo);
		
		if(num>=1) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		return response;
	}
}

package com.warehouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Userinfo;
import com.warehouse.common.WResponse;
import com.warehouse.service.UserLoginService;

/**
 * 页面控制器
 */
@Controller
public class PageController {

	@Autowired
	private UserLoginService userLoginService;
	
	@ResponseBody
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	public WResponse loginCheck(Userinfo userinfo) throws Exception {
		
		Integer level=userLoginService.checkUser(userinfo);
		userinfo.setLevel(level);
		WResponse response=new WResponse();
		response.setObject(userinfo);
		response.setMessage("success");
		if(level==-1) {
			response.setMessage("fail");
		}
		return response;
	}
}

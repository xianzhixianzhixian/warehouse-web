package com.warehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Userinfo;
import com.warehouse.common.WResponse;
import com.warehouse.service.UserLoginService;

/**
 * 登陆验证controller
 * 2018.4.27
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	@ResponseBody
	@RequestMapping(value = "/userLogin" , method = RequestMethod.POST)
	public WResponse userLogin(Userinfo userinfo) throws Exception {
		
		Integer level=userLoginService.checkUserGetLevel(userinfo);
		userinfo.setLevel(level);
		userinfo.setPassword("");
		WResponse response=new WResponse();
		response.setObject(userinfo);
		response.setMessage("success");
		if(level==-1) {
			response.setMessage("fail");
		}
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userPageSelect", method = RequestMethod.GET)
	public String userPageSelect(@RequestParam("username") String username,@RequestParam("level") Integer level) throws Exception {
		
		if (level==1) {
			return "superAdminPage";
		}else if(level==2) {
			
			return "adminPage";
		}else if(level==3){
			return "userPage";
		}
		return "index";
	}
}

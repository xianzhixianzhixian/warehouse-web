package com.warehouse.controller;

/**
 * 登陆验证controller
 * 2018.4.27
 */

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.warehouse.bean.Userinfo;
import com.warehouse.common.WResponse;
import com.warehouse.service.UserLoginService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	/**
	 * 返回登陆结果信息
	 * @param userinfo
	 * @return
	 * @throws Exception
	 */
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
	
	/**
	 * 判定用户等级，并返回视图
	 * @param username
	 * @param level
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userPageSelect", method = RequestMethod.GET)
	public String userPageSelect(@RequestParam("username") String username,@RequestParam("level") Integer level,HttpSession session) 
			throws Exception {
		
		session.setAttribute("username", username);
		session.setAttribute("level", level);
		return "applicationPage";
	}
}

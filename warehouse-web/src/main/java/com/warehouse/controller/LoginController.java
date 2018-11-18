package com.warehouse.controller;

import java.util.concurrent.TimeUnit;

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
import com.warehouse.bean.Log;
import com.warehouse.bean.Userinfo;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.LogService;
import com.warehouse.service.UserLoginService;
import com.warehouse.utils.TimeUtil;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	private LogService logService;
	
	/**
	 * 返回登陆结果信息
	 * @param userinfo
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/userLogin" , method = RequestMethod.POST)
	public WResponse userLogin(Userinfo userinfo,HttpSession session) throws Exception {
		
		Integer level=userLoginService.checkUserGetLevel(userinfo);
		userinfo.setLevel(level);
		userinfo.setPassword("");
		WResponse response=new WResponse();
		response.setObject(userinfo);
		
		if(level==-1) {
			response.setMessage(WMessage.MSG_FAIL);
		}else {
			session.setAttribute("username", userinfo.getUsername());
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		
		Log log=logService.createLog(userinfo.getUsername(),
									WMessage.MSG_OPREATION_LOGIN,
									"用户： "+userinfo.getUsername()
									+"等级： "+userinfo.getLevel()
									+" 于 "+TimeUtil.getNowerTime()
									+" 登陆系统 结果： "+response.getMessage());
		logService.insertLog(log);
		
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
		
		if(session.getAttribute("username")==null) {
			return "error";
		}
		
		session.setAttribute("level", level);
		return "applicationPage";
	}
}

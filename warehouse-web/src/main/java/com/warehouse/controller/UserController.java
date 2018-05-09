package com.warehouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.bean.Log;
import com.warehouse.bean.Userinfo;
import com.warehouse.common.WMessage;
import com.warehouse.common.WResponse;
import com.warehouse.service.LogService;
import com.warehouse.service.UserManageService;
import com.warehouse.utils.MD5;
import com.warehouse.utils.TimeUtil;

/**
 * 人员管理controller
 * 2018.5.2
 */
@Controller
@RequestMapping("/person")
public class UserController {
	
	@Autowired
	private UserManageService userManageService;
	
	@Autowired
	private LogService logService;
	
	@ResponseBody
	@RequestMapping(value = "/addPerson", method=RequestMethod.POST)
	public WResponse addPerson(Userinfo userinfo,HttpSession session) throws Exception {
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
		
		Log log=logService.createLog((String)session.getAttribute("username"),
									WMessage.MSG_OPREATION_ADD,
									"用户： "+session.getAttribute("username")
									+" 等级： "+session.getAttribute("level")
									+" 于 "+TimeUtil.getNowerTime()
									+" 添加用户： "+userinfo.toString()
									+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
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
		
		Log log=logService.createLog((String)session.getAttribute("username"),
									WMessage.MSG_OPREATION_UPDATE,
									"用户： "+session.getAttribute("username")
									+" 等级： "+session.getAttribute("level")
									+" 于 "+TimeUtil.getNowerTime()
									+" 更改 "+userinfo.getUsername()+" 的密码： "
									+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}
	
	@RequestMapping(value = "/managePerson", method = RequestMethod.GET)
	public String managePerson(HttpSession session,Model model) throws Exception {
		
		if(session.getAttribute("username")==null) {
			return "error";
		}
		
		List<Userinfo> userlist=userManageService.selectAllUser();
		model.addAttribute("userlist",userlist);
		return "managePerson";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateUserinfo", method = RequestMethod.POST)
	public WResponse updateUserinfo(Userinfo userinfo,HttpSession session) throws Exception {
		WResponse response=new WResponse();
		if (userManageService.checkPasswdIsSameByUsername(userinfo)) {
			response.setMessage(WMessage.MSG_SAME_PASSWD);
			return response;
		}
		
		response.setMessage(WMessage.MSG_FAIL);
		Integer num=userManageService.updateUserinfo(userinfo);
		if(num>=1) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		
		Log log=logService.createLog((String)session.getAttribute("username"),
									WMessage.MSG_OPREATION_UPDATE,
									"用户： "+session.getAttribute("username")
									+" 等级： "+session.getAttribute("level")
									+" 于 "+TimeUtil.getNowerTime()
									+" 更新用户信息为： "+userinfo.toString()
									+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}

	@ResponseBody
	@RequestMapping(value = "/deletePerson", method = RequestMethod.POST)
	public WResponse deletePerson(String username,HttpSession session) throws Exception {
		WResponse response=new WResponse();
		response.setMessage(WMessage.MSG_FAIL);
		Integer num=userManageService.deletePersonByUsername(username);
		if(num>=1) {
			response.setMessage(WMessage.MSG_SUCCESS);
		}
		
		Log log=logService.createLog((String)session.getAttribute("username"),
									WMessage.MSG_OPREATION_DELETE,
									"用户： "+session.getAttribute("username")
									+" 等级： "+session.getAttribute("level")
									+" 于 "+TimeUtil.getNowerTime()
									+" 删除用户： "+username
									+" 结果： "+ response.getMessage());
		logService.insertLog(log);
		
		return response;
	}
}

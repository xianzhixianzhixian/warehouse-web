package com.warehouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 页面控制器
 */
@Controller
public class PageController {

	@ResponseBody
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	public String index(HttpServletRequest request,HttpSession session) {
		return "index.jsp";
	}
}

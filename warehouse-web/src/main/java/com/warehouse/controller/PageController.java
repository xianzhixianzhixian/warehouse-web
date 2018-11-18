package com.warehouse.controller;

/**
 * 控制页面跳转
 *　2018.4.27
 */

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("/")
	public String showIndex() throws Exception {
		return "index";
	}
	
	/**
	 * 打开其它页面
	 */
	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page,HttpSession session) throws Exception {
		if(session.getAttribute("username")==null) {
			return "error";
		}
		return page;
	}
}

package com.yhp.tms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("listUsers", userService.getAllUser());
		
		return "sys-manage/user-list";
	}
}

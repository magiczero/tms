package com.yhp.tms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemController {

	@RequestMapping(value="/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top() {
		return "top";
	}
	
	@RequestMapping(value = "/left", method = RequestMethod.GET)
	public String left() {
		return "left";
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping(value = "/sys/left", method = RequestMethod.GET)
	public String sysleft() {
		return "/sys-manage/left";
	}
	
}

package com.yhp.tms.controller;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.modal.User;
import com.yhp.tms.service.BoxService;
import com.yhp.tms.service.ProjectService;
import com.yhp.tms.service.UserService;

@Controller
public class SystemController {
	
	@Resource
	private ProjectService projectService;
	@Resource
	private UserService userService;
	@Resource
	private BoxService boxService;

	@RequestMapping(value="/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top() {
		return "top";
	}
	
	@RequestMapping(value = "/left", method = RequestMethod.GET)
	public String left(Model model) {
		UserDetails currentUser = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean isRoleAdmin = false;
		for(GrantedAuthority ga : currentUser.getAuthorities()) {
			if(ga.getAuthority().equals("ROLE_ADMIN")) {
				isRoleAdmin = true;
				break;
			}
		}
		//String username = currentUser.getUsername();
		
		//if("admin".equals(username)) {
		if(isRoleAdmin) {
			model.addAttribute("boxList", boxService.getAllBox());
		} else {
			model.addAttribute("boxList", boxService.getAllBox());
			User user = userService.getUserByUsername(currentUser.getUsername());
			model.addAttribute("projectList", projectService.getAllProjectByUser(user));
		}
		return "left";
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String error404() {
		return "404";
	}
	
	@RequestMapping(value = "/tools", method = RequestMethod.GET)
	public String tools() {
		return "tools";
	}
	
	@RequestMapping(value = "/sys/left", method = RequestMethod.GET)
	public String sysleft() {
		return "/sys-manage/left";
	}
	
}

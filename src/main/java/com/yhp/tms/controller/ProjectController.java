package com.yhp.tms.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.modal.Project;
import com.yhp.tms.service.BoxService;
import com.yhp.tms.service.ProjectService;
import com.yhp.tms.service.UserService;

@Controller
@RequestMapping(value="/project")
public class ProjectController {

	@Resource
	private ProjectService projectService;
	@Resource
	private BoxService boxService;
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/init-add",method = RequestMethod.GET)
	public String initAdd(Model model) {
		model.addAttribute("project", new Project());
		//获取box列表
		model.addAttribute("boxList", boxService.getAllBox());
		
		return "project/project-add";
	}
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String list(Model model) {
		UserDetails currentUser = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean isRoleAdmin = false;
		for(GrantedAuthority ga : currentUser.getAuthorities()) {
			if(ga.getAuthority().equals("ROLE_ADMIN")) {
				isRoleAdmin = true;
				break;
			}
		}
		
		if(isRoleAdmin) {
			model.addAttribute("projectList", projectService.getProjectAll());
		} else {
			model.addAttribute("projectList", projectService.getAllProjectByUser(userService.getUserByUsername(currentUser.getUsername())));
		}
		
		return "project/project-list";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute Project project,BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("project", new Project());
			//获取box列表
			model.addAttribute("boxList", boxService.getAllBox());
			
			return "project/project-add";
		}
		
		projectService.saveProject(project);
		
		return "redirect:/project/list/";
	}
}

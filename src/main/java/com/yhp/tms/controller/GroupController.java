package com.yhp.tms.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.modal.Group;
import com.yhp.tms.service.GroupService;

@Controller
@RequestMapping(value="/group")
public class GroupController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Resource
	private GroupService groupService;
	
	@RequestMapping(value="/main",method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("进入部门管理");
		
		model.addAttribute("groupList", groupService.getAllTopLevelGroup());
		model.addAttribute("group", new Group());
		
		return "sys-manage/group-main";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute Group group, BindingResult result, Model model) throws BindException {
		logger.info("保存部门");
		if(result.hasErrors()) {
			throw new BindException(result);
		}
		
		groupService.saveGroup(group);
		
		return "redirect:/group/main/";
	}
}

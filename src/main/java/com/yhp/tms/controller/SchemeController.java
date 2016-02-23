package com.yhp.tms.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.modal.Project;
import com.yhp.tms.modal.Scheme;
import com.yhp.tms.service.ProjectService;
import com.yhp.tms.service.SchemeService;

@Controller
@RequestMapping(value="/scheme")
public class SchemeController {

	private static final Logger logger = LoggerFactory.getLogger(SchemeController.class);
	
	@Resource
	private SchemeService schemeService;
	@Resource
	private ProjectService projectService;
	
	@RequestMapping(value="/list/{projectid}",method = RequestMethod.GET)
	public String list(@PathVariable() int projectid,Model model) throws Exception {
		Project project = projectService.getById(projectid);
		if(project == null) throw new Exception("参数错误");
		model.addAttribute("project", project);
		model.addAttribute("schemeList", schemeService.getAllByProject(project));
		
		return "scheme/scheme-list";
	}
	
	@RequestMapping(value="/add/{projectid}",method = RequestMethod.GET)
	public String add(@PathVariable() int projectid,Model model) throws Exception {
		Project project = projectService.getById(projectid);
		if(project == null) throw new Exception("参数错误");
		
		model.addAttribute("project", project);
		model.addAttribute("scheme", new Scheme());
		return "scheme/scheme-add";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.GET)
	public String save(@PathVariable() int projectid,Model model) throws Exception {
		logger.info("保存 Scheme");
		return "redirect:/scheme/list/5";
	}
}

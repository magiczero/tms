package com.yhp.tms.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.modal.Assessment;
import com.yhp.tms.modal.Project;
import com.yhp.tms.service.AssessmentService;
import com.yhp.tms.service.ProjectService;

@Controller
@RequestMapping(value="/assessment")
public class AssessmentController {

	private static final Logger logger = LoggerFactory.getLogger(AssessmentController.class);
	
	@Resource
	private AssessmentService assessService;
	@Resource
	private ProjectService projectService;
	
	@RequestMapping(value="/list/{projectid}",method = RequestMethod.GET)
	public String list(@PathVariable() int projectid,Model model) {
		logger.info("进入可靠性评估列表");
		Project project = projectService.getById(projectid);
		
		model.addAttribute("project", project);
		model.addAttribute("assessList", new ArrayList<>(project.getAssessments()));
		
		return "assessment/assess-list";
	}
	
	@RequestMapping(value="/init-add/{projectid}",method = RequestMethod.GET)
	public String initAdd(@PathVariable() int projectid,Model model) {
		Project project = projectService.getById(projectid);
		
		model.addAttribute("project", project);
		model.addAttribute("assessment", new Assessment());
		
		return "assessment/assess-add";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute Assessment assessment,BindingResult result, Model model) {
		logger.info("保存可靠性评估");
		if(result.hasErrors()) {
			Project project = projectService.getById(assessment.getProject().getId());
			
			model.addAttribute("project", project);
			model.addAttribute("assessment", new Assessment());
			
			return "assessment/assess-add";
		}
		
		assessService.save(assessment);
		
		return "redirect:/assessment/list/"+assessment.getProject().getId();
	}
	
	@RequestMapping(value="/edit/{assessid}",method = RequestMethod.GET)
	public String initEdit(@PathVariable() int assessid,Model model) {
		Assessment assess = assessService.getById(assessid);
		
		model.addAttribute("project", assess.getProject());
		model.addAttribute("assessment", assess);
		
		return "assessment/assess-add";
	}
	
	@RequestMapping(value="/del/{assessid}",method = RequestMethod.GET)
	public String deleteById(@PathVariable() int assessid,Model model) {
		logger.info("删除可靠性评估，id：" + assessid);
		Assessment assess = assessService.getById(assessid);
		
		assessService.delete(assess);
		
		return "redirect:/assessment/list/"+assess.getProject().getId();
	}
}

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

import com.yhp.tms.modal.Project;
import com.yhp.tms.modal.TestData;
import com.yhp.tms.service.ProjectService;
import com.yhp.tms.service.TestDataService;

@Controller
@RequestMapping(value="/testdata")
public class TestDataController {

	private static final Logger logger = LoggerFactory.getLogger(TestDataController.class);
	
	@Resource
	private TestDataService dataService;
	@Resource
	private ProjectService projectService;
	
//	@InitBinder  
//	protected void initBinder(HttpServletRequest request,  
//	                              ServletRequestDataBinder binder) throws Exception {  
//	    //对于需要转换为Date类型的属性，使用DateEditor进行处理  
//	    binder.registerCustomEditor(Date.class, new DateEditor());  
//	}  
	
	@RequestMapping(value="/list/{projectid}",method = RequestMethod.GET)
	public String list(@PathVariable() int projectid,Model model) {
		logger.info("进入试验数据列表");
		Project project = projectService.getById(projectid);
		
		model.addAttribute("project", project);
		model.addAttribute("dataList", new ArrayList<TestData>(project.getDatas()));
		
		return "testdata/list";
	}
	
	@RequestMapping(value="/init-add/{projectid}",method = RequestMethod.GET)
	public String initAdd(@PathVariable() int projectid,Model model) {
		logger.info("初始化试验数据添加页面");
		Project project = projectService.getById(projectid);
		
		model.addAttribute("project", project);
		model.addAttribute("testdata", new TestData());
		return "testdata/add";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute TestData testdata,BindingResult result, Model model) {
		logger.info("保存试验数据");
		
		if(result.hasErrors()) {
			Project project = projectService.getById(testdata.getProject().getId());
			
			model.addAttribute("project", project);
			model.addAttribute("testdata", new TestData());
			return "testdata/add";
		}
		
		dataService.saveTestdata(testdata);
		return "redirect:/testdata/list/"+testdata.getProject().getId();
	}
	
	@RequestMapping(value="/edit/{testdataid}",method = RequestMethod.GET)
	public String initEdit(@PathVariable() int testdataid,Model model) {
		logger.info("初始化试验数据添加页面");
		TestData testdata = dataService.getById(testdataid);
		
		model.addAttribute("project", testdata.getProject());
		model.addAttribute("testdata", testdata);
		return "testdata/add";
	}
	
	@RequestMapping(value="/del/{testdataid}",method = RequestMethod.GET)
	public String deleteById(@PathVariable() int testdataid,Model model) {
		TestData testdata = dataService.getById(testdataid);
		
		dataService.delete(testdata);
		
		return "redirect:/testdata/list/"+testdata.getProject().getId();
	}
}

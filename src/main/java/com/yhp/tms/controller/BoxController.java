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

import com.yhp.tms.modal.Box;
import com.yhp.tms.service.BoxService;

@Controller
@RequestMapping(value="/box")
public class BoxController {

	private static final Logger logger = LoggerFactory.getLogger(BoxController.class);
	
	@Resource
	private BoxService boxService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("进入box列表");
		
		model.addAttribute("boxList",boxService.getAllBox());
		
		return "sys-manage/box-list";
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("box", new Box());
		return "sys-manage/box-add";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute Box box, BindingResult result,Model model) throws BindException {
		logger.info("保存部门");
		if(result.hasErrors()) {
			throw new BindException(result);
		}
		
		boxService.saveBox(box);
		
		return "redirect:/box/list/";
	}
}

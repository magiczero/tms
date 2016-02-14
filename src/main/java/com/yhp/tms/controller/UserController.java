package com.yhp.tms.controller;

import java.beans.PropertyEditorSupport;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yhp.tms.modal.User;
import com.yhp.tms.service.GroupService;
import com.yhp.tms.service.UserService;
import com.yhp.utils.MD5Tools;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Resource
	private UserService userService;
	@Resource
	private GroupService groupService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
   		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
   			@Override
   			public void setAsText(String text) {
   				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
   			}
   			@Override
   			public String getAsText() {
   				Object value = getValue();
   				return value != null ? value.toString() : "";
   			}
   		});
	}
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("listUsers", userService.getAllUser());
		
		return "sys-manage/user-list";
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String initSave(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("groupList", groupService.getAllTopLevelGroup());
		
		return "sys-manage/user-add";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute User user, BindingResult result, Model model) throws BindException {
		logger.info("保存用户方法，save user method");
		if(result.hasErrors()) {
			//throw new BindException(result);
			model.addAttribute("user", new User());
			model.addAttribute("groupList", groupService.getAllGroup());
			
			return "sys-manage/user-add";
		}
		//重置密码
		String md5password = MD5Tools.getMd5(user.getPassword(), user.getUsername());
		user.setPassword(md5password);
		
		userService.saveUser(user);
		
		return "redirect:/user/list/";
	}
}

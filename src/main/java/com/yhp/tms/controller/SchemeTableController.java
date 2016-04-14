package com.yhp.tms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yhp.tms.modal.SchemeTable;
import com.yhp.tms.service.SchemeTableService;

@Controller
@RequestMapping(value="/scheme-table")
public class SchemeTableController {

	@Resource
	private SchemeTableService schTableService;
	
	@RequestMapping(value="/query-scheme/{typeid}",method = RequestMethod.GET)
	public String list(@PathVariable() int typeid,Model model) throws Exception {
		
		if(typeid !=12 && typeid!=31 && typeid!=32 && typeid!=33) throw new Exception("输入的参数不正确");
		
		model.addAttribute("schemeTableList", schTableService.getAllByTypeid(typeid));
		if(typeid == 12)
			return "scheme-table/query12";
		else if (typeid == 31)
			model.addAttribute("subtype", 10);
		else if (typeid == 32)
			model.addAttribute("subtype", 20);
		else if (typeid == 33)
			model.addAttribute("subtype", 30);
		
		return "scheme-table/query345";
	}
	
	@RequestMapping(value="/queryDingshuScheme",method = RequestMethod.GET)
	public String viewDingsh() {
		
		return "scheme-table/dingshu";
	}
	
	@RequestMapping(value="/queryXuguanScheme",method = RequestMethod.GET)
	public String viewXuguan() {
		
		return "scheme-table/xuguan";
	}
	
	@RequestMapping(value = "/zhishu-dingshi/{product}/{use}", method = RequestMethod.GET)
	@ResponseBody
	public List<SchemeTable> zhishudingshi(@PathVariable() int product,@PathVariable() int use) {
		//Map<String, Object> map = new HashMap<>();
		
		List<SchemeTable> list = schTableService.getListByProductAndUse(product, use);
		
		return list;
		//return map;
	}
	
	@RequestMapping(value = "/zhishu-dingshu/{product}/{use}/{ratio}/end", method = RequestMethod.GET)
	@ResponseBody
	public List<SchemeTable> zhishudingshu(@PathVariable() double product,@PathVariable() double use,@PathVariable() double ratio) {
		
		return schTableService.getList(6, product, use, ratio, null);
	}
	
	
}

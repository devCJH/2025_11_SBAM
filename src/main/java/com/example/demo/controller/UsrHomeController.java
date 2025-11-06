package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@GetMapping("/usr/home/ajaxSample1")
	@ResponseBody
	public String ajaxSample1() {
		return "testasdfasdsadasdad";
	}
	
	@GetMapping("/usr/home/ajaxSample2")
	@ResponseBody
	public Map<String, Object> ajaxSample2(String t1, int t2) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("t1", t1);
		map.put("t2", t2);
		
		return map;
	}
}

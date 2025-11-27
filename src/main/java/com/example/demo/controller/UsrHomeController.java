package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.util.Util;

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
	
	@GetMapping("/usr/home/apiTest1")
	public String apiTest1() {
		return "usr/home/apiTest1";
	}
	
	@GetMapping("/usr/home/apiTest2")
	public String apiTest2() {
		return "usr/home/apiTest2";
	}
	
	@GetMapping("/usr/home/checkboxSubmit")
	@ResponseBody
	public String checkboxSubmit(@RequestParam(name = "chk", required = false) List<String> list) {
		
		if (list == null) {
			return Util.jsReplace("체크박스 미선택", "/");
		}
		
		for (String value : list) {
			System.out.println("checkboxValue : " + value);
		}
		
		return Util.jsReplace("전송된 체크박스 값 확인", "/");
	}
	
	@PostMapping("/usr/home/ajaxCheckbox")
	@ResponseBody
	public List<Integer> ajaxCheckbox(@RequestParam List<Integer> chkList) {
		
		for (Integer i : chkList) {
			System.out.println(i);
		}
		
		return chkList;
	}
}

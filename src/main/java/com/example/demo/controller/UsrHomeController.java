package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dto.ResultData;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	public String showMain(HttpServletRequest requset) {
		
		HttpSession session = requset.getSession();
		
		session.setAttribute("a", 10);
		session.setAttribute("b", "안녕");
		session.setAttribute("c", new ResultData<>("아무개", "아무개2"));
		
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}

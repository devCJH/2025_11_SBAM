package com.example.demo.dto;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Req {
	
	@Getter
	private LoginedMember loginedMember;
	
	private HttpServletResponse resp;
	private HttpSession session;
	
	public Req(HttpServletRequest request, HttpServletResponse response) {
		
		this.resp = response;
		
		this.session = request.getSession();
		
		this.loginedMember = (LoginedMember) this.session.getAttribute("loginedMember"); 

		if (this.loginedMember == null) {
			this.loginedMember = new LoginedMember();
		}
		
		request.setAttribute("req", this);
	}
	
	public void jsPrintReplace(String msg, String uri) {
		
		this.resp.setContentType("text/html; charset=UTF-8;");
		
		try {
			this.resp.getWriter().append(Util.jsReplace(msg, uri));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void login(LoginedMember loginedMember) {
		this.session.setAttribute("loginedMember", loginedMember);
	}

	public void logout() {
		this.session.invalidate();
	}

	public void init() {
	}
}
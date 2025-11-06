package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Member;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	
	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/usr/member/join")
	public String join() {
		return "usr/member/join";
	}
	
	@PostMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String loginPwChk, String name) {

		if (loginId.trim().length() == 0) {
			return Util.jsReplace("아이디를 입력해주세요", "hb");
		}
		
		Member member = this.memberService.getMemberByLoginId(loginId);
		
		if (member != null) {
			return Util.jsReplace(String.format("[ %s ]은(는) 이미 사용중인 아이디입니다", loginId), "hb");
		}
		
		if (loginPw.trim().length() == 0) {
			return Util.jsReplace("비밀번호를 입력해주세요", "hb");
		}
		
		if (!loginPw.equals(loginPwChk)) {
			return Util.jsReplace("비밀번호가 일치하지 않습니다", "hb");
		}
		
		if (name.trim().length() == 0) {
			return Util.jsReplace("이름을 입력해주세요", "hb");
		}
		
		this.memberService.joinMember(loginId, loginPw, name);
		
		return Util.jsReplace(String.format("%s님의 가입이 완료되었습니다", loginId), "/");
	}
}

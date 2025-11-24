package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Reply;
import com.example.demo.dto.Req;
import com.example.demo.service.ReplyService;

@Controller
public class UsrReplyController {

	private ReplyService replyService;
	private Req req;

	public UsrReplyController(ReplyService replyService, Req req) {
		this.replyService = replyService;
		this.req = req;
	}
	
	@GetMapping("/usr/reply/list")
	@ResponseBody
	public List<Reply> list(String relTypeCode, int relId) {
		return this.replyService.getReplies(relTypeCode, relId);
	}
	
	@PostMapping("/usr/reply/write")
	@ResponseBody
	public void write(String relTypeCode, int relId, String content) {
		this.replyService.writeReply(this.req.getLoginedMember().getId(), relTypeCode, relId, content);
	}
	
}

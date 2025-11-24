package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;
import com.example.demo.dto.Reply;

@Service
public class ReplyService {

	private ReplyDao replyDao;
	
	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	
	public List<Reply> getReplies(String relTypeCode, int relId) {
		return this.replyDao.getReplies(relTypeCode, relId);
	}

	public void writeReply(int memberId, String relTypeCode, int relId, String content) {
		this.replyDao.writeReply(memberId, relTypeCode, relId, content);
	}

	public int getLastInsertId() {
		return this.replyDao.getLastInsertId();
	}

	public Reply getReply(int id) {
		return this.replyDao.getReply(id);
	}

	public void modifyReply(int id, String content) {
		this.replyDao.modifyReply(id, content);
	}
	
	public void deleteReply(int id) {
		this.replyDao.deleteReply(id);
	}
}

package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.LikePointDao;
import com.example.demo.dto.LikePoint;

@Service
public class LikePointService {

	private LikePointDao likePointDao;
	
	public LikePointService(LikePointDao likePointDao) {
		this.likePointDao = likePointDao;
	}

	public int getLikePointCnt(String relTypeCode, int relId) {
		return this.likePointDao.getLikePointCnt(relTypeCode, relId);
	}

	public void deleteLikePoint(int memberId, String relTypeCode, int relId) {
		this.likePointDao.deleteLikePoint(memberId, relTypeCode, relId);
	}

	public void insertLikePoint(int memberId, String relTypeCode, int relId) {
		this.likePointDao.insertLikePoint(memberId, relTypeCode, relId);
	}

	public LikePoint getLikePoint(int memberId, String relTypeCode, int relId) {
		return this.likePointDao.getLikePoint(memberId, relTypeCode, relId);
	}
	
}

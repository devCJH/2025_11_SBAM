package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

@Service
public class ArticleService {

	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public void writeArticle(String title, String content, int loginedMemberId, int boardId) {
		this.articleDao.writeArticle(title, content, loginedMemberId, boardId);
	}

	public List<Article> showList(int boardId, int limitFrom, int itemsInAPage) {
		return this.articleDao.showList(boardId, limitFrom, itemsInAPage);
	}

	public Article getArticleById(int id) {
		return this.articleDao.getArticleById(id);
	}

	public void modifyArticle(int id, String title, String content) {
		this.articleDao.modifyArticle(id, title, content);
	}

	public void deleteArticle(int id) {
		this.articleDao.deleteArticle(id);
	}

	public int getLastInsertId() {
		return this.articleDao.getLastInsertId();
	}

	public int getArticlesCnt(int boardId) {
		return this.articleDao.getArticlesCnt(boardId);
	}
}

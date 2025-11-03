package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.example.demo.dto.Article;

@Component
public class ArticleDao {
	private int lastArticleId;
	private List<Article> articles;
	
	public ArticleDao() {
		this.lastArticleId = 0;
		this.articles = new ArrayList<>();
	}

	public void writeArticle(String title, String content) {
		this.articles.add(new Article(++lastArticleId, title, content));
	}

	public List<Article> showList() {
		return this.articles;
	}
	
}

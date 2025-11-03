package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;
	
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@GetMapping("/usr/article/write")
	@ResponseBody
	public String write(String title, String content) {
		
		this.articleService.writeArticle(title, content);
		
		return "글 작성 완료";
	}
	
	@GetMapping("/usr/article/list")
	@ResponseBody
	public List<Article> list() {
		return this.articleService.showList();
	}
	
}

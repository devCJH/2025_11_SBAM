package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.Req;
import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.util.Util;

@Controller
public class UsrArticleController {

	private ArticleService articleService;
	private BoardService boardService;
	private Req req;

	public UsrArticleController(ArticleService articleService, BoardService boardService, Req req) {
		this.articleService = articleService;
		this.boardService = boardService;
		this.req = req;
	}

	@GetMapping("/usr/article/write")
	public String write(Model model, int boardId) {

		model.addAttribute("boardId", boardId);

		return "usr/article/write";
	}

	@PostMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(String title, String content, int boardId) {

		this.articleService.writeArticle(title, content, this.req.getLoginedMember().getId(), boardId);

		int id = this.articleService.getLastInsertId();

		return Util.jsReplace(String.format("%d번 게시물이 작성되었습니다", id), String.format("detail?id=%d", id));
	}

	@GetMapping("/usr/article/list")
	public String list(Model model, int boardId, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "") String searchKeyword, String searchType) {

		int itemsInAPage = 10;

		int limitFrom = (cPage - 1) * itemsInAPage;

		int articlesCnt = this.articleService.getArticlesCnt(boardId, searchType, searchKeyword.trim());

		int totalPagesCnt = (int) Math.ceil(articlesCnt / (double) itemsInAPage);

		int begin = ((cPage - 1) / 10) * 10 + 1;
		int end = (((cPage - 1) / 10) + 1) * 10;

		if (end > totalPagesCnt) {
			end = totalPagesCnt;
		}

		List<Article> articles = this.articleService.showList(boardId, limitFrom, itemsInAPage, searchType, searchKeyword.trim());
		String boardName = this.boardService.getBoardNameById(boardId);

		model.addAttribute("articles", articles);
		model.addAttribute("boardName", boardName);
		model.addAttribute("totalPagesCnt", totalPagesCnt);
		model.addAttribute("articlesCnt", articlesCnt);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("cPage", cPage);

		return "usr/article/list";
	}

	@GetMapping("/usr/article/detail")
	public String detail(Model model, int id) {

		Article article = this.articleService.getArticleById(id);
		
		model.addAttribute("article", article);

		return "usr/article/detail";
	}

	@GetMapping("/usr/article/modify")
	public String modify(Model model, int id) {

		Article article = this.articleService.getArticleById(id);

		model.addAttribute("article", article);

		return "usr/article/modify";
	}

	@PostMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String content) {

		this.articleService.modifyArticle(id, title, content);

		return Util.jsReplace(String.format("%d번 게시물의 수정이 완료되었습니다", id), String.format("detail?id=%d", id));
	}

	@GetMapping("/usr/article/delete")
	@ResponseBody
	public String delete(int id, int boardId) {

		this.articleService.deleteArticle(id);

		return Util.jsReplace(String.format("%d번 게시물이 삭제되었습니다", id), String.format("list?boardId=%d", boardId));
	}

}

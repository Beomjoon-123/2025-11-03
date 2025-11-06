package com.example.demo.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String write() {
		return "usr/article/write";
	}

	@PostMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(String title, String content) {

		this.articleService.writeArticle(title, content);

		int id = this.articleService.getLastInsertedId();

		return String.format("<script>alert('작성 완료'); location.replace('detail?id=%d');</script>", id);
	}

	@GetMapping("/usr/article/list")
	public String list(Model model) {

		List<Article> articles = this.articleService.showList();

		model.addAttribute("articles", articles);

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

		return String.format("<script>alert('수정 완료'); location.replace('detail?id=%d');</script>", id);
	}

	@GetMapping("/usr/article/delete")
	@ResponseBody
	public String delete(int id) {

		this.articleService.deleteArticle(id);

		return String.format("<script>alert('삭제 완료'); location.replace('list');</script>");
	}

}
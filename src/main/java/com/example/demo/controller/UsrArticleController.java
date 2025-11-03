package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.dao.ArticleDao;

@Controller
public class UsrArticleController {

	private ArticleDao articleDao;

	public UsrArticleController(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	@GetMapping("/usr/article/write")
	@ResponseBody
	public String write(String title, String content) {
		
		this.articleDao.writeArticle(title, content);
		
		return "done";
	}

}

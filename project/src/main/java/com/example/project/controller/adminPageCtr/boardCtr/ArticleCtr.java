package com.example.project.controller.adminPageCtr.boardCtr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.service.adminPageSrv.boardSrv.ArticleSrv;

@Controller
@RequestMapping("/article")
public class ArticleCtr {

	@Autowired
	ArticleSrv articleSrv;
	
	@RequestMapping("/article_list")
	public String getArticleList() {
		return "adminPage/board/articleList";
	}
	
}

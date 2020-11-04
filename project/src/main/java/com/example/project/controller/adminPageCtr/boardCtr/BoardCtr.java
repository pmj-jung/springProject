package com.example.project.controller.adminPageCtr.boardCtr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.BoardVO;
import com.example.project.service.adminPageSrv.boardSrv.BoardSrv;

@Controller
@RequestMapping("/board")
public class BoardCtr {
	
	@Autowired
	BoardSrv boardSrv;
	
	@RequestMapping("/boardList")
	public ModelAndView getBoardList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", boardSrv.getBoardList());
		mav.setViewName("adminPage/board/boardList");
		return mav;
	}
	
	@RequestMapping("/board_create")
	@ResponseBody
	public String setBoard(@ModelAttribute BoardVO bvo) {
		boardSrv.setBoard(bvo);
		boardSrv.createArticleTbl(bvo.getBoardCode());
		boardSrv.createCommentTbl(bvo.getBoardCode());
		return "success";
	}
	
	@RequestMapping("/board_check")
	@ResponseBody
	public String getBoardChk(@RequestParam String boardCode) {
		String msg;
		int result = boardSrv.getBoardChk(boardCode);
		if( result > 0 ) {
			msg = "failure";
		}else {
			msg = "success";
		}
		return msg;
	}
	
	@RequestMapping("/board_delete")
	@ResponseBody
	public String setBoardDelete(@RequestParam String boardCode) {
		/* 게시판 생성의 역순 = commentTbl > articleTbl > boardTbl */
		boardSrv.dropCommentTbl(boardCode);
		boardSrv.dropArticleTbl(boardCode);
		boardSrv.setBoardDelete(boardCode);
		return "success";
	}
}

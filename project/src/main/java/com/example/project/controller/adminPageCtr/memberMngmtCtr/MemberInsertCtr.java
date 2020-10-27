package com.example.project.controller.adminPageCtr.memberMngmtCtr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/memberInsert")
public class MemberInsertCtr {
	
	//사용자 등록 페이지
	@RequestMapping("")
	public String getMemInsert() {
		return "adminPage/memberMngmt/memberInsert";
	}
}

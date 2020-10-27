package com.example.project.controller.adminPageCtr.memberMngmtCtr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/memberApplicant")
public class MemberApplicantCtr {
	
	// 사용자 신청 목록 페이지
	@RequestMapping("")
	public String getMemApplicant() {
		return "adminPage/memberMngmt/memberApplicant";
	}
}

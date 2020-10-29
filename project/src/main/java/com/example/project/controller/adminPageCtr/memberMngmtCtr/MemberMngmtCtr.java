package com.example.project.controller.adminPageCtr.memberMngmtCtr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.MemberVO;
import com.example.project.service.adminPageSrv.memberMngmtSrv.MemberMngmtSrv;

@Controller
public class MemberMngmtCtr {

	@Autowired
	MemberMngmtSrv memMngmtSrv;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// '사용자 신청 목록' 페이지 & '미승인 회원' 리스트 불러오기
	@RequestMapping("/memberApplicant")
	public ModelAndView getMemApplicant(
			@RequestParam(defaultValue = "mem_id") String searchOpt, 
			@RequestParam(defaultValue = "") String words
			) {
		
		ModelAndView mav = new ModelAndView();
		List<MemberVO> list = memMngmtSrv.getMemApplicant(searchOpt,words);
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		/* 미승인 회원 수 */
		int count = memMngmtSrv.getApplicantCount(searchOpt,words);
		mav.addObject("count", count);
		/* 미승인 회원 수 END */

		mav.setViewName("adminPage/memberMngmt/memberApplicant");
		return mav;
	}
	
	// 회원 승인 하기
	@RequestMapping(value = "/changeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public String changeConfirm(@RequestParam int num) {
		memMngmtSrv.changeConfirm(num);
		return "success";
	}
	
	// <DB->page>사용자 등록 페이지에 현재세션의 사용자정보 띄우기
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getMemOne(HttpSession session) {

		String sessionNum = (String) session.getAttribute("memNum");

		ModelAndView mav = new ModelAndView();
		MemberVO memOne = memMngmtSrv.getMemOne(sessionNum);
		mav.addObject("memOne", memOne);
		mav.setViewName("adminPage/memberMngmt/memberInsert");
		return mav;
	}

	// <page->DB> 사용자 등록 페이지에서 DB로 사용자정보 보내기
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String setMemOthers(MemberVO mvo) {
		memMngmtSrv.setMemOthers(mvo);
		return "redirect:/memberApplicant";
	}
	
	// 사용자 목록 페이지 불러오기
	@RequestMapping("/memberList")
	public String getMemList() {
		return "adminPage/memberMngmt/memberList";
	}
	
}

package com.example.project.controller.adminPageCtr.memberMngmtCtr;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.MemberVO;
import com.example.project.service.adminPageSrv.memberMngmtSrv.MemberInsertSrv;

@Controller
@RequestMapping("/memberInsert")
public class MemberInsertCtr {
	
	@Autowired
	MemberInsertSrv memInsertSrv;
	
	//사용자 등록 페이지에 현재세션의 사용자정보 띄우기
	@RequestMapping(value="", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView getMemOne(HttpSession session) {
		
		String sessionNum = (String) session.getAttribute("memNum");
		
		ModelAndView mav = new ModelAndView();
		MemberVO memOne = memInsertSrv.getMemOne(sessionNum);
		mav.addObject("memOne",memOne);
		mav.setViewName("adminPage/memberMngmt/memberInsert");
		return mav;
	}
	
	//사용자 등록 페이지에서 DB로 사용자정보 보내기
	@RequestMapping(value="", method = RequestMethod.POST)
	public String setMemOthers(MemberVO mvo) {
		memInsertSrv.setMemOthers(mvo);
		return "redirect:/memberApplicant";
	}
}

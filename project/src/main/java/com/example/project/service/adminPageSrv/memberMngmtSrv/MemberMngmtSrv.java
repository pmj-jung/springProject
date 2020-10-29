package com.example.project.service.adminPageSrv.memberMngmtSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.MemberVO;
import com.example.project.repository.adminPageRepo.memberMngmtRepo.MemberMngmtDao;

@Service
public class MemberMngmtSrv {

	@Autowired
	MemberMngmtDao memMngmtDao;
	
	public MemberVO getMemOne(String sessionNum) {
		return memMngmtDao.getMemOne(sessionNum);
	}
	
	public void setMemOthers(MemberVO mvo) {
		memMngmtDao.setMemOthers(mvo);
	}
	
	public List<MemberVO> getMemApplicant(String searchOpt, String words) {
		return memMngmtDao.getMemApplicant(searchOpt, words);
	}
	
	public void changeConfirm(int num) {
		memMngmtDao.changeConfirm(num);
	}
	
	public int getApplicantCount(String searchOpt, String words) {
		return memMngmtDao.getApplicantCount(searchOpt, words);
	}
}

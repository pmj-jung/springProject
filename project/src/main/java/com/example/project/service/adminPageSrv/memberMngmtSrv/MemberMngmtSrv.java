package com.example.project.service.adminPageSrv.memberMngmtSrv;

import java.util.HashMap;
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
	
	public void approveConfirm(int num) {
		memMngmtDao.approveConfirm(num);
	}
	
	public void disapproveConfirm(int num) {
		memMngmtDao.disapproveConfirm(num);
	}
	
	public int getApplicantCount(String searchOpt, String words) {
		return memMngmtDao.getApplicantCount(searchOpt, words);
	}
	
	public void chkApproveConfirm(int[] chkArray) {
		memMngmtDao.chkApproveConfirm(chkArray);
	}
	
	public List<MemberVO> getMemList(String searchOpt, String words) {
		return memMngmtDao.getMemList(searchOpt, words);
	}
	
	public int getMemCount(String searchOpt, String words) {
		return memMngmtDao.getMemCount(searchOpt, words);
	}
	
	public void changeGender(String memGender, int num){
		memMngmtDao.changeGender(memGender, num);
	}
	
	public void changeLevel(String memLevel, int num){
		memMngmtDao.changeLevel(memLevel, num);
	}
	
	public void changeConfirm(String memConfirm, int num){
		memMngmtDao.changeConfirm(memConfirm, num);
	}
	
	public void deleteOne(int num){
		memMngmtDao.deleteOne(num);
	}
}

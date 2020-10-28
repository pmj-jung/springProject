package com.example.project.service.adminPageSrv.memberMngmtSrv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.MemberVO;
import com.example.project.repository.adminPageRepo.memberMngmtRepo.MemberInsertDao;

@Service
public class MemberInsertSrv {

	@Autowired
	MemberInsertDao memInsertDao;
	
	public MemberVO getMemOne(String sessionNum) {
		return memInsertDao.getMemOne(sessionNum);
	}
	
	public void setMemOthers(MemberVO mvo) {
		memInsertDao.setMemOthers(mvo);
	}
}

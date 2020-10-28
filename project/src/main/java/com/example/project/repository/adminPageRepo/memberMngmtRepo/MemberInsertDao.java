package com.example.project.repository.adminPageRepo.memberMngmtRepo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.MemberVO;

@Repository
public class MemberInsertDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public MemberVO getMemOne(String sessionNum) {
		return sqlSession.selectOne("member.getMemOne",sessionNum);
	}
	
	public void setMemOthers(MemberVO mvo) {
		sqlSession.insert("member.setMemOthers",mvo);
	}
}

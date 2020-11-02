package com.example.project.repository.adminPageRepo.memberMngmtRepo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.MemberVO;

@Repository
public class MemberMngmtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public MemberVO getMemOne(String sessionNum) {
		return sqlSession.selectOne("member.getMemOne",sessionNum);
	}
	
	public void setMemOthers(MemberVO mvo) {
		sqlSession.insert("member.setMemOthers",mvo);
	}
	
	public List<MemberVO> getMemApplicant(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		return sqlSession.selectList("member.getMemApplicant",map);
	}
	
	public void approveConfirm(int num) {
		sqlSession.update("member.approveConfirm",num);
	}
	
	public void disapproveConfirm(int num) {
		sqlSession.delete("member.disapproveConfirm",num);
	}

	public int getApplicantCount(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		return sqlSession.selectOne("member.getApplicantCount",map);
	}
	
	public void chkApproveConfirm(int[] chkArray) {
		sqlSession.update("member.chkApproveConfirm", chkArray);
	}
	
	public List<MemberVO> getMemList(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		return sqlSession.selectList("member.getMemList",map);
	}
	
	public int getMemCount(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		return sqlSession.selectOne("member.getMemCount",map);
	}
	
	public void changeGender(String memGender, int num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memGender",memGender);
		map.put("num",num);
		sqlSession.update("member.changeGender",map);
	}
	
	public void changeLevel(String memLevel, int num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memLevel",memLevel);
		map.put("num",num);
		sqlSession.update("member.changeLevel",map);
	}
	
	public void changeConfirm(String memConfirm, int num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memConfirm",memConfirm);
		map.put("num",num);
		sqlSession.update("member.changeConfirm",map);
	}
	
	public void deleteOne(int num) {
		sqlSession.delete("member.deleteOne",num);
	}
}

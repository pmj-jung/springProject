package com.example.project.repository.adminPageRepo.boardRepo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.BoardVO;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;
	
	public void setBoard(BoardVO bvo) {
		sqlSession.insert("board.setBoard",bvo);
	}
	
	public void createArticleTbl(String boardCode) {
		String str = "CREATE TABLE board_article_" + boardCode;
		str += "(aid int not null auto_increment,";
		str += "boardType char(1),";
		str += "subject varchar(255) not null,";
		str += "writer varchar(20),";
		str += "content text,";
		str += "regdate datetime,";
		str += "hit int default 0,";
		str += "fileName varchar(3),";
		str += "fileUrl varchar(300),";
		str += "ref int,";
		str += "re_step int,";
		str += "re_level int,";
		str += "primary key(aid));";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlSession.insert("board.createArticleTbl", map);
	}
	
	public void createCommentTbl(String boardCode) {
		String str = "CREATE TABLE board_comment_" + boardCode;
		str += "(cid int not null auto_increment,";
		str += "aid int not null,";
		str += "comment text,";
		str += "who varchar(20),";
		str += "regdate datetime,";
		str += "primary key(cid));";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlSession.insert("board.createCommentTbl", map);
	}
	
	public int getBoardChk(String boardCode) {
		return sqlSession.selectOne("board.getBoardChk", boardCode);
	}
	
	public List<BoardVO> getBoardList() {
		return sqlSession.selectList("board.getBoardList");
	}
	
	public void setBoardDelete(String boardCode) {
		sqlSession.delete("board.setBoardDelete", boardCode);
	}
	
	public void dropArticleTbl(String boardCode) {
		String str = "DROP TABLE board_article_" + boardCode;
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlSession.insert("board.dropArticleTbl",map);
	}
	
	public void dropCommentTbl(String boardCode) {
		String str = "DROP TABLE board_comment_" + boardCode;
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlSession.insert("board.dropCommentTbl",map);
	}
}

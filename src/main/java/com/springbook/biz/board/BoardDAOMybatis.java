package com.springbook.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBoard(BoardVO vo) {
		mybatis.insert("Board.insertBoard", vo);
	}

	public void insertBoard_n(BoardVO vo) {
		mybatis.insert("Board.insertBoard_n", vo);
	}

	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("Board.getBoard", vo);
	}

	public void updateBoard(BoardVO vo) {
		mybatis.update("Board.updateBoard", vo);
	}

	public void deleteBoard(BoardVO vo) {
		mybatis.delete("Board.deleteBoard", vo);
	}
//	public List<BoardVO> getBoardList(BoardVO vo) {
//		return mybatis.selectList("Board.getBoardList", vo);
//	}
	
	public List<BoardVO> getBoardList(Criteria cri) {
		return mybatis.selectList("Board.getBoardList", cri);
	}
	public List<BoardVO> getBoardList_n(Criteria cri) {
		return mybatis.selectList("Board.getBoardList_n", cri);
	}
	public int listCount() throws Exception{
		return mybatis.selectOne("Board.listCount");
	}
	
}
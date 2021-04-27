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
		System.out.println("===> Mybatis로 getBoardList()기능 처리");
		if(cri.getSearchCondition().equals("TITLE")) {
			return mybatis.selectList("Board.getBoardList_t", cri);
		}else if (cri.getSearchCondition().equals("CONTENT")) {
			return mybatis.selectList("Board.getBoardList_c", cri);
		}
		return null;
	}
	public List<BoardVO> getBoardList_n(Criteria cri) {
		return mybatis.selectList("Board.getBoardList_n", cri);
	}
	public int listCount() throws Exception{
		return mybatis.selectOne("Board.listCount");
	}
	
	public void updateBoardRating(BoardVO vo) {
		mybatis.update("Board.updateBoardRating", vo);
		
	}
	public void updateBoardRatingb(BoardVO vo) {
		mybatis.update("Board.updateBoardRatingb", vo);
	}
	
	public void updateViewCnt(BoardVO vo) {
		mybatis.update("Board.increment", vo);
	}
}
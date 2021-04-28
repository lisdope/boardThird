package com.springbook.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAOMybatis boardDAO;

	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	
	public void insertBoard_n(BoardVO vo) {
		boardDAO.insertBoard_n(vo);
	}

	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	public BoardVO getBoard(BoardVO vo) {
		boardDAO.updateViewCnt(vo);
		return boardDAO.getBoard(vo);
	}

//	public List<BoardVO> getBoardList(BoardVO vo){
//		return boardDAO.getBoardList(vo);
//	}
	public List<BoardVO> getBoardList(Criteria cri) throws Exception {
		return boardDAO.getBoardList(cri);
	}
	public List<BoardVO> getBoardList_n(Criteria cri) throws Exception {
		return boardDAO.getBoardList_n(cri);
	}
	public int listCount() throws Exception {
		return boardDAO.listCount();
	}
	
	public void boardRatingLike(BoardVO vo){
		boardDAO.boardRatingLike(vo);
	}

	public void boardRatingHate(BoardVO vo) {
		boardDAO.boardRatingHate(vo);
	}
	
}
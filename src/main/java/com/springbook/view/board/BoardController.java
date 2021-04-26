package com.springbook.view.board;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Criteria;
import com.springbook.biz.board.PageMaker;
import com.springbook.biz.user.UserVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 글 등록
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		boardService.insertBoard(vo);
		return "index.jsp";
	}
	
	// 공지사항 등록
	@RequestMapping("/insertBoard_n.do")
	public String insertBoard_n(BoardVO vo) {
		boardService.insertBoard_n(vo);
		return "index.jsp";
	}
	
	 // 글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "getBoardList.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "getBoardList.do";
	}
	
	// 글 상세 조회
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo)); 
		return "getBoard.jsp"; 
		
	}
	
	// 글 목록 검색
//		@RequestMapping("/getBoardList.do")
//		public String getBoardList(BoardVO vo,  Model model) {
//
//			model.addAttribute("boardList", boardService.getBoardList(vo));
//			return "getBoardList.jsp"; 
//			
//		}
	
	// 글 목록&공지사항 목록 검색
	@RequestMapping("/getBoardList.do" )
	public String getBoardList( Model model ,Criteria cri, BoardVO vo) throws Exception {
		// 목록 검색
				// Null Check
				if(cri.getSearchCondition() == null) {
					cri.setSearchCondition("TITLE");
				}else {
					cri.setSearchCondition(vo.getSearchCondition());
				}
				if(cri.getSearchKeyword() == null) {
					cri.setSearchKeyword("");
				}else {
					cri.getSearchKeyword();
				}
				// model 정보 저장
				model.addAttribute("boardList", boardService.getBoardList(cri));
				model.addAttribute("boardList_n", boardService.getBoardList_n(cri));
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(boardService.listCount());
				
				model.addAttribute("pageMaker", pageMaker);
				
				
				return "getBoardList.jsp"; 
	}
	
	@RequestMapping("/updateBoardRating.do")
	public String updateBoardRating(@ModelAttribute("board") BoardVO vo) {
		System.out.println("updateBoardRating 실행");
		System.out.println("vo");
		
		boardService.updateBoardRating(vo);
	
		return "getBoard.do";
	}
	
	@RequestMapping("/updateBoardRatingb.do")
	public String updateBoardRatingb(@ModelAttribute("board") BoardVO vo) {
		System.out.println("updateBoardRatingb 실행");
		System.out.println("vo");
		
		boardService.updateBoardRatingb(vo);
	
		return "getBoard.do";
	
	}

	
}

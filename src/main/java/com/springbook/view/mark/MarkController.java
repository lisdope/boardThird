package com.springbook.view.mark;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.SQLErrorCodes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.mark.MarkService;
import com.springbook.biz.mark.MarkServiceImpl;
import com.springbook.biz.mark.MarkVO;

@Controller
@SessionAttributes("mark")
public class MarkController {
	
	@Autowired
	private MarkService markService;
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/updateBoardRatingLike.do")
	public String updateBoardRating(MarkVO markP, BoardVO vo) {
		try {
			markService.insertMarkLike(markP);
		
			boardService.boardRatingLike(vo);
		
		}catch (Exception e) {
			System.out.println("좋아요/싫어요는 한번만 입력 가능합니다!");
	}
	
		return "getBoard.do";
	}
	
	@RequestMapping("/updateBoardRatingHate.do")
	public String updateBoardRatingb(MarkVO markP, BoardVO vo) {

		try {
		markService.insertMarkHate(markP);
		
		boardService.boardRatingHate(vo);
		}catch (Exception e) {
			System.out.println("좋아요/싫어요는 한번만 입력 가능합니다!");
		}
	
		return "getBoard.do";
	}
}

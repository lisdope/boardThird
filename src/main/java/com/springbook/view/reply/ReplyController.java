package com.springbook.view.reply;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.reply.ReplyService;
import com.springbook.biz.reply.ReplyVO;


@Controller
@SessionAttributes("reply")
public class ReplyController {
	@Autowired
	private ReplyService replyService;

	//�뙎湲� �벑濡�
	@RequestMapping("/insertReply.do")
	public String insertReply(ReplyVO vo){	
		replyService.insertReply(vo);
		return "getReplyList.do";
	}

	//�뙎湲� �닔�젙
	@RequestMapping("/updateReply.do")
	public String updateBoard(@ModelAttribute("reply") ReplyVO vo) {
		replyService.updateReply(vo);
		return "getReplyList.do";
	}
	
	//�뙎湲� �궘�젣
	@RequestMapping("/deleteReply.do")
	public String deleteReply(ReplyVO vo){

		replyService.deleteReply(vo);

		return "getReplyList.do";
	}
	
	@RequestMapping("/getReply.do")
	public String getBoard(ReplyVO vo, Model model) {
		model.addAttribute("reply", replyService.getReply(vo)); 
		return "getReply.jsp"; 
	}
	
	@RequestMapping("/getReplyList.do")
	public String getBoardList(ReplyVO vo, Model model) {
		
		model.addAttribute("ReplyList", replyService.getReplyList(vo));
		return "getBoard.jsp"; 
		
	}

}


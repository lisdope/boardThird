package com.springbook.biz.reply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.reply.ReplyService;
import com.springbook.biz.reply.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	@Resource(name = "replyDAO")
	
	private ReplyDAOMybatis replyDAO;

	public ReplyVO getReply(ReplyVO vo) {
		return replyDAO.getReply(vo);
	}

	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return replyDAO.ReplyList(vo);
	}
	

	public void insertReply(ReplyVO vo){
		replyDAO.insertReply(vo);
	}


	@Override
	public void updateReply(ReplyVO vo) {
		replyDAO.updateReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		replyDAO.deleteReply(vo);
	}



}
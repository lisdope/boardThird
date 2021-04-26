package com.springbook.biz.reply;

import java.util.List;
import java.util.Map;

import com.springbook.biz.board.BoardVO;


public interface ReplyService {
	
	ReplyVO getReply(ReplyVO vo);

	List<ReplyVO> getReplyList(ReplyVO vo);

	 void insertReply(ReplyVO vo);
	 
	 void updateReply(ReplyVO vo);
	 
	 void deleteReply(ReplyVO vo);


}

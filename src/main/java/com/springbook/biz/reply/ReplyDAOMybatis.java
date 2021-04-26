package com.springbook.biz.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.reply.ReplyVO;

@Repository("replyDAO")
public class ReplyDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ReplyVO> ReplyList(ReplyVO vo){
		return mybatis.selectList("reply.getReplyList", vo);
	}

	public void insertReply(ReplyVO vo){
		mybatis.insert("reply.insertReply", vo);
	}

	public void updateReply(ReplyVO vo){
		mybatis.update("reply.updateReply", vo);
	}

	public void deleteReply(ReplyVO vo){
		mybatis.delete("reply.deleteReply", vo);
	}

	public ReplyVO getReply(ReplyVO vo) {
		return mybatis.selectOne("reply.getReply", vo);
		
	}
	


	


}

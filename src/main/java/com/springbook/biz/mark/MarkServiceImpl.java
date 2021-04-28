package com.springbook.biz.mark;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardVO;

@Service("markService")
public class MarkServiceImpl implements MarkService{
	
	@Resource(name = "markDAO")
	private MarkDAO markDAO;

	public void insertMarkLike(MarkVO markP){
		markDAO.insertMarkLike(markP);
	}
	
	public void insertMarkHate(MarkVO markP){
		markDAO.insertMarkHate(markP);
	}
}

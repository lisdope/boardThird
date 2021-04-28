package com.springbook.biz.mark;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;

@Repository
public class MarkDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;


	public void insertMarkLike(MarkVO markP) {
		mybatis.insert("mark.insertMarkLike", markP);
		
	}
	
	public void insertMarkHate(MarkVO markP) {
		mybatis.insert("mark.insertMarkHate", markP);
		
	}



	


}

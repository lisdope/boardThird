package com.springbook.biz.board;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private String boardNo;     	//게시글번호
	private String userCode;    	//유저코드
	private String grade;    	    //유저등급	
	private String boardTitle;      //게시판본문제목
	private String boardContents;   //게시글내용
	private String boardDate;       //게시글작성일자
	private String boardHits;       //게시글조회수
	private String boardRating;     //게시글좋아요
	
}
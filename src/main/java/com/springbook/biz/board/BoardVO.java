package com.springbook.biz.board;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int boardNo;     	//게시글번호
	private String userCode;    	//유저코드
	private String grade;    	    //유저등급	
	private String boardTitle;      //게시판본문제목
	private String boardContents;   //게시글내용
	private String boardDate;       //게시글작성일자
	private int boardHits;       //게시글조회수
	private String boardRating;     //게시글좋아요
	private String boardRatingb;    //게시글싫어요
	private String searchCondition; //검색 조건
	private String searchKeyword;   //검색 키워드
}
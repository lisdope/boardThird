package com.springbook.biz.board;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	
	private String boardNo;     	//게시글번호
	private String userCode;    	//유저코드
	private String boardTitle;      //게시판본문제목
	private String boardContents;   //게시글내용
	private String boardDate;       //게시글작성일자
	private String boardHits;       //게시글조회수
	private String boardRating;     //게시글좋아요
	private String searchCondition; //검색 조건
	private String searchKeyword;   //검색 키워드
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}
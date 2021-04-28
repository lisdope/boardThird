package com.springbook.biz.mark;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter@Setter
@AllArgsConstructor

public class MarkVO implements Serializable{
	private String boardNo;     
	private String userCode;    
	private int markRatingLike;
	private int markRatingHate;

	public MarkVO() {
		super();
	}

	
	
	
}

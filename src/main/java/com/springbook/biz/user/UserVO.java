package com.springbook.biz.user;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserVO {
	private String userCode;         //유저코드
	private String id;               //아이디
	private String pw;               //패스워드
	private String email;            //이메일
	private String userImage;        //유저이미지
	private String name;             //이름
	private String birth;            //생년월일
	private String postNum;          //우편번호
	private String phoneCd;          //전화번호앞자리번호
	private String phoneNum;         //전화번호뒷자리
	private String address;          //주소
	private String entDate;          //회원가입일
	private String grade;			 //회원등급
	

	
}
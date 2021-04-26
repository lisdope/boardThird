package com.springbook.biz.user;



public interface UserService {
	
	//�쉶�썝媛��엯
	void createUser(UserVO vo);
	//�젙蹂댁닔�젙
	void updateUser(UserVO vo);
	//�쉶�썝�깉�눜
	void deleteUser(UserVO vo);
	//濡쒓렇�씤
	UserVO getUser(UserVO vo);
	//�븘�씠�뵒李얘린
	String getId(UserVO vo);
	//鍮꾨쾲李얘린
	String getPw(UserVO vo);

	int idchk(String vo);
}

package com.springbook.biz.user;




import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;



@Repository("UserDAO")
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 濡쒓렇�씤
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("User.getUser", vo);
    }
	// 鍮꾨�踰덊샇 李얘린
	public String getPw(UserVO vo) {
		String userPw = mybatis.selectOne("User.getPw", vo);
		return userPw;
	}
	// �븘�씠�뵒 李얘린
	public String getId(UserVO vo) {
		String userId = mybatis.selectOne("User.getId", vo);
		return userId;
	}
	//�쉶�썝媛��엯
	public void createUser(UserVO vo) {
		mybatis.insert("User.createUser",vo);
	}
	//�젙蹂댁닔�젙
	public void updateUser(UserVO vo) {
		mybatis.update("User.updateUser",vo);
	}
	//�쉶�썝�깉�눜
	public void deleteUser(UserVO vo) {
		mybatis.delete("User.deleteUser",vo);
	}
	public int idChk(String vo) {
		return mybatis.selectOne("User.idChk",vo);
	}

		
	
}
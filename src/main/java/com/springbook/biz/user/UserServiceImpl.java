package com.springbook.biz.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAOMybatis userDAO;
	
	@Override//�쉶�썝媛��엯
	public void createUser(UserVO vo) {
		userDAO.createUser(vo);
	}

	@Override//�쉶�썝�젙蹂댁닔�젙
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}

	@Override//�쉶�썝�깉�눜
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public String getId(UserVO vo) {
		return userDAO.getId(vo);
	}

	@Override
	public String getPw(UserVO vo) {
		return userDAO.getPw(vo);
	}

	@Override
	public int idchk(String vo) {
		return userDAO.idChk(vo);
	}



	
}

package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.UserDao;
import edu.howf.vo.UserVO;

@Service
public class UserServiceImple implements UserService{
	@Autowired
	UserDao userDao;

	@Override
	public int emailDup(String email) {
		return userDao.emailDup(email);
	}
	
	@Override
	public int nicknameDup(String nickname) {
		return userDao.nicknameDup(nickname);
	}

	@Override
	public int userInsert(UserVO vo) {
		return userDao.userInsert(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return userDao.login(vo);
	}

	@Override
	public int socialLogin(UserVO vo) {
		if(userDao.emailDup(vo.getEmail())==0) {
			return userDao.socialInsert(vo);
		}
		return userDao.socialLogin(vo);
	}
}

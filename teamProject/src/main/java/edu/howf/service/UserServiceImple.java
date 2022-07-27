package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.UserDao;
import edu.howf.vo.AutoVO;
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
	public String emailDupPwd(String email) {
		return userDao.emailDupPwd(email);
	}
	
	@Override
	public int nicknameDup(String nickname) {
		return userDao.nicknameDup(nickname);
	}

	@Override
	public int nicknameInsert(UserVO vo) {
		return userDao.nicknameInsert(vo);
	}
	
	@Override
	public String nicknameSelect(String email) {
		return userDao.nicknameSelect(email);
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
			userDao.socialInsert(vo);
			return vo.getMidx();
		}
		return userDao.socialLogin(vo);
	}

	@Override
	public String nameToEmail(UserVO vo) {
		return userDao.nameToEmail(vo);
	}

	@Override
	public int pwdModify(UserVO vo) {
		return userDao.pwdModify(vo);
	}

	@Override
	public int autoLoginInsert(AutoVO vo) {
		return userDao.autoLoginInsert(vo);
	}
	
	@Override
	public int autoLoginDelete(int midx) {
		return userDao.autoLoginDelete(midx);
	}
	
	@Override
	public int autoLogin(AutoVO vo) {
		return userDao.autoLogin(vo);
	}

	@Override
	public UserVO autoLogin(int midx) {
		return userDao.autoLogin(midx);
	}
	
}

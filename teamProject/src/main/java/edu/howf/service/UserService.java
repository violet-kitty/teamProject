package edu.howf.service;

import edu.howf.vo.UserVO;

public interface UserService {
	int emailDup(String email);
	int userInsert(UserVO vo);
	UserVO login(UserVO vo);
	int socialLogin(UserVO vo);
}

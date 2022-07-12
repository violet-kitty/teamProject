package edu.howf.service;

import edu.howf.vo.AutoVO;
import edu.howf.vo.UserVO;

public interface UserService {
	public int emailDup(String email);
	public int nicknameDup(String nickname);
	public int nicknameInsert(UserVO vo);
	public String nicknameSelect(String email);
	public int userInsert(UserVO vo);
	public UserVO login(UserVO vo);
	public int socialLogin(UserVO vo);
	public String nameToEmail(UserVO vo);
	public int pwdModify(UserVO vo);
	public int autoLoginInsert(AutoVO vo);
	public int autoLogin(AutoVO vo);
	public UserVO autoLogin(int midx);
}

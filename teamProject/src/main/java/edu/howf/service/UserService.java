package edu.howf.service;

import java.util.List;

import edu.howf.vo.AutoVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

public interface UserService { 
	public int emailDup(String email);
	public String emailDupPwd(String email);
	public int nicknameDup(String nickname);
	public int nicknameInsert(UserVO vo);
	public String nicknameSelect(String email);
	public String imgSelect(int midx);
	public int userInsert(UserVO vo);
	public UserVO login(UserVO vo);
	public int socialLogin(UserVO vo);
	public String socialType(UserVO vo);
	public String nameToEmail(UserVO vo);
	public int pwdModify(UserVO vo);
	public int autoLoginInsert(AutoVO vo);
	public int autoLoginDelete(int midx);
	public int autoLogin(AutoVO vo);
	public UserVO autoLogin(int midx);
	
	public UserVO profileSelectOne(int midx);
	public int profileImgModify(UserVO vo);
	public int profileModify(UserVO vo);
	public List<HeartVO> heartSelectHOWF(SearchVO vo);
	public int heartCountHOWF(SearchVO vo);
	public List<HeartVO> heartSelectEvent(SearchVO vo);
	public int heartCountEvent(SearchVO vo);
	public List<HeartVO> heartSelectStory(SearchVO vo);
	public List<HeartVO> heartSelectStay(SearchVO vo);
	public int heartCountStay(SearchVO vo);
}

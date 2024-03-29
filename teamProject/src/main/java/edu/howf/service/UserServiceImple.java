package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.UserDao;
import edu.howf.vo.AutoVO;
import edu.howf.vo.CommentVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.JoinVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StoryVO;
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
	public UserVO emailDupPwd(String email) {
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
	public String imgSelect(int midx) {
		return userDao.imgSelect(midx);
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
	public String socialBan(UserVO vo) {
		return userDao.socialBan(vo);
	}
	
	@Override
	public String banComment(UserVO vo) {
		return userDao.banComment(vo);
	}
	
	@Override
	public String socialType(UserVO vo) {
		return userDao.socialType(vo);
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
	
	
	/* 마이 페이지 */
	
	@Override
	public UserVO profileSelectOne(int midx) {
		return userDao.profileSelectOne(midx);
	}

	@Override
	public int profileImgModify(UserVO vo) {
		return userDao.profileImgModify(vo);
	}

	@Override
	public int profileModify(UserVO vo) {
		return userDao.profileModify(vo);
	}
	
	@Override
	public int userDel(int midx) {
		return userDao.userDel(midx);
	}

	@Override
	public List<HeartVO> heartSelectHOWF(SearchVO vo) {
		return userDao.heartSelectHOWF(vo);
	}
	
	@Override
	public int heartCountHOWF(SearchVO vo) {
		return userDao.heartCountHOWF(vo);
	}

	@Override
	public List<HeartVO> heartSelectEvent(SearchVO vo) {
		return userDao.heartSelectEvent(vo);
	}
	
	@Override
	public int heartCountEvent(SearchVO vo) {
		return userDao.heartCountEvent(vo);
	}

	@Override
	public List<HeartVO> heartSelectStory(SearchVO vo) {
		return userDao.heartSelectStory(vo);
	}
	
	@Override
	public int heartCountStory(SearchVO vo) {
		return userDao.heartCountStory(vo);
	}

	@Override
	public List<HeartVO> heartSelectStay(SearchVO vo) {
		return userDao.heartSelectStay(vo);
	}
	
	@Override
	public int heartCountStay(SearchVO vo) {
		return userDao.heartCountStay(vo);
	}

	@Override
	public List<CommentVO> myReview(SearchVO vo) {
		return userDao.myReview(vo);
	}

	@Override
	public int myReviewCount(SearchVO vo) {
		return userDao.myReviewCount(vo);
	}
	
	@Override
	public List<CommentVO> myComment(SearchVO vo){
		return userDao.myComment(vo);
	}
	
	@Override
	public int myCommentCount(SearchVO vo) {
		return userDao.myCommentCount(vo);
	}
	
	@Override
	public List<StoryVO> myStory(SearchVO vo){
		return userDao.myStory(vo);
	}
	
	@Override
	public int myStoryCount(SearchVO vo) {
		return userDao.myStoryCount(vo);
	}
	
	//내가 가입하거나 가입신청 한 너나들이 팀 목록
	@Override
	public List<JoinVO> myTeamList(SearchVO vo){
		return userDao.myTeamList(vo);
	}
	//내가 만든 팀에 들어온 가입신청 목록불러옴(모달창)
	@Override
	public List<JoinVO> myTeam_applyList(int tidx){
		return userDao.myTeam_applyList(tidx);
	}
	//가입신청 수락
	@Override
	public int apply_Y(int jidx) {
		return userDao.apply_Y(jidx);
	}
	//가입신청 거절
	@Override
	public int apply_N(int jidx) {
		return userDao.apply_N(jidx);
	}
	

	@Override
	public List<UserVO> userList(SearchVO vo) {
		return userDao.userList(vo);
	}

	@Override
	public int userListCount(SearchVO vo) {
		return userDao.userListCount(vo);
	}

	@Override
	public int userBan(CommentVO vo) {
		userDao.userBan(vo.getMidx());
		return userDao.userBanComment(vo);
	}

	@Override
	public List<UserVO> addrData() {
		return userDao.addrData();
	}

	@Override
	public List<UserVO> ageData() {
		return userDao.ageData();
	}

	@Override
	public List<UserVO> joinBSelect(SearchVO vo) {
		return userDao.joinBSelect(vo);
	}
	
	@Override
	public int joinBCount(SearchVO vo) {
		return userDao.joinBCount(vo);
	}

	@Override
	public int joinBY(int midx) {
		return userDao.joinBY(midx);
	}

	@Override
	public int joinBN(int midx) {
		return userDao.joinBN(midx);
	}
	
}

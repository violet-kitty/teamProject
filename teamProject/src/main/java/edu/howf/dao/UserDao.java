package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.AutoVO;
import edu.howf.vo.CommentVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.JoinVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

@Repository
public class UserDao { 
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.userMapper.";
	
	//첫 소셜 로그인시 회원가입
	public int socialInsert(UserVO vo) {
		return sqlSession.insert(namespace+"socialInsert", vo);
	}
	
	//이메일 중복체크
	public int emailDup(String email) {
		return sqlSession.selectOne(namespace+"emailDup", email);
	}
	
	//이메일 중복체크2
	public String emailDupPwd(String email) {
		return sqlSession.selectOne(namespace+"emailDupPwd", email);
	}
	
	//닉네임 중복체크
	public int nicknameDup(String nickname) {
		return sqlSession.selectOne(namespace+"nicknameDup", nickname);
	}
	
	//닉네임 가져오기
	public String nicknameSelect(String email) {
		return sqlSession.selectOne(namespace+"nicknameSelect", email);
	}
	
	//닉네임 등록
	public int nicknameInsert(UserVO vo) {
		return sqlSession.insert(namespace+"nicknameInsert", vo);
	}
	
	public String imgSelect(int midx) {
		return sqlSession.selectOne(namespace+"imgSelect", midx);
	}
	
	//일반회원, 사업자 회원가입
	public int userInsert(UserVO vo) {
		return sqlSession.insert(namespace+"userInsert", vo);
	}
	
	//일반 로그인
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne(namespace+"login", vo);
	}
	
	//소셜 로그인
	public int socialLogin(UserVO vo) {
		return sqlSession.selectOne(namespace+"socialLogin", vo);
	}
	
	//소셜 밴 여부
	public String socialBan(UserVO vo) {
		return sqlSession.selectOne(namespace+"socialBan",vo);
	}
	
	//밴 사유
	public String banComment(UserVO vo) {
		return sqlSession.selectOne(namespace+"banComment", vo);
	}
	
	//소셜 로그인 소셜 종류
	public String socialType(UserVO vo) {
		return sqlSession.selectOne(namespace+"socialType", vo);
	}
	
	//이름, 닉네임 받아 이메일 반환
	public String nameToEmail(UserVO vo) {
		return sqlSession.selectOne(namespace+"nameToEmail", vo);
	}
	
	//비밀번호 변경
	public int pwdModify(UserVO vo) {
		return sqlSession.update(namespace+"pwdModify", vo);
	}
	
	//자동 로그인 추가
	public int autoLoginInsert(AutoVO vo) {
		return sqlSession.insert(namespace+"autoLoginInsert", vo);
	}
	
	//자동 로그인 제거
	public int autoLoginDelete(int midx) {
		return sqlSession.delete(namespace+"autoLoginDelete", midx);
	}
	
	//자동 로그인 여부
	public int autoLogin(AutoVO vo) {
		return sqlSession.selectOne(namespace+"autoLogin", vo);
	}
	
	//midx로 로그인
	public UserVO autoLogin(int midx) {
		return sqlSession.selectOne(namespace+"autoLoginSelectOne", midx);
	}
	
	/* 마이 페이지 */
	
	//프로필 정보 가져오기
	public UserVO profileSelectOne(int midx) {
		return sqlSession.selectOne(namespace+"profileSelectOne", midx);
	}
	
	//프로필 이미지 수정
	public int profileImgModify(UserVO vo) {
		return sqlSession.update(namespace+"profileImgModify", vo);
	}
	
	//프로필 수정
	public int profileModify(UserVO vo) {
		return sqlSession.update(namespace+"profileModify", vo);
	}
	
	//회원 탈퇴
	public int userDel(int midx) {
		return sqlSession.update(namespace+"userDel",midx);
	}
	
	//찜목록 가져오기(HOWF 추천)
	public List<HeartVO> heartSelectHOWF(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"heartSelectHOWF", vo);
	}
	
	//찜 개수(HOWF 추천)
	public int heartCountHOWF(SearchVO vo) {
		return sqlSession.selectOne(namespace+"heartCountHOWF", vo);
	}
	
	//찜목록 가져오기(지역 이벤트)
	public List<HeartVO> heartSelectEvent(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"heartSelectEvent", vo);
	}
	
	//찜 개수(지역 이벤트)
	public int heartCountEvent(SearchVO vo) {
		return sqlSession.selectOne(namespace+"heartCountEvent", vo);
	}
	
	//찜목록 가져오기(여행이야기)
	public List<HeartVO> heartSelectStory(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"heartSelectStory", vo);
	}
	
	//찜 개수(여행이야기)
	public int heartCountStory(SearchVO vo) {
		return sqlSession.selectOne(namespace+"heartCountStory",vo);
	}
	
	//찜목록 가져오기(숙박 정보)
	public List<HeartVO> heartSelectStay(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"heartSelectStay", vo);
	}
	
	//찜 개수(숙박 정보)
	public int heartCountStay(SearchVO vo) {
		return sqlSession.selectOne(namespace+"heartCountStay", vo);
	}
	
	//내 리뷰
	public List<CommentVO> myReview(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"myReview", vo);
	}
	
	//내 리뷰 개수
	public int myReviewCount(SearchVO vo) {
		return sqlSession.selectOne(namespace+"myReviewCount", vo);
	}
	
	//내 댓글
	
	
	//내 댓글 개수
	
	
	//내 팀
	public List<JoinVO> myTeamList(SearchVO vo) {
		
		return sqlSession.selectList(namespace + "myTeamList", vo);
	}
	
	//내가 만든 팀에 들어온 가입신청 목록
	public List<JoinVO> myTeam_applyList(int tidx){
		
		return sqlSession.selectList(namespace + "myTeam_applyList", tidx);
	}
	
	//내가 만든 팀에 들어온 가입신청 수락
	public int apply_Y(int jidx) {
		
		return sqlSession.update(namespace + "apply_Y", jidx);
	}
	//내가 만든 팀에 들어온 가입신청 거절(테이블에서 삭제)
	public int apply_N(int jidx) {
		
		return sqlSession.delete(namespace + "apply_N", jidx);
	}
	
	//내 팀 개수
	
	
	
	//회원 목록
	public List<UserVO> userList(SearchVO vo){
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"userList", vo);
	}
	
	//회원 목록 수
	public int userListCount(SearchVO vo) {
		return sqlSession.selectOne(namespace+"userListCount", vo);
	}
	
	//유저 밴
	public int userBan(int midx) {
		return sqlSession.update(namespace+"userBan", midx);
	}
	
	//유저 밴 사유
	public int userBanComment(CommentVO vo) {
		return sqlSession.insert(namespace+"userBanComment", vo);
	}
	
	//지역별 데이터
	public List<UserVO> addrData() {
		return sqlSession.selectList(namespace+"addrData");
	}
	
	//나이별 데이터
	public List<UserVO> ageData(){
		return sqlSession.selectList(namespace+"ageData");
	}
	
	//사업자 목록
	public List<UserVO> joinBSelect(SearchVO vo){
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"joinBSelect", vo);
	}
	
	//사업자 목록 개수
	public int joinBCount(SearchVO vo) {
		return sqlSession.selectOne(namespace+"joinBCount", vo);
	}
	
	//사업자 가입 승인
	public int joinBY(int midx) {
		return sqlSession.update(namespace+"joinBY", midx);
	}
	
	//사업자 가입 거절
	public int joinBN(int midx) {
		return sqlSession.update(namespace+"joinBN", midx);
	}
	
}

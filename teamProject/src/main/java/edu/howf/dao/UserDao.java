package edu.howf.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//닉네임 중복체크
	public int nicknameDup(String nickname) {
		return sqlSession.selectOne(namespace+"nicknameDup", nickname);
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
}

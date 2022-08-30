package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.StoryVO;
import edu.howf.vo.CommentVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

@Repository
public class StoryDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.storyMapper.";
	
	public List<StoryVO> storySelectAll(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"storySelectAll", vo);
	}
	
	public int storyCountAll(SearchVO vo) {
		return sqlSession.selectOne(namespace+"storyCountAll", vo);
	}
	
	
	public StoryVO storyView(int sbidx) {
		return sqlSession.selectOne(namespace+"storyView", sbidx);
	}
	
	public int storyWrite(StoryVO vo) {
		return sqlSession.insert(namespace+"storyWrite", vo);
	}
	
	public int storyModify(StoryVO vo) {
		return sqlSession.update(namespace+"storyModify", vo);
	}
	
	public int storyDelete(int sbidx) {
		HeartVO vo = new HeartVO();
		vo.setBidx(sbidx);
		vo.setType("story");
		sqlSession.delete(namespace+"storyHeartDelete", vo);
		return sqlSession.update(namespace+"storyDelete", sbidx);
	}
	
	//댓글
	public List<CommentVO> commentSelect(SearchVO vo){
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"commentSelect", vo);
	}
	
	public int commentCount(int bidx) {
		return sqlSession.selectOne(namespace+"commentCount", bidx);
	}
	
	public int commentHeart(int bidx) {
		return sqlSession.selectOne(namespace+"commentHeart", bidx);
	}
	
	public int commentWrite(CommentVO vo) {
		return sqlSession.insert(namespace+"commentWrite", vo);
	}
	
	//좋아요
	public int heartInsert(HeartVO vo) {
		return sqlSession.insert(namespace+"heartInsert", vo);
	}
	
	public int heartDelete(HeartVO vo) {
		return sqlSession.delete(namespace+"heartDelete", vo);
	}
	
	public int heartDup(HeartVO vo) {
		return sqlSession.selectOne(namespace+"heartDup", vo);
	}
}

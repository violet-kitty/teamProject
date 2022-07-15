package edu.howf.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.howf.vo.SearchVO;
import edu.howf.vo.Criteria;
import edu.howf.vo.NoticeVO;

@Repository
public class NoticeDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.noticeMapper.";
	
	
	
	public int insertnotice(NoticeVO vo) {
		
		
		return sqlSession.insert(namespace+"insertnotice",vo);
	}
	
	public List<NoticeVO> selectAll(SearchVO searchVO) {
		searchVO.setPage((searchVO.getPage()-1)*searchVO.getPerPageNum());
		return sqlSession.selectList(namespace+"selectAll",searchVO);
	}
	
	public NoticeVO selectone(int nbidx) {
		
		return sqlSession.selectOne(namespace+"selectone",nbidx);
	}
	
	public int noticemodify(NoticeVO vo) {
		
		return sqlSession.update(namespace+"noticemodify",vo);
	}
	
	/*
	 * public int noticedelete(int nbidx) {
	 * 
	 * return sqlSession.delete(namespace+"noticedelete",nbidx); }
	 */
	
	public int noticedelete(int nbidx) {
		
		return sqlSession.update(namespace+"noticedelete",nbidx);
	}
	//게시글 갯수
	public int pagecount(SearchVO searchVO) {
		
		return sqlSession.selectOne(namespace+"pagecount",searchVO);
	}

}

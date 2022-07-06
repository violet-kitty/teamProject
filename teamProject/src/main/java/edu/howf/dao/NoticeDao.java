package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.howf.vo.SearchVO;
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
		
		return sqlSession.selectList(namespace+"selectAll",searchVO);
	}
	
	public NoticeVO selectone(int nbidx) {
		
		return sqlSession.selectOne(namespace+"selectone",nbidx);
	}
	
		
}

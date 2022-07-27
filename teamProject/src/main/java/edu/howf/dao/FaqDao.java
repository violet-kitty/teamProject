package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.FaqVO;
import edu.howf.vo.SearchVO;

@Repository
public class FaqDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.faqMapper.";
	
	public int insertfaq(FaqVO vo) {
		
		return sqlSession.insert(namespace+"insertfaq",vo);
	}
	
	public List<FaqVO> selectList(SearchVO searchVO) {
	
		searchVO.setPage((searchVO.getPage()-1)*searchVO.getPerPageNum());
		return sqlSession.selectList(namespace+"selectAll",searchVO);
	}
	
	public int pagecount(SearchVO searchVO) {
		
		return sqlSession.selectOne(namespace+"pagecount",searchVO);
	}
	
	public int faqmodify(FaqVO vo) {
		
		return sqlSession.update(namespace+"faqmodify",vo);
	}
	
	public FaqVO selectone(int fbidx) {
		
		return sqlSession.selectOne(namespace+"selectone",fbidx);
	}
	public int delfaq(FaqVO vo) {
		
		return sqlSession.update(namespace+"delfaq",vo);
	}
	
}

package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.CSVO;
import edu.howf.vo.SearchVO;

@Repository
public class CSDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "edu.howf.mapper.csMapper.";
	
	
	public int CS_write(CSVO vo) {
	
		sqlSession.insert(namespace + "CS_write", vo);
		
		return sqlSession.update(namespace + "origincsbidx_update", vo.getCsbidx());
	}
	
	public List<CSVO> CSListAll(SearchVO vo){
		
		int page = (vo.getPage()-1)*10;
		vo.setPage(page);

		return sqlSession.selectList(namespace + "1v1_selectAll", vo);
	}
	
	public List<CSVO> CSListMy(SearchVO vo){
		
		int page = (vo.getPage()-1)*10;
		vo.setPage(page);
		return sqlSession.selectList(namespace + "1v1_selectMy", vo);
	}
	
	
	public int countPageAll(SearchVO vo) {
		
		return sqlSession.selectOne(namespace + "countPageAll", vo);
	}
	
	public int countPageMy(SearchVO vo) {
		
		return sqlSession.selectOne(namespace + "countPageMy", vo);
	}
	
	public CSVO csList_view(int csbidx) {
		
		return sqlSession.selectOne(namespace + "csList_view", csbidx);
	}
	
	public int csList_cnt(int csbidx) {
		
		return sqlSession.update(namespace + "count_cnt", csbidx);
	}
	
	public int csReply_write(CSVO vo) {
		
		return sqlSession.insert(namespace + "csReply_write", vo);
	}
	
	public CSVO csList_reply_view(int origincsbidx) {
		
		return sqlSession.selectOne(namespace + "csList_reply_view", origincsbidx);
	}
	
	public int csList_modify(CSVO vo) {
		
		return sqlSession.update(namespace + "csList_modify", vo);
	}
	
	public int csList_delete(int origincsbidx) {
		
		return sqlSession.update(namespace + "csList_delete", origincsbidx);
	}
	
	public int csReply_modify(CSVO vo) {
		
		return sqlSession.update(namespace + "csReply_modify", vo);
	}
	
	public int csReply_delete(CSVO vo) {
		
		return sqlSession.update(namespace + "csReply_delete", vo);
	}
	
	//답변 여부
	public int csReply_check(int csbidx) {
		
		return sqlSession.selectOne(namespace +"csReply_check", csbidx);
	}
	
	
}

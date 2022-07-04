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
	
	private static final String namespace = "edu.howf.mapper.csMapper";
	
	
	public int CS_write(CSVO vo) {
	
		int csbidx = sqlSession.insert(namespace + "CS_write", vo);
	
		return sqlSession.update(namespace + "origincsbidx_update", csbidx);
	}
	
	public List<CSVO> CSListAll(SearchVO vo){

			return sqlSession.selectList(namespace + ".1v1_selectAll", vo);
	}
	
	public List<CSVO> CSListMy(){

		return sqlSession.selectList(namespace + ".1v1_selectMy");
	}
	
	
	public int countPage(SearchVO vo) {
		
		return sqlSession.selectOne(namespace + ".countPage", vo);
	}
	

	
	
}

package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.HOWFVO;
import edu.howf.vo.SearchVO;

@Repository
public class BoardDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.boardMapper.";
	
	public List<HOWFVO> howfSelectAll(SearchVO vo) {
		return sqlSession.selectList(namespace+"howfSelectAll", vo);
	}
	
	public int howfWrite(HOWFVO vo) {
		return sqlSession.insert(namespace+"howfWrite", vo);
	}
	
	public HOWFVO howfView(int hbidx) {
		System.out.println("hbidx : "+hbidx);
		return sqlSession.selectOne(namespace+"howfView", hbidx);
	}
}

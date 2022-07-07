package edu.howf.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.HOWFVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

@Repository
public class BoardDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.boardMapper.";
	
	public List<HOWFVO> howfSelectAll(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"howfSelectAll", vo);
	}
	
	public int howfCountAll(SearchVO vo) {
		return sqlSession.selectOne(namespace+"howfCountAll", vo);
	}
	
	public int howfWrite(HOWFVO vo) {
		return sqlSession.insert(namespace+"howfWrite", vo);
	}
	
	public HOWFVO howfView(int hbidx) {
		return sqlSession.selectOne(namespace+"howfView", hbidx);
	}
	
	public ArrayList<HOWFVO> howfHero(){
		ArrayList<HOWFVO> list = new ArrayList<HOWFVO>();
		list.add(sqlSession.selectOne(namespace+"howfHeroStay"));
		list.add(sqlSession.selectOne(namespace+"howfHeroTravel"));
		list.add(sqlSession.selectOne(namespace+"howfHeroFood"));
		
		return list;
	}
	
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

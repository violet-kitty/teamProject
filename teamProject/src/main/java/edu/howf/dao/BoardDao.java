package edu.howf.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.EventVO;
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
	
	public ArrayList<HOWFVO> howfHero(){
		ArrayList<HOWFVO> list = new ArrayList<HOWFVO>();
		list.add(sqlSession.selectOne(namespace+"howfHeroStay"));
		list.add(sqlSession.selectOne(namespace+"howfHeroTravel"));
		list.add(sqlSession.selectOne(namespace+"howfHeroFood"));
		
		return list;
	}
	
	public HOWFVO howfView(int hbidx) {
		return sqlSession.selectOne(namespace+"howfView", hbidx);
	}
	
	public int howfWrite(HOWFVO vo) {
		return sqlSession.insert(namespace+"howfWrite", vo);
	}
	
	public int howfModify(HOWFVO vo) {
		return sqlSession.update(namespace+"howfModify", vo);
	}
	
	public int howfDelete(int hbidx) {
		HeartVO vo = new HeartVO();
		vo.setBidx(hbidx);
		vo.setType("howf");
		sqlSession.delete(namespace+"howfHeartDelete", vo);
		return sqlSession.update(namespace+"howfDelete", hbidx);
	}
	
	
	public List<EventVO> eventSelectAll(SearchVO vo){
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"eventSelectAll", vo);
	}
	
	public int eventCountAll(SearchVO vo) {
		return sqlSession.selectOne(namespace+"eventCountAll", vo);
	}
	
	public List<EventVO> eventHero(){
		return sqlSession.selectList(namespace+"eventHero");
	}
	
	public EventVO eventView(int ebidx) {
		return sqlSession.selectOne(namespace+"eventView", ebidx);
	}
	
	public int eventWrite(EventVO vo) {
		return sqlSession.insert(namespace+"eventWrite", vo);
	}
	
	public int eventModify(EventVO vo) {
		return sqlSession.update(namespace+"eventModify", vo);
	}
	
	public int eventDelete(int ebidx) {
		HeartVO vo = new HeartVO();
		vo.setBidx(ebidx);
		vo.setType("event");
		sqlSession.delete(namespace+"eventHeartDelete", vo);
		return sqlSession.update(namespace+"eventDelete",ebidx);
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
	
	
	public List<EventVO> myEvent(SearchVO vo){
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"myEvent", vo);
	}
	
	public int myEventCount(SearchVO vo) {
		return sqlSession.selectOne(namespace+"myEventCount", vo);
	}
}

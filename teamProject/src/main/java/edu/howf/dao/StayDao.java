package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.CommentVO;
import edu.howf.vo.RoomVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

@Repository
public class StayDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.stayMapper.";
	
	public List<StayVO> staySelectAll(SearchVO vo) {
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"staySelectAll", vo);
	}
	
	public int stayCoountAll(SearchVO vo) {
		return sqlSession.selectOne(namespace+"stayCountAll", vo);
	}
	
	public StayVO staySelectOne(int sidx) {
		return sqlSession.selectOne(namespace+"staySelectOne", sidx);
	}
	
	public List<RoomVO> roomSelect(int sidx) {
		return sqlSession.selectList(namespace+"roomSelect", sidx);
	}
	
	public List<CommentVO> reviewSelect(SearchVO vo){
		vo.setPage((vo.getPage()-1)*vo.getPerPageNum());
		return sqlSession.selectList(namespace+"reviewSelect", vo);
	}
	
	public int reviewCount(int bidx) {
		return sqlSession.selectOne(namespace+"reviewCount", bidx);
	}
	
	public int stayInsert(StayVO vo) {
		return sqlSession.insert(namespace+"stayInsert", vo);
	}
	
	public int roomInsert(RoomVO vo) {
		return sqlSession.insert(namespace+"roomInsert", vo);
	}
	
	public int reviewInsert(CommentVO vo) {
		return sqlSession.insert(namespace+"reviewInsert", vo);
	}
	
	public float stayStar(int bidx) {
		return sqlSession.selectOne(namespace+"stayStar", bidx);
	}
}

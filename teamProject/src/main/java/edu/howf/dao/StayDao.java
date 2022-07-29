package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.CommentVO;
import edu.howf.vo.ResVO;
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
	
	public int stayModify(StayVO vo) {
		return sqlSession.update(namespace+"stayModify", vo);
	}
	
	public int revieweModify(CommentVO vo) {
		return sqlSession.update(namespace+"reviewModify", vo);
	}
	
	public int stayDelete(int sidx) {
		return sqlSession.update(namespace+"stayDelete", sidx);
	}
	
	public int roomDelete(int sidx) {
		return sqlSession.delete(namespace+"roomDelete", sidx);
	}
	
	public int reviewDelete(int cbidx) {
		return sqlSession.update(namespace+"reviewDelete", cbidx);
	}
	
	public CommentVO reviewSelectOne(int cbidx) {
		return sqlSession.selectOne(namespace+"reviewSelectOne", cbidx);
	}
	
	public int reviewDup(CommentVO vo) {
		return sqlSession.selectOne(namespace+"reviewDup", vo);
	}
	
	public int roomCnt(ResVO vo) {
		return sqlSession.selectOne(namespace+"roomCnt", vo);
	}
	
	
	//예약
	public int roomRidx(ResVO vo) {
		ResVO v = sqlSession.selectOne(namespace+"roomRidx",vo);
		return v.getRidx();
	}
	
	public int resInsert(ResVO vo) {
		return sqlSession.insert(namespace+"resInsert", vo);
	}
	
	public int resPay(String merchant) {
		return sqlSession.update(namespace+"resPay", merchant);
	}
	
	public ResVO resDup(ResVO vo) {
		return sqlSession.selectOne(namespace+"resDup", vo);
	}
	
	public int resDelete(int reidx) {
		return sqlSession.update(namespace+"resDelete", reidx);
	}
	
	public List<ResVO> resSelectAll(int midx) {
		return sqlSession.selectList(namespace+"resSelectAll", midx);
	}
	
	public int resInsertB(ResVO vo) {
		return sqlSession.insert(namespace+"resInsertB", vo);
	}
	
	public int resDeleteB(int reidx) {
		return sqlSession.update(namespace+"resDeleteB", reidx);
	}
	
	public List<ResVO> resSelectAllB(ResVO vo) {
		return sqlSession.selectList(namespace+"resSelectAllB", vo);
	}
	
}

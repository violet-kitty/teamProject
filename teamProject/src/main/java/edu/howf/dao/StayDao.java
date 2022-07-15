package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.RoomVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

@Repository
public class StayDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.stayMapper.";
	
	public List<StayVO> staySelectAll(SearchVO vo) {
		return sqlSession.selectList(namespace+"staySelectAll", vo);
	}
	
	public int stayCoountAll(SearchVO vo) {
		return sqlSession.selectOne(namespace+"stayCountAll", vo);
	}
	
	public int stayInsert(StayVO vo) {
		return sqlSession.insert(namespace+"stayInsert", vo);
	}
	
	public int roomInsert(RoomVO vo) {
		return sqlSession.insert(namespace+"roomInsert", vo);
	}
}

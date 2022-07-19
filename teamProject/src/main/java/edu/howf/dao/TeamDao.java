package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;

@Repository
public class TeamDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "edu.howf.mapper.teamMapper.";
	
	
	public List<TeamVO> teamList(SearchVO vo) {
		
		return sqlSession.selectList(namespace + "teamList");
	}
	
	public int team_cnt_update(int tidx) {
		
		return sqlSession.update(namespace + "team_cnt_update", tidx);
	}
	
	public int countPage(SearchVO vo) {
		
		return sqlSession.selectOne(namespace + "countPage", vo);
	}
	
	public TeamVO teamView(int tidx) {
		
		return sqlSession.selectOne(namespace + "teamView", tidx);
	}

}

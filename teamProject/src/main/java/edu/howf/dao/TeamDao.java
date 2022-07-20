package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.JoinVO;
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
	
	public int insert_join_apply(TeamVO tv) {
		
		return sqlSession.insert(namespace + "insert_join_apply", tv);
	}
	
	public int delete_join_apply(TeamVO tv) {
		
		return sqlSession.delete(namespace + "delete_join_apply", tv);
	}
	
	public JoinVO join_check(TeamVO tv) {

		return sqlSession.selectOne(namespace + "join_check", tv);
	}
	
	public int teamModify(TeamVO tv) {
		
		return sqlSession.update(namespace + "teamModify", tv);
	}
	
	

}

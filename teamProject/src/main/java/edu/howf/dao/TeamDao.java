package edu.howf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.CSVO;
import edu.howf.vo.JoinVO;
import edu.howf.vo.RecommendVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;
import edu.howf.vo.VoteVO;

@Repository
public class TeamDao { 
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "edu.howf.mapper.teamMapper.";
	
	
	public List<TeamVO> teamList(SearchVO vo) {
		int page = (vo.getPage()-1)*10;
		vo.setPage(page);
		return sqlSession.selectList(namespace + "teamList", vo);
	}
	
	public int countPage(SearchVO vo) {
		
		return sqlSession.selectOne(namespace + "countPage", vo);
	}
	
	public int teamWrite(TeamVO tv) {
		
		return sqlSession.insert(namespace + "teamWrite", tv);
	}
	
	public int team_channel_update(TeamVO tv) {
		
		return sqlSession.update(namespace + "team_channel_update", tv);
	}
	
	public TeamVO teamView(int tidx) {
		
		return sqlSession.selectOne(namespace + "teamView", tidx);
	}
	
	public List<TeamVO> teamTeamMemberList(int tidx) {
		
		return sqlSession.selectList(namespace + "teamTeamMemberList", tidx);
	}
	
	public TeamVO team_channel_id_select(int tidx) {
		
		return sqlSession.selectOne(namespace + "team_channel_id_select", tidx);
	}
	
	public int team_cnt_update(int tidx) {
		
		return sqlSession.update(namespace + "team_cnt_update", tidx);
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
	
	public int write_check(int midx) {
		
		return sqlSession.selectOne(namespace + "write_check", midx);
	}
	
	public int teamModify(TeamVO tv) {
		
		return sqlSession.update(namespace + "teamModify", tv);
	}
	
	public int teamDelete(int tidx) {
		
		return sqlSession.update(namespace + "teamDelete", tidx);
	}
	
	public RecommendVO teamTeamView(int tidx) {
		
		return sqlSession.selectOne(namespace + "teamTeamView", tidx);
	}
	
	public int upload_vote(RecommendVO rv) {
		
		return sqlSession.insert(namespace + "upload_vote", rv);
	}
	
	public int remove_vote(int ridx) {
		
		sqlSession.delete(namespace + "remove_voted", ridx);
		
		return sqlSession.update(namespace + "remove_vote", ridx);
	}
	
	public int insert_vote_option(VoteVO vv) {
		
		return sqlSession.insert(namespace + "insert_vote_option", vv);
	}
	
	public List<VoteVO> selected_vote_option(int ridx) {
		
		return sqlSession.selectList(namespace + "selected_vote_option", ridx);
	}
	
	public RecommendVO inserted_vote_option(int ridx) {
		
		return sqlSession.selectOne(namespace + "inserted_vote_option", ridx);
	}
	
	public int check_vote(VoteVO vv) {
		
		return sqlSession.selectOne(namespace + "check_vote", vv);
	}
	
	public int revote(VoteVO vv) {
		
		return sqlSession.delete(namespace + "revote", vv);
	}
	
	public int userReport(CSVO cv) {
		
		sqlSession.insert(namespace + "userReport", cv);
		
		return sqlSession.update(namespace + "userReport_origincsbidx_update", cv.getCsbidx());
	}


	

}

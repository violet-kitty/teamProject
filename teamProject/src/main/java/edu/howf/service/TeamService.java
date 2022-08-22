package edu.howf.service;

import java.util.List;

import edu.howf.vo.CSVO;
import edu.howf.vo.JoinVO;
import edu.howf.vo.RecommendVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;
import edu.howf.vo.VoteVO;

public interface TeamService { 
	
	public List<TeamVO> teamList(SearchVO vo);
	
	public int countPage(SearchVO vo);
	
	public int teamWrite(TeamVO tv);
	
	public int team_channel_update(TeamVO tv);
	
	public TeamVO teamView(int tidx);
	
	public List<TeamVO> teamTeamMemberList(int tidx);
	
	public TeamVO team_channel_id_select(int tidx);
	
	public int team_cnt_update(int tidx);
	
	public int insert_join_apply(TeamVO tv);
	
	public int delete_join_apply(TeamVO tv);
	
	public JoinVO join_check(TeamVO tv);
	
	public int write_check(int midx);
	
	public int teamModify(TeamVO tv);
	
	public int teamDelete(int tidx);
	
	public RecommendVO teamTeamView(int tidx);
	
	public int upload_vote(RecommendVO rv);
	
	public int remove_vote(int ridx);
	
	public int insert_vote_option(VoteVO vv);
	
	public List<VoteVO> selected_vote_option(int ridx);
	
	public int check_vote(VoteVO vv);
	
	public int revote(VoteVO vv);
	
	public int userReport(CSVO cv);
	



}

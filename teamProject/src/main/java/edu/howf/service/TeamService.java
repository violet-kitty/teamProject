package edu.howf.service;

import java.util.List;
import java.util.Map;

import edu.howf.vo.JoinVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;

public interface TeamService { 
	
	public List<TeamVO> teamList(SearchVO vo);
	
	public int countPage(SearchVO vo);
	
	public int teamWrite(TeamVO tv);
	
	public TeamVO teamView(int tidx);
	
	public int team_cnt_update(int tidx);
	
	public int insert_join_apply(TeamVO tv);
	
	public int delete_join_apply(TeamVO tv);
	
	public JoinVO join_check(TeamVO tv);
	
	public int write_check(int midx);
	
	public int teamModify(TeamVO tv);
	
	public int teamDelete(int tidx);
	
	/*
	여행 장소 추천 관련
	*/
	public Map<String, Object> getTeamPlaceList();
	
	public Map<String, Object> placeInsertPost(Map<String, Object> requestMap);
	
	public Map<String, Object> placeRecPost(Map<String, Object> requestMap);
	
	public Map<String, Object> getVotePlaceList();

}

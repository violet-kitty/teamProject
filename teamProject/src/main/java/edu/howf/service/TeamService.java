package edu.howf.service;

import java.util.List;

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

}

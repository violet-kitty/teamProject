package edu.howf.service;

import java.util.List;

import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;

public interface TeamService {
	
	public List<TeamVO> teamList(SearchVO vo);
	
	public int team_cnt_update(int tidx);
	
	public int countPage(SearchVO vo);
	
	public TeamVO teamView(int tidx);

}

package edu.howf.service;

import java.util.List;

import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;

public interface TeamService {
	
	public List<TeamVO> teamList(SearchVO vo);
	
	public int countPage(SearchVO vo);

}

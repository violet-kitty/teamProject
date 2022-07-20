package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.TeamDao;
import edu.howf.vo.JoinVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;

@Service
public class TeamServiceImple implements TeamService{
	
	@Autowired
	TeamDao teamDao;

	@Override
	public List<TeamVO> teamList(SearchVO vo) {
		
		return teamDao.teamList(vo);
	}

	@Override
	public int countPage(SearchVO vo) {
		
		return teamDao.countPage(vo);
	}

	@Override
	public int team_cnt_update(int tidx) {
		
		return teamDao.team_cnt_update(tidx);
	}

	@Override
	public TeamVO teamView(int tidx) {

		return teamDao.teamView(tidx);
	}

	@Override
	public int insert_join_apply(TeamVO tv) {
		
		return teamDao.insert_join_apply(tv);
	}

	@Override
	public int delete_join_apply(TeamVO tv) {
		
		return teamDao.delete_join_apply(tv);
	}

	@Override
	public JoinVO join_check(TeamVO tv) {

		return teamDao.join_check(tv);
	}

	@Override
	public int teamModify(TeamVO tv) {
		
		return teamDao.teamModify(tv);
	}
	
	
	
	
}

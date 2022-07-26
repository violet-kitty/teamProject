package edu.howf.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.TeamDao;
import edu.howf.vo.JoinVO;
import edu.howf.vo.RecommendVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;
import edu.howf.vo.VoteVO;

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
	public int teamWrite(TeamVO tv) {
		teamDao.teamWrite(tv);
		tv.setJoinyn("Y");
		return teamDao.insert_join_apply(tv);
	}

	@Override
	public TeamVO teamView(int tidx) {

		return teamDao.teamView(tidx);
	}

	@Override
	public int team_cnt_update(int tidx) {
		
		return teamDao.team_cnt_update(tidx);
	}

	@Override
	public int insert_join_apply(TeamVO tv) {
		tv.setJoinyn("N");
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
	public int write_check(int midx) {

		return teamDao.write_check(midx);
	}
	
	@Override
	public int teamModify(TeamVO tv) {
		
		return teamDao.teamModify(tv);
	}

	@Override
	public int teamDelete(int tidx) {

		return teamDao.teamDelete(tidx);
	}

	@Override
	public RecommendVO teamTeamView(int tidx) {
		
		return teamDao.teamTeamView(tidx);
	}

	@Override
	public int upload_vote(RecommendVO rv) {
		
		return teamDao.upload_vote(rv);
	}

	@Override
	public int remove_vote(int ridx) {
		
		return teamDao.remove_vote(ridx);
	}

	@Override
	public int vote(VoteVO vv) {
		
		return teamDao.vote(vv);
	}

	@Override
	public RecommendVO vote_option(int tidx) {
		
		RecommendVO vo = teamDao.vote_option(tidx);
		if(vo != null) {
			String[] list = vo.getPlace().split(",");
			
			List<String> l = new ArrayList<>();
			
			for(int i = 0; i < list.length; i++) {
				System.out.println("list = " + list[i]);
				l.add(list[i]);
			}
			vo.setPlaces(l);
		}
		
		return vo;
	}
	
	public int select_vote_option(int ridx) {
		
		return teamDao.select_vote_option(ridx);
	}



	
	
	
	
}

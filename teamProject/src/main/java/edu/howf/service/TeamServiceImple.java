package edu.howf.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.TeamDao;
import edu.howf.vo.CSVO;
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
	public int team_channel_update(TeamVO tv) {
		
		return teamDao.team_channel_update(tv);
	}

	@Override
	public TeamVO teamView(int tidx) {

		return teamDao.teamView(tidx);
	}
	
	@Override
	public List<TeamVO> teamTeamMemberList(int tidx){
		
		return teamDao.teamTeamMemberList(tidx);
	}

	@Override
	public TeamVO team_channel_id_select(int tidx) {
		
		return teamDao.team_channel_id_select(tidx);
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
	public int insert_vote_option(VoteVO vv) {
		
		return teamDao.insert_vote_option(vv);
	}

	@Override
	public List<VoteVO> selected_vote_option(int ridx) {
		
		 RecommendVO v = teamDao.inserted_vote_option(ridx);
		 List<VoteVO> vo = teamDao.selected_vote_option(ridx);
		 
		 List<VoteVO> list = new ArrayList<VoteVO>();
		 //place 정보 넣기
		 if(v.getPlace1()!=null) {
			 VoteVO vote = new VoteVO();
			 vote.setVote(v.getPlace1());
			 list.add(vote);
		 }
		 if(v.getPlace2()!=null) {
			 VoteVO vote = new VoteVO();
			 vote.setVote(v.getPlace2());
			 list.add(vote);
		 }
		 if(v.getPlace3()!=null) {
			 VoteVO vote = new VoteVO();
			 vote.setVote(v.getPlace3());
			 list.add(vote);
		 }
		 if(v.getPlace4()!=null) {
			 VoteVO vote = new VoteVO();
			 vote.setVote(v.getPlace4());
			 list.add(vote);
		 }
		 if(v.getPlace5()!=null) {
			 VoteVO vote = new VoteVO();
			 vote.setVote(v.getPlace5());
			 list.add(vote);
		 }
		 
		 //vote 숫자 넣기
		 for(VoteVO vv : vo) {
			 if(v.getPlace1()!= null && v.getPlace1().equals(vv.getVote())) {
				 list.get(0).setCnt(vv.getCnt());
			 }
			 else if(v.getPlace2()!= null && v.getPlace2().equals(vv.getVote())) {
				 list.get(1).setCnt(vv.getCnt());
			 }
			 else if(v.getPlace3()!= null && v.getPlace3().equals(vv.getVote())) {
				 list.get(2).setCnt(vv.getCnt());
			 }
			 else if(v.getPlace4()!= null && v.getPlace4().equals(vv.getVote())) {
				 list.get(3).setCnt(vv.getCnt());
			 }
			 else if(v.getPlace5()!= null && v.getPlace5().equals(vv.getVote())) {
				 list.get(4).setCnt(vv.getCnt());
			 }
		 }
		 
		return list;
	}

	@Override
	public int check_vote(VoteVO vv) {
		
		return teamDao.check_vote(vv);
	}

	@Override
	public int revote(VoteVO vv) {
		
		return teamDao.revote(vv);
	}

	@Override
	public int userReport(CSVO cv) {
		
		return teamDao.userReport(cv);
	}

	
	




	
	
	
	
}

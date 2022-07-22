package edu.howf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map<String, Object> getTeamPlaceList() {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> resultMapList = teamDao.getPlaceList();
		
		resultMap.put("data", resultMapList);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> placeInsertPost(Map<String, Object> requestMap) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int checkNo = teamDao.placeDuplicationCheck(requestMap);
		
		if(checkNo != 0) {
			resultMap.put("place_cd", "001");
			resultMap.put("place_msg", "중복된 장소입니다.");
		}
		else {
			if(teamDao.placeInsertPost(requestMap) <= 0) {
				resultMap.put("place_cd", "001");
				resultMap.put("place_msg", "등록에 실패하였습니다.");
			}
			else {
				resultMap.put("place_cd", "000");
				resultMap.put("place_msg", "등록이 완료되었습니다.");
			}
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> placeRecPost(Map<String, Object> requestMap) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int checkRec = teamDao.placeRecCheck(requestMap);
		
		if(checkRec == 0) {
			if(teamDao.placeRecPost(requestMap) <= 0) {
				resultMap.put("place_cd", "001");
				resultMap.put("place_msg", "추천에 실패하였습니다.");
			} else {
				resultMap.put("place_cd", "000");
				resultMap.put("place_msg", "추천 되었습니다.");
			}
		} else {
			resultMap.put("place_cd", "001");
			resultMap.put("place_msg", "장소 추천을 이미 하셨습니다.");
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> getVotePlaceList() {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> resultMapList = teamDao.getVotePlaceList(); 
		
		resultMap.put("resultList", resultMapList);
		
		return resultMap;
	}

	
	
	
	
}

package edu.howf.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.JoinVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;

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
	
	public TeamVO teamView(int tidx) {
		
		return sqlSession.selectOne(namespace + "teamView", tidx);
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
	
	/*
	 * 여행 장소 추천 관련
	 */
	public List<Map<String, Object>> getPlaceList(){
		
		return sqlSession.selectList(namespace + "getPlaceList");
	}
	
	public int placeInsertPost(Map<String, Object> requestMap){
		
		return sqlSession.insert(namespace + "placeInsertPost", requestMap);
	}
	
	public int placeDuplicationCheck(Map<String, Object> requestMap){
		
		return sqlSession.selectOne(namespace + "placeDuplicationCheck", requestMap);
	}
	
	public int placeRecPost(Map<String, Object> requestMap){
		return sqlSession.insert(namespace + "placeRecPost", requestMap);
	}
	
	public int placeRecCheck(Map<String, Object> requestMap){
		return sqlSession.selectOne(namespace+ "placeRecCheck", requestMap);
	}
	
	public List<Map<String, Object>> getVotePlaceList(){
		return sqlSession.selectList(namespace + "getVotePlaceList");
	}
	
	

}

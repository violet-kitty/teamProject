package edu.howf.service;

import java.util.List;

import edu.howf.vo.CommentVO;
import edu.howf.vo.ResVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

public interface StayService {
	public List<StayVO> staySelectAll(SearchVO vo);
	public int stayCountAll(SearchVO vo);
	public List<StayVO> stayHero();
	public StayVO staySelectOne(ResVO vo);
	public List<CommentVO> reviewSelect(SearchVO vo);
	public int reviewCount(int bidx);
	public int stayInsert(StayVO vo);
	public int reviewInsert(CommentVO vo);
	public float stayStar(int bidx);
	public int stayModify(StayVO vo);
	public int reviewModify(CommentVO vo);
	public int stayDelete(int sidx);
	public int reviewDelete(int cbidx);
	public CommentVO reviewSelectOne(int cbidx);
	public int reviewDup(CommentVO vo);
	
	//예약
	public int roomRidx(ResVO vo);
	public int resInsert(ResVO vo);
	public int resPay(ResVO vo);
	public ResVO resDup(ResVO vo);
	public int resDelete(int reidx);
	public List<ResVO> resSelectAll(SearchVO vo);
	public int resCountAll(SearchVO vo);
	public int resInsertB(ResVO vo);
	public int resDeleteB(int reidx, CommentVO vo);
	public String merchantSelect(int reidx);
	public List<ResVO> resSelectAllB(ResVO vo);
	public List<StayVO> myStayAll(int midx);
}

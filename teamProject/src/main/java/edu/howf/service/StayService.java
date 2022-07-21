package edu.howf.service;

import java.util.List;

import edu.howf.vo.CommentVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

public interface StayService {
	public List<StayVO> staySelectAll(SearchVO vo);
	public int stayCountAll(SearchVO vo);
	public StayVO staySelectOne(int sidx);
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
}

package edu.howf.service;

import java.util.List;

import edu.howf.vo.RoomVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

public interface StayService {
	public List<StayVO> staySelectAll(SearchVO vo);
	public int stayCountAll(SearchVO vo);
	public StayVO staySelectOne(int sidx);
	public int stayInsert(StayVO vo);
}

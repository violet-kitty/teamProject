package edu.howf.service;

import java.util.List;

import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;

public interface StayService {
	public List<StayVO> staySelectAll(SearchVO vo);
	public int stayCountAll(SearchVO vo);
	public int stayInsert(StayVO vo);
}

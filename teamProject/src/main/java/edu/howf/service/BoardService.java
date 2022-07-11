package edu.howf.service;

import java.util.List;

import edu.howf.vo.EventVO;
import edu.howf.vo.HOWFVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

public interface BoardService {
	public List<HOWFVO> howfSelectAll(SearchVO vo);
	public int howfCountAll(SearchVO vo);
	public List<HOWFVO> howfHero();
	public HOWFVO howfView(int hbidx);
	public int howfWrite(HOWFVO vo);
	public int howfModify(HOWFVO vo);
	public int howfDelete(int hbidx);
	
	public List<EventVO> eventSelectAll(SearchVO vo);
	public int eventCountAll(SearchVO vo);
	public List<EventVO> eventHero();
	public EventVO eventView(int ebidx);
	public int eventWrite(EventVO vo);
	public int eventModify(EventVO vo);
	public int eventDelete(int ebidx);
	
	public int heartInsert(HeartVO vo);
	public int heartDelete(HeartVO vo);
	public int heartDup(HeartVO vo);
}

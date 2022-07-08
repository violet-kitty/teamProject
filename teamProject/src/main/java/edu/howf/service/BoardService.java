package edu.howf.service;

import java.util.List;

import edu.howf.vo.HOWFVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

public interface BoardService {
	public List<HOWFVO> howfSelectAll(SearchVO vo);
	public int howfCountAll(SearchVO vo);
	public int howfWrite(HOWFVO vo);
	public HOWFVO howfView(int hbidx);
	public List<HOWFVO> howfHero();
	public int howfModify(HOWFVO vo);
	public int howfDelete(int hbidx);
	public int heartInsert(HeartVO vo);
	public int heartDelete(HeartVO vo);
	public int heartDup(HeartVO vo);
}

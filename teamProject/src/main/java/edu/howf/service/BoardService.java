package edu.howf.service;

import java.util.List;

import edu.howf.vo.HOWFVO;
import edu.howf.vo.SearchVO;

public interface BoardService {
	public List<HOWFVO> howfSelectAll(SearchVO vo);
	public int howfWrite(HOWFVO vo);
	public HOWFVO howfView(int hbidx);
}

package edu.howf.service;

import java.util.List;

import edu.howf.vo.FaqVO;
import edu.howf.vo.SearchVO;

public interface FaqService {
	
	public int insertfaq(FaqVO vo);
	public List<FaqVO> list(SearchVO searchVO);
	public int pagecount(SearchVO searchVO);
	public int faqmodify(FaqVO vo);
	public FaqVO selectone(int fbidx);
	public int delfaq(FaqVO vo);
	
}

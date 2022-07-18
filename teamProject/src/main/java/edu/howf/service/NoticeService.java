package edu.howf.service;

import java.util.List;

import edu.howf.vo.Criteria;
import edu.howf.vo.NoticeVO;
import edu.howf.vo.SearchVO;

public interface NoticeService {
	
	public int insertnotice(NoticeVO vo);
	public List<NoticeVO> list(SearchVO searchVO);
	public NoticeVO selectone(int nbidx);
	public int noticemodify(NoticeVO vo);
	public int noticedelete(int nbidx);
	public int pagecount(SearchVO searchVO);
	public int noticecnt(int nbidx);
}

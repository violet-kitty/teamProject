package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.NoticeDao;
import edu.howf.vo.Criteria;
import edu.howf.vo.NoticeVO;
import edu.howf.vo.SearchVO;

@Service
public class NoticeServiceImple implements NoticeService{
	@Autowired
	NoticeDao noticeDao;

	@Override
	public int insertnotice(NoticeVO vo) {
		
		return noticeDao.insertnotice(vo);
	}

	@Override
	public List<NoticeVO> list(SearchVO searchVO) {
		
		return noticeDao.selectAll(searchVO);
	}

	@Override
	public NoticeVO selectone(int nbidx) {
		// TODO Auto-generated method stub
		return noticeDao.selectone(nbidx);
	}

	@Override
	public int noticemodify(NoticeVO vo) {
		
		return noticeDao.noticemodify(vo);
	}

	@Override
	public int noticedelete(int nbidx) {
		
		return noticeDao.noticedelete(nbidx);
	}

	@Override
	public int pagecount(SearchVO searchVO) {
		
		
		return noticeDao.pagecount(searchVO);
	}

	@Override
	public int noticecnt(int nbidx) {
		
		return noticeDao.noticecnt(nbidx);
	}
	
	@Override
	public NoticeVO noticepop() {
		
		return noticeDao.noticepop();
	}

}

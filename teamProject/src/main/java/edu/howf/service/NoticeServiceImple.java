package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.NoticeDao;
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
}

package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.BoardDao;
import edu.howf.vo.EventVO;
import edu.howf.vo.HOWFVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

@Service
public class BoardServiceImple implements BoardService{
	@Autowired
	BoardDao boardDao;

	//howf 추천
	@Override
	public List<HOWFVO> howfSelectAll(SearchVO vo) {
		return boardDao.howfSelectAll(vo);
	}
	
	@Override
	public int howfCountAll(SearchVO vo) {
		return boardDao.howfCountAll(vo);
	}

	@Override
	public List<HOWFVO> howfHero() {
		return boardDao.howfHero();
	}
	
	@Override
	public HOWFVO howfView(int hbidx) {
		return boardDao.howfView(hbidx);
	}
	
	@Override
	public int howfWrite(HOWFVO vo) {
		return boardDao.howfWrite(vo);
	}
	
	@Override
	public int howfModify(HOWFVO vo) {
		return boardDao.howfModify(vo);
	}
	
	@Override
	public int howfDelete(int hbidx) {
		return boardDao.howfDelete(hbidx);
	}
	
	
	
	// 지역 이벤트
	@Override
	public List<EventVO> eventSelectAll(SearchVO vo) {
		return boardDao.eventSelectAll(vo);
	}

	@Override
	public int eventCountAll(SearchVO vo) {
		return boardDao.eventCountAll(vo);
	}

	@Override
	public List<EventVO> eventHero() {
		return boardDao.eventHero();
	}

	@Override
	public EventVO eventView(int ebidx) {
		return boardDao.eventView(ebidx);
	}

	@Override
	public int eventWrite(EventVO vo) {
		return boardDao.eventWrite(vo);
	}

	@Override
	public int eventModify(EventVO vo) {
		return boardDao.eventModify(vo);
	}

	@Override
	public int eventDelete(int ebidx) {
		return boardDao.eventDelete(ebidx);
	}
	
	

	@Override
	public int heartInsert(HeartVO vo) {
		return boardDao.heartInsert(vo);
	}

	@Override
	public int heartDelete(HeartVO vo) {
		return boardDao.heartDelete(vo);
	}

	@Override
	public int heartDup(HeartVO vo) {
		return boardDao.heartDup(vo);
	}

	
	@Override
	public List<EventVO> myEvent(SearchVO vo) {
		return boardDao.myEvent(vo);
	}

	@Override
	public int myEventCount(SearchVO vo) {
		return boardDao.myEventCount(vo);
	}
}

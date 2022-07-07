package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.BoardDao;
import edu.howf.vo.HOWFVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.SearchVO;

@Service
public class BoardServiceImple implements BoardService{
	@Autowired
	BoardDao boardDao;

	@Override
	public List<HOWFVO> howfSelectAll(SearchVO vo) {
		return boardDao.howfSelectAll(vo);
	}
	
	@Override
	public int howfCountAll(SearchVO vo) {
		return boardDao.howfCountAll(vo);
	}

	@Override
	public int howfWrite(HOWFVO vo) {
		return boardDao.howfWrite(vo);
	}

	@Override
	public HOWFVO howfView(int hbidx) {
		return boardDao.howfView(hbidx);
	}

	@Override
	public List<HOWFVO> howfHero() {
		return boardDao.howfHero();
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
}

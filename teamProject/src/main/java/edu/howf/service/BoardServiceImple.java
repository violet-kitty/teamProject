package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.BoardDao;
import edu.howf.vo.HOWFVO;
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
	public int howfWrite(HOWFVO vo) {
		return boardDao.howfWrite(vo);
	}

	@Override
	public HOWFVO howfView(int hbidx) {
		return boardDao.howfView(hbidx);
	}
}

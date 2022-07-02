package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.CSDao;
import edu.howf.vo.CSVO;
import edu.howf.vo.SearchVO;

@Service
public class CSServiceImple implements CSService{
	
	@Autowired
	CSDao csDao;

//	@Override
//	public List<CSVO> CSList(SearchVO vo) {
//		
//		return csDao.CSList(vo);
//	}
//
//	@Override
//	public int countPage(SearchVO vo) {
//		
//		return csDao.countPage(vo);
//	}
//
//	@Override
//	public int CS_write(CSVO vo) {
//		
//		return csDao.CS_write(vo);
//	}
	
	
}

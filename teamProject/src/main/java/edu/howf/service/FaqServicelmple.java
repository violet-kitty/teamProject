package edu.howf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.FaqDao;
import edu.howf.vo.FaqVO;
import edu.howf.vo.SearchVO;

@Service
public class FaqServicelmple implements FaqService{
	
	@Autowired
	FaqDao faqDao;

	@Override
	public int insertfaq(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqDao.insertfaq(vo);
	}

	
	@Override
	public List<FaqVO> list(SearchVO searchVO) {
		
		return faqDao.selectList(searchVO);
	}

	@Override
	public int pagecount(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return faqDao.pagecount(searchVO);
	}

	@Override
	public int faqmodify(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqDao.faqmodify(vo);
	}

	@Override
	public FaqVO selectone(int fbidx) {
		// TODO Auto-generated method stub
		return faqDao.selectone(fbidx);
	}

	@Override
	public int delfaq(int fbidx) {
		// TODO Auto-generated method stub
		return faqDao.delfaq(fbidx);
	}



}

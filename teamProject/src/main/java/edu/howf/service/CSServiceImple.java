package edu.howf.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.CSDao;
import edu.howf.vo.CSVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

@Service
public class CSServiceImple implements CSService{
	
	@Autowired
	CSDao csDao;

	@Override
	public List<CSVO> CSList(SearchVO vo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		if(login.getRole().equals("admin")) {
			return csDao.CSListAll(vo);
		}
		else {
			return csDao.CSListMy();
		}
		
	}

	@Override
	public int countPage(SearchVO vo) {
		
		return csDao.countPage(vo);
	}

	@Override
	public int CS_write(CSVO vo) {
		
		return csDao.CS_write(vo);
	}
	
	
}

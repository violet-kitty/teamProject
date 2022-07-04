package edu.howf.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import edu.howf.vo.CSVO;
import edu.howf.vo.SearchVO;

public interface CSService {
	
	public List<CSVO> CSList(SearchVO vo, HttpServletRequest request, HttpSession session);
	
	public int countPage(SearchVO vo);
	
	public int CS_write(CSVO vo);

}

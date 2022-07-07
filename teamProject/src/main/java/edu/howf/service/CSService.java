package edu.howf.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import edu.howf.vo.CSVO;
import edu.howf.vo.SearchVO;

public interface CSService {
	
	public List<CSVO> CSList(SearchVO vo, HttpServletRequest request, HttpSession session);
	
	public int countPage(SearchVO vo, String role);
	
	public int CS_write(CSVO vo);
	
	public CSVO csList_view(int csbidx);
	
	public int csList_reply(CSVO vo);
	
	public List<CSVO> csList_reply_view(int origincsbidx);
	
	public int csList_modify(CSVO vo);
	
	public int csList_delete(int csbidx);
	
	public int csReply_modify(CSVO vo);

}

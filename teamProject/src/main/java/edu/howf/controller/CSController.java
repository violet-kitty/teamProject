package edu.howf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.howf.service.CSService;
import edu.howf.vo.CSVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

//1:1문의, FAQ
@RequestMapping(value="/csBoard")
@Controller
public class CSController {
	
	@Autowired
	CSService csService;
	
	@RequestMapping(value = "csList.do", method = RequestMethod.GET)
	public String CSList(Model model, SearchVO vo, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/user/login.do";
		}
		else {
			if(vo.getPage()<1) vo.setPage(1);
			int page = vo.getPage();
			vo.setMidx(login.getMidx());
			List<CSVO> cv = csService.CSList(vo, request, session);
			
			model.addAttribute("login", login);
			model.addAttribute("cv", cv);
			
			int cnt = csService.countPage(vo, login.getRole());
			
			PageMaker pm = new PageMaker();
			vo.setPage(page);
			pm.setSearch(vo);
			pm.setTotalCount(cnt);
			
			model.addAttribute("pm", pm);
			
			
			return "csBoard/csList";
		}
		
	}
	
	
}

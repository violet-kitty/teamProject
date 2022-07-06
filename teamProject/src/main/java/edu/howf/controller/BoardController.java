package edu.howf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.howf.service.BoardService;
import edu.howf.vo.HOWFVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

@RequestMapping(value={"/howf","/event"})
@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/howfList.do")
	public String howfList(SearchVO vo, Model model) {
		List<HOWFVO> howf = boardService.howfSelectAll(vo);
		
		model.addAttribute("vo", howf);
		
		return "board/howfList";
	}
	
	@RequestMapping(value="/howfWrite.do", method=RequestMethod.GET)
	public String howfWrite() {
		return "board/howfWrite";
	}
	
	@RequestMapping(value="/howfWrite.do", method=RequestMethod.POST)
	public String howfWrite(HOWFVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		System.out.println("content:"+vo.getContent());
		System.out.println("size : "+vo.getContent().length());
		int result = boardService.howfWrite(vo);
		
		return "redirect:/howf/howfList.do";
	}
	
	@RequestMapping(value="/howfView.do")
	public String howfView(int hbidx, Model model) {
		HOWFVO vo = boardService.howfView(hbidx);
		
		model.addAttribute("vo", vo);
		
		return "board/howfView";
	}
}

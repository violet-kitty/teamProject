package edu.howf.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.howf.service.TeamService;
import edu.howf.vo.JoinVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;
import edu.howf.vo.UserVO;

@RequestMapping(value = "/team")
@Controller
public class TeamController {
	
	@Autowired
	TeamService teamService;
	
	@Autowired
	String uploadPath;
	
	@RequestMapping(value = "/teamList.do", method = RequestMethod.GET)
	public String teamList(Model model, SearchVO vo) {
		
		if(vo.getPage() < 1) {
			vo.setPage(1);
		}
		int page = vo.getPage();
		
		List<TeamVO> tv = teamService.teamList(vo);
		model.addAttribute("tv", tv);
		
		int cnt = teamService.countPage(vo);
		
		PageMaker pm = new PageMaker();
		vo.setPage(page);
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		model.addAttribute("pm", pm);
		
		return "team/teamList";
	}
	
	@GetMapping("teamView.do")
	public String teamView(int tidx, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("visit")) {
				visitor = 1;
				
				if(cookie.getValue().contains(request.getParameter("tidx"))) {					
				}
				else {
					cookie.setValue(cookie.getValue() + "_" + request.getParameter("tidx"));
					response.addCookie(cookie);
					int result = teamService.team_cnt_update(tidx);
				}
			}
		}
		if(visitor == 0) {
			Cookie cookie1 = new Cookie("visit", request.getParameter("tidx"));
			response.addCookie(cookie1);
			
			int result = teamService.team_cnt_update(tidx);
		}
		
		TeamVO tv = teamService.teamView(tidx);
		model.addAttribute("tv", tv);
		
		session = request.getSession();
		UserVO uv = (UserVO)session.getAttribute("login");
		tv.setMidx(uv.getMidx());
		
		JoinVO check = teamService.join_check(tv);
		model.addAttribute("check", check);
		
		return "team/teamView";
	}
	
	@ResponseBody
	@GetMapping("/join_apply.do")
	public int join(TeamVO tv, HttpServletRequest request, HttpSession session) {

		session = request.getSession();
		UserVO uv = (UserVO)session.getAttribute("login");
		tv.setMidx(uv.getMidx());
		
		return teamService.insert_join_apply(tv);
	}
	
	@ResponseBody
	@GetMapping("/join_apply_cancel.do")
	public int join_cancel(TeamVO tv, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO uv = (UserVO)session.getAttribute("login");		
		tv.setMidx(uv.getMidx());
		
		return teamService.delete_join_apply(tv);
	}
	
	@GetMapping("/teamModify.do")
	public String teamModify(TeamVO tv, Model model, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");		
		tv.setMidx(login.getMidx());
		
		tv = teamService.teamView(tv.getTidx());
		
		model.addAttribute("login", login);
		model.addAttribute("tv", tv);
	
		return "team/teamModify";
	}
	
	@PostMapping("/teamModify.do")
	public String teamModify(TeamVO tv) {
		
		int result = teamService.teamModify(tv);
		
		return "redirect:/team/teamView.do?tidx=" + tv.getTidx();
	}

	
	
	
	
}

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
import edu.howf.vo.RecommendVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.TeamVO;
import edu.howf.vo.UserVO;
import edu.howf.vo.VoteVO;

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
		vo.setPerPageNum(15);
		List<TeamVO> tv = teamService.teamList(vo);
		
		model.addAttribute("tv", tv);
		model.addAttribute("vo", vo);
		
		int cnt = teamService.countPage(vo);
		
		PageMaker pm = new PageMaker();
		vo.setPage(page);
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		model.addAttribute("pm", pm);
		
		return "team/teamList";
	}
	
	@GetMapping("/teamWrite.do")
	public String teamWrite() {
		
		return "team/teamWrite";
	}
	
	@PostMapping("/teamWrite.do")
	public String teamWrite(TeamVO tv, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		tv.setMidx(login.getMidx());
		
		int result = teamService.teamWrite(tv);
		
		return "redirect:/team/teamList.do";
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
		
		int midx = tv.getMidx();
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		if(login != null) {
			tv.setMidx(login.getMidx());
			JoinVO check = teamService.join_check(tv);
			model.addAttribute("check", check);
		}
		tv.setMidx(midx);
		model.addAttribute("tv", tv);
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
	
	@ResponseBody
	@GetMapping("write_check.do")
	public int write_check(int midx) {
		
		return teamService.write_check(midx);
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
		if(tv.getApplyyn() == null) tv.setApplyyn("N");
		
		int result = teamService.teamModify(tv);
		
		return "redirect:/team/teamView.do?tidx=" + tv.getTidx();
	}
	
	@GetMapping("/teamDelete.do")
	public String teamDelete(int tidx) {
		
		int result = teamService.teamDelete(tidx);
		
		return "redirect:/team/teamList.do";
	}
	
	@GetMapping("teamTeam.do")
	public String teamTeam(int tidx, Model model) {
		
		RecommendVO rv = teamService.teamTeamView(tidx);
		
		model.addAttribute("rv", rv);
		model.addAttribute("tidx", tidx);
		
		return "team/teamTeam";
	}
	
	@ResponseBody
	@PostMapping("upload_vote.do")
	public int upload_vote(RecommendVO rv, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");		
		rv.setMidx(login.getMidx());
		
		StringBuilder places = new StringBuilder("");
		for(int i = 0; i < rv.getPlaces().size(); i++) {
			places.append(rv.getPlaces().get(i)+",");
		}
		String place2 = places.toString();
		rv.setPlace(place2.substring(0, place2.length()-1));
		
		teamService.upload_vote(rv);
		return rv.getRidx();
	}
	
	@ResponseBody
	@PostMapping("vote.do")
	public int vote(VoteVO vv, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");		
		vv.setMidx(login.getMidx());
		

		
		return teamService.vote(vv);
	}
	
	

	
	
	
	
}

package edu.howf.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/*
	 * 여행 장소 추천 관련
	 */
	@GetMapping("teamPlaceList.do")
	public String getTeamPlaceListPage() {
		
		return "team/teamPlaceList";
	}
	
	
	@SuppressWarnings("unchecked")
	@PostMapping("getTeamPlaceList")
	@ResponseBody
	public Map<String, Object> getTeamPlaceList(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		session = request.getSession();
		Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
		
		model.addAttribute("login", login);
		
		return teamService.getTeamPlaceList();
	}
	
	@PostMapping("placeInsertPost")
	@ResponseBody
	public Map<String, Object> placeInsertPost(@RequestParam Map<String, Object> requestMap){
		
		return teamService.placeInsertPost(requestMap);
	}
	
	@PostMapping
	@ResponseBody
	public Map<String, Object> placeRecPost(@RequestParam Map<String, Object> requestMap){
		
		return teamService.placeRecPost(requestMap);
	}
	
	@GetMapping("placeVote")
	public String getPlaceVotePage(){
		
		return "team/teamPlaceVote";
	}
	
	@PostMapping("getVotePlaceList")
	@ResponseBody
	public Map<String, Object> getVotePlaceList(){
		
		return teamService.getVotePlaceList();
	}

	
	
	
	
}

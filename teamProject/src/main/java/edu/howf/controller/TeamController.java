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
import oracle.jdbc.proxy.annotation.Post;

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
		model.addAttribute("tv", tv);
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		tv.setMidx(login.getMidx());
		
//		글 보기 페이지로 이동시
//		이 사람이 가입을 했는지 안했는지 확인하려고
//		join_check 로 가입 여부를 DB의 jointable에서 가져옴
//
//		가입신청 버튼을 클릭하지 못했거나 or 가입신청 취소 시 가입여부에 대한 데이터가 join_table에 없음
//
//		그런데 글 보기 페이지로 가면 컨트롤러에선 
//		해당 tidx에 대한 join_check를 요청함(데이터가 없는 상태)
		
		System.out.println("check 값 담기 전");
		JoinVO check = teamService.join_check(tv);
		System.out.println("check 값 담은 후");
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
		if(tv.getApplyyn() == null) tv.setApplyyn("N");
		
		int result = teamService.teamModify(tv);
		
		return "redirect:/team/teamView.do?tidx=" + tv.getTidx();
	}
	
	@GetMapping("/teamDelete.do")
	public String teamDelete(int tidx) {
		
		int result = teamService.teamDelete(tidx);
		
		return "redirect:/team/teamList.do";
	}

	
	
	
	
}

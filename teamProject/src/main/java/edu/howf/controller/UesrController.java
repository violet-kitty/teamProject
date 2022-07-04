package edu.howf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.howf.service.UserService;
import edu.howf.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UesrController {
	@Autowired
	UserService userService;
	
	//로그인 페이지로 이동
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//로그인 액션
	//파일 받아오게 바꿔줘야함
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(UserVO vo,HttpServletRequest request, HttpSession session) {
		UserVO login = userService.login(vo);
		
		if(login != null) {
			session = request.getSession();
			session.setAttribute("login", login);
			
			return "redirect:/";
		}
		else {
			//만약 로그인에 실패할 경우
			//추후 메시지 띄워주게 변경 혹은 ajax 사용
			return "user/login";
		}
	}
	
	//소셜 로그인
	@ResponseBody
	@RequestMapping(value="/socialLogin.do")
	public String social(UserVO vo, String accessToken, HttpServletRequest request, HttpSession session) {
		int midx = userService.socialLogin(vo);
		session = request.getSession();
		vo.setMidx(midx);
		vo.setRole("normal");
		
		session.setAttribute("token", accessToken);
		
		String nickname = userService.nicknameSelect(vo.getEmail());
		if(nickname == null) {
			session.setAttribute("login", vo);
			return "0";
		}
		else {
			vo.setNickname(nickname);
			session.setAttribute("login", vo);
			return "1";
		}
	}
	
	//소셜 첫 로그인 시 닉네임 받기
	@RequestMapping(value="/nicknameInsert.do")
	public String nickname(UserVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setEmail(login.getEmail());
		
		int result = userService.nicknameInsert(vo);
		login.setNickname(vo.getNickname());
		session.setAttribute("login", login);
		
		return "redirect:/";
	}
	
	//회원가입 - 회원 종류 선택 페이지로 이동
	@RequestMapping(value="/joinSelect.do", method=RequestMethod.GET)
	public String join() {
		return "user/joinSelect";
	}
	
	//일반 회원가입 이동
	@RequestMapping(value="/normalJoin.do")
	public String normalJoin() {
		return "user/normalJoin";
	}
	
	//사업자 회원가입 이동
	@RequestMapping(value="/businessJoin.do")
	public String businessJoin() {
		return "user/businessJoin";
	}
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/emailDup.do", method=RequestMethod.POST)
	public int emailDup(String email) {
		int result = userService.emailDup(email);
		return result;
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value="/nicknameDup.do", method=RequestMethod.POST)
	public int nicknameDup(String nickname) {
		int result = userService.nicknameDup(nickname);
		return result;
	}
	
	//일반 회원가입 액션
	@RequestMapping(value="/join.do")
	public String join(UserVO vo) {
		System.out.println("회원가입");
		int result = userService.userInsert(vo);
		
		//로그인 성공시
		if(result >= 1) {
			return "redirect:/";
		}
		else {//로그인 실패시
			return "redirect:/user/login.do";
		}
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
}

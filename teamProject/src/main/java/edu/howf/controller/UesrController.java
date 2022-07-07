package edu.howf.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.UserService;
import edu.howf.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UesrController {
	@Autowired
	UserService userService;
	
	String path = "C:\\upload";
	
	//로그인 페이지로 이동
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//로그인 액션
	@ResponseBody
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(UserVO vo,HttpServletRequest request, HttpSession session) {
		UserVO login = userService.login(vo);
		
		//로그인 정보 있다면
		if(login != null) {
			//만약 승인된 경우
			if(login.getJoinyn().equals("Y")) {
				System.out.println("승인된 회원");
				session = request.getSession();
				session.setAttribute("login", login);
				
				return "Y";
			}
			//승인이 되지 않은 경우
			else {
				System.out.println("승인되지 않은 회원");
				return "N";
			}
		}
		else {
			//로그인 실패(회원 존재하지 않음)
			System.out.println("회원 정보 일치하지 않음");
			return "FAIL";
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
		
		//닉네임 업데이트 해주기
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
	
	//회원가입 액션
	@RequestMapping(value="/join.do")
	public String join(MultipartFile file, UserVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		//파일 받아오는 처리
		if(file != null) {
			File dir = new File(path+"\\document");
			
			if(!dir.exists()) dir.mkdirs();
			
			if(!file.getOriginalFilename().isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString()+"_"+file.getOriginalFilename();
				file.transferTo(new File(path+"\\document",fileName));
				vo.setDocument(fileName);
			}
			else {
				//일반회원은 파일이 없지
				System.out.println("입력된 파일 없음");
			}
		}
		
		//DB에 저장
		int result = userService.userInsert(vo);
		
		//회원가입 성공시
		if(result >= 1) {
			return "redirect:/";
		}
		else {//회원가입 실패시
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

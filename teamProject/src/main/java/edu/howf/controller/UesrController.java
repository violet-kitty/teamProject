package edu.howf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.howf.service.UserService;
import edu.howf.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UesrController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(UserVO vo,HttpServletRequest request, HttpSession session) {
		
		return "";
	}
	
	@RequestMapping(value="/kakao.do")
	public String kakao() {
		
		return "redirect:/";
	}
	
	@RequestMapping(value="google.do")
	public String google() {
		
		return "redirect:/";
	}
}

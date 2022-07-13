package edu.howf.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import edu.howf.service.UserService;
import edu.howf.vo.AutoVO;
import edu.howf.vo.UserVO;

//자동 로그인 쿠키가 있을 경우 동작하는 인터셉터
public class AutoLoginInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//쿠키 가져오기
		Cookie cookie = WebUtils.getCookie(request, "autoLoginMidx");
		
		if(cookie != null) {
			Cookie cookie2 = WebUtils.getCookie(request, "autoLoginToken");
			String midx = cookie.getValue();
			String token = cookie2.getValue();
			
			//autoLogin 테이블의 토큰값과 비교
			AutoVO vo = new AutoVO();
			vo.setMidx(Integer.parseInt(midx));
			vo.setToken(token);
			int result = userService.autoLogin(vo);
			
			if(result!=0) {
				//회원정보 가져오기
				UserVO login = userService.autoLogin(Integer.parseInt(midx));
				
				//세션에 담기(로그인 처리)
				if(login != null) {
					HttpSession session = request.getSession();
					session.setAttribute("login", login);
				}
			}
			
		}
		
		//리턴값을 false로 하면 controller로 넘어가지 않음
		return true;
	}
}

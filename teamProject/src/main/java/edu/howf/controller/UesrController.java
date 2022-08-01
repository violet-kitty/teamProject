package edu.howf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.BoardService;
import edu.howf.service.StayService;
import edu.howf.service.UserService;
import edu.howf.util.MediaUtils;
import edu.howf.util.SMTP;
import edu.howf.vo.AutoVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.ResVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UesrController {
	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	StayService stayService;
	
	@Autowired
	String uploadPath;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//로그인 페이지로 이동
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//로그인 액션
	@ResponseBody
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(String autoLogin, UserVO vo,HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		UserVO login = userService.login(vo);
		
		//로그인 정보 있다면
		if(login != null) {
			//비밀번호가 null인 경우(소셜 회원)
			if(login.getPassword() == null) {
				return "SOCIAL";
			}
			//만약 승인된 경우
			if(login.getJoinyn().equals("Y")) {
				
				//입력값과 인코딩된 비밀번호가 match 되는지 확인
				Boolean pwdCheck = passwordEncoder.matches(vo.getPassword(), login.getPassword());
				
				
				
				//비밀번호 일치하는 경우
				if(pwdCheck == true) {
					session = request.getSession();
					session.setAttribute("login", login);
					
					//만약 자동로그인 체크했다면 
					if(autoLogin != null) {
						//이전에 테이블에 저장된 정보 삭제
						userService.autoLoginDelete(login.getMidx());
						//이전 쿠키 제거
						Cookie c1 = new Cookie("autoLoginMidx",null);
						c1.setMaxAge(0);
						response.addCookie(c1);
						Cookie c2 = new Cookie("autoLoginToken",null);
						c2.setMaxAge(0);
						response.addCookie(c2);
						
						//쿠키에 정보 저장
						Cookie cookie = new Cookie("autoLoginMidx", Integer.toString(login.getMidx()));//회원번호를 쿠키에 저장
						cookie.setPath(request.getContextPath());
						cookie.setMaxAge(3600*24*30);
						response.addCookie(cookie);
						
						String token = passwordEncoder.encode(vo.getPassword());
						
						Cookie cookie2 = new Cookie("autoLoginToken", token);//토큰을 쿠키에 저장
						cookie2.setPath(request.getContextPath());
						cookie2.setMaxAge(3600*24*30);
						response.addCookie(cookie2);
						
						AutoVO auto = new AutoVO();
						auto.setMidx(login.getMidx());
						auto.setToken(token);
						int result = userService.autoLoginInsert(auto);
					}
					
					return "Y";
				}
				else {//비밀번호가 일치하지 않는 경우
					return "FAIL";
				}
				
			}
			//승인이 되지 않은 경우
			else {
				return "N";
			}
		}
		else {
			//로그인 실패(회원 존재하지 않음)
			return "FAIL2";
		}
	}
	
	//소셜 로그인
	@ResponseBody
	@RequestMapping(value="/socialLogin.do")
	public String social(UserVO vo, String accessToken, HttpServletRequest request, HttpSession session) {
		String type = userService.socialType(vo);
		String social = vo.getSocial();
		
		//소셜 로그인 종류가 다르면
		if(type.equals(social) == false) {
			return "-1";//이메일만 같고 소셜 로그인 종류가 다를시 로그인 안되게
		}
		else {
			int midx = userService.socialLogin(vo);
			session.setAttribute("token", accessToken);
			String nickname = userService.nicknameSelect(vo.getEmail());
			
			if(nickname == null) {//닉네임이 없다면(첫 로그인)
				return midx+"";
			}
			else {//닉네임이 존재하면
				vo.setNickname(nickname);
				vo.setMidx(midx);
				vo.setRole("normal");
				session = request.getSession();
				session.setAttribute("login", vo);
				return "0";
			}
		}
	}
	
	//소셜 첫 로그인 시 닉네임 받기
	@RequestMapping(value="/nicknameInsert.do")
	public String nickname(UserVO vo, HttpServletRequest request, HttpSession session) {
		//닉네임 업데이트 해주기
		int result = userService.nicknameInsert(vo);
		vo.setRole("normal");
		
		session = request.getSession();
		session.setAttribute("login", vo);
		
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
	
	//이메일 중복 체크 로그인
	@ResponseBody
	@RequestMapping(value="/emailDupPwd.do", method=RequestMethod.POST)
	public int emailDupPwd(String email) {
		//만약 비밀번호가 null이면 (소셜 회원이면)
		String pwd = userService.emailDupPwd(email);
		if(pwd == null) {
			return -1;
		}
		else {
			int result = userService.emailDup(email);
			return result;
		}
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
			File dir = new File(uploadPath+"\\document");
			
			if(!dir.exists()) dir.mkdirs();
			
			if(!file.getOriginalFilename().isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString()+"_"+file.getOriginalFilename();
				file.transferTo(new File(uploadPath+"\\document",fileName));
				vo.setDocument(fileName);
			}
			else {
				//일반회원은 파일이 없지
				System.out.println("입력된 파일 없음");
			}
		}
		
		//비밀번호 암호화
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
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
	public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		//자동 로그인 테이블에서 제거
		userService.autoLoginDelete(login.getMidx());
		
		//세션 만료
		session.invalidate();
		
		return "redirect:/";
	}
	
	//이메일 찾기 페이지로 이동
	@RequestMapping(value="/emailFind.do", method=RequestMethod.GET)
	public String emailFind() {
		return "user/emailFind";
	}
	
	//유저가 존재하는지 확인
	@ResponseBody
	@RequestMapping(value="/userExist.do")
	public String userExist(UserVO vo) {
		return userService.nameToEmail(vo);//유저가 존재하면 이메일 리턴, 없으면 null 리턴
	}
	
	//이메일 보여주는 페이지로 이동
	@RequestMapping(value="/emailFind.do", method=RequestMethod.POST)
	public String emailFind(UserVO vo, Model model) {
		model.addAttribute("email", vo.getEmail());
		return "user/emailFind2";
	}
	
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/pwdFind.do", method=RequestMethod.GET)
	public String pwdFind() {
		return "user/pwdFind";
	}
	
	//이메일 인증 페이지로 이동 & 이메일 보내기
	@RequestMapping(value="/pwdFind.do", method=RequestMethod.POST)
	public String pwdFind(String email, Model model, HttpServletRequest request, HttpServletResponse response) {
		//인증 메일 보내는 코드
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", "han418hi@naver.com");	//보내는 사람
		emailInfo.put("to", email);	//받는 사람
		emailInfo.put("subject", "HOWF 인증메일 입니다.");	//제목
		
		int authNum = (int)(Math.floor(Math.random()*900)+100);//인증번호
		
		String content = "인증번호는 "+authNum+"입니다.";	//내용
		
		Cookie cookie = new Cookie("authNum", Integer.toString(authNum));//인증번호를 쿠키에 저장
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
		System.out.println("인증번호 : "+authNum);
		
		
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
		
		try {
			SMTP smtpServer = new SMTP();		//메일 전송 클래스 생성
			smtpServer.emailSending(emailInfo);	//전송
			System.out.println("이메일 전송 성공");
		}catch(Exception e) {
			System.out.println("이메일 전송 실패");
			e.printStackTrace();
		}
		
		model.addAttribute("email", email);
		
		return "user/pwdFind2";
	}
	
	//비밀번호 변경 페이지로 이동
	@RequestMapping(value="/pwdFindComplete.do", method=RequestMethod.GET)
	public String pwdFind2(String email, Model model) {
		model.addAttribute("email", email);
		return "user/pwdFind3";
	}
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/pwdFindComplete.do", method=RequestMethod.POST)
	public int pwdFind2(UserVO vo) {
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		return userService.pwdModify(vo);
	}
	
	
	/* 마이페이지 */
	//공통
	//내 정보 이동
	@RequestMapping(value="/myInfo.do", method=RequestMethod.GET)
	public String myInfo(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		UserVO vo = userService.profileSelectOne(login.getMidx());
		
		model.addAttribute("profile", vo);
		
		return "user/myInfo";
	}
	
	//프로필 이미지 수정 이동
	@RequestMapping(value="/profileImg.do", method=RequestMethod.GET)
	public String profile(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		UserVO vo = userService.profileSelectOne(login.getMidx());
		
		model.addAttribute("profile", vo);
		
		return "user/profileImgModify";
	}
	
	//프로필 이미지 수정
	@ResponseBody
	@RequestMapping(value="/profileImg.do", method=RequestMethod.POST)
	public int profileModify(MultipartFile profileImg, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 받아오는 처리
		if(profileImg != null) {
			File dir = new File(uploadPath);
			
			if(!dir.exists()) dir.mkdirs();
			
			if(!profileImg.getOriginalFilename().isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString()+"_"+profileImg.getOriginalFilename();
				profileImg.transferTo(new File(uploadPath,fileName));
				System.out.println("file:"+fileName);
				
				session = request.getSession();
				UserVO login = (UserVO)session.getAttribute("login");
				login.setImg(fileName);
				userService.profileImgModify(login);
				
				return 1;
			}
			else {
				System.out.println("입력된 파일 없음");
				return 0;
			}
		}
		return 0;
	}
	
	//내 정보 수정 이동
	@RequestMapping(value="/profile.do", method=RequestMethod.GET)
	public String myInfoModify(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		UserVO vo = userService.profileSelectOne(login.getMidx());
		
		model.addAttribute("profile", vo);
		
		return "user/myInfoModify";
	}
	
	//내 정보 수정
	@ResponseBody
	@RequestMapping(value="/profile.do", method=RequestMethod.POST)
	public int myInfoModify(UserVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		int result = userService.profileModify(vo);
		
		return result;
	}
	
	
	//일반회원
	
	//마이페이지 이동(일반회원)
	@RequestMapping(value="/mypage.do")
	public String mypageN() {
		return "user/mypageNList";
	}
	
	//여행이야기 관리 이동
	@RequestMapping(value="/myStory.do")
	public String myStory() {
		
		return "story/myStory";
	}
	
	//찜 목록 이동
	@RequestMapping(value="/myHeart.do")
	public String myHeart() {
		
		return "user/myHeart";
	}
	
	//예약한 숙소리스트 이동
	@RequestMapping(value="/myReservation.do")
	public String myReservation(SearchVO search, Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		search.setMidx(login.getMidx());
		
		//sort
		if(search.getSortType() == null) search.setSortType("new");
		
		//페이징
		int page = search.getPage();
		int cnt = stayService.resCountAll(search);
		search.setPerPageNum(6);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(search);
		pm.setTotalCount(cnt);
		
		List<ResVO> res = stayService.resSelectAll(search);
		search.setPage(page);
		
		model.addAttribute("res", res);
		model.addAttribute("search", search);
		model.addAttribute("pm", pm);
		
		return "stay/myReservation";
	}
	
	
	//내 리뷰,댓글 보기 이동
	@RequestMapping(value="/myComment.do")
	public String myComment() {
		return "user/myComment";
	}
	
	
	
	//공무원
	
	//마이페이지 이동(공무원)
	@RequestMapping(value="/mypageOfficial.do")
	public String mypageO() {
		return "user/mypageOList";
	}
	
	//지역 이벤트 관리 이동
	
	
	
	//사업자
	
	//마이페이지 이동(business)
	@RequestMapping(value="/mypageBusiness.do")
	public String mypageB() {
		return "user/mypageBList";
	}
	
	//내 숙소 관리 이동
	
	
	//예약자 관리 이동
	
	
	
	
	//관리자
	
	//마이페이지 이동(admin)
	@RequestMapping(value="/mypageAdmin.do")
	public String mypageA() {
		return "user/mypageAList";
	}
	
	//회원 관리 이동
	
	
	//HOWF 추천 관리 이동
	
	
	//HOWF 소식 관리 이동
	
	
	
	
	
	
	
	
	//사진 보여주기 위한 코드
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
				
		System.out.println("fileName:"+fileName);
				
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
				
		try{
			//파일 타입 체크
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
					
			HttpHeaders headers = new HttpHeaders();		
					
			//bean에 주입한 물리경로 uploadPath
			in = new FileInputStream(uploadPath+fileName);
					
			//파일 확장자가 있다면
			if(mType != null){
						
				//만약 다운로드를 하고 싶다면 매개변수 down에 1을 넘겨줘서 호출하면 됨
				if (down==1) {
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
							
				}else {
					//down에 1이 넘어오지 않았다면 사진 보여주기
					headers.setContentType(mType);
				}
						
			}else{//파일 확장자가 없다면
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
					
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}	
}

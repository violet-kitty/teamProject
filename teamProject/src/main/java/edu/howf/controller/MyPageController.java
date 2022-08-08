package edu.howf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import edu.howf.service.CSService;
import edu.howf.service.NoticeService;
import edu.howf.service.StayService;
import edu.howf.service.StoryService;
import edu.howf.service.TeamService;
import edu.howf.service.UserService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.CommentVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.ResVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

//마이 페이지
@RequestMapping(value="/mypage")
@Controller
public class MyPageController {
	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	StayService stayService;
	
	@Autowired
	StoryService storyService;
	
	@Autowired
	CSService csService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	TeamService teamService;
	
	@Autowired
	String uploadPath;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	
	//공통
	//내 정보 이동
	@RequestMapping(value="/myInfo.do", method=RequestMethod.GET)
	public String myInfo(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		UserVO vo = userService.profileSelectOne(login.getMidx());
		
		model.addAttribute("profile", vo);
		
		return "mypage/myInfo";
	}
	
	//프로필 이미지 수정 이동
	@RequestMapping(value="/profileImg.do", method=RequestMethod.GET)
	public String profile(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		UserVO vo = userService.profileSelectOne(login.getMidx());
		
		model.addAttribute("profile", vo);
		
		return "mypage/profileImgModify";
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
		
		return "mypage/myInfoModify";
	}
	
	//내 정보 수정
	@ResponseBody
	@RequestMapping(value="/profile.do", method=RequestMethod.POST)
	public int myInfoModify(UserVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		login.setNickname(vo.getNickname());
		vo.setMidx(login.getMidx());
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		int result = userService.profileModify(vo);
		
		return result;
	}
	
	//찜 목록 이동
	@RequestMapping(value="/myHeart.do")
	public String myHeart(String type, SearchVO vo, Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		if(type == null) type = "howf";
		
		//페이징
		int page = vo.getPage();
		vo.setPerPageNum(10);
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		
		if(type.equals("stay")) {
			int cnt = userService.heartCountStay(vo);
			pm.setTotalCount(cnt);
			
			List<HeartVO> stay = userService.heartSelectStay(vo);
			vo.setPage(page);
			
			model.addAttribute("stay", stay);
			model.addAttribute("pm", pm);
			return "mypage/myHeartStay";
		}
		else {
			if(type.equals("howf")) {
				int cnt = userService.heartCountHOWF(vo);
				pm.setTotalCount(cnt);
				
				List<HeartVO> howf = userService.heartSelectHOWF(vo);
				vo.setPage(page);
				
				model.addAttribute("list", howf);
				model.addAttribute("tabType", "howf");
				model.addAttribute("pm", pm);
			}
			else if(type.equals("event")) {
				int cnt = userService.heartCountEvent(vo);
				pm.setTotalCount(cnt);
				
				List<HeartVO> event = userService.heartSelectEvent(vo);
				vo.setPage(page);
				
				model.addAttribute("list", event);
				model.addAttribute("tabType", "event");
				model.addAttribute("pm", pm);
			}
			else if(type.equals("story")) {
				List<HeartVO> story = userService.heartSelectStory(vo);
				model.addAttribute("list", story);
				model.addAttribute("tabType", "story");
			}
			
			return "mypage/myHeart";
		}
	}
	
	
	
	
	//일반회원
	
	//마이페이지 이동(일반회원)
	@RequestMapping(value="/mypage.do")
	public String mypageN() {
		return "mypage/mypageNList";
	}
	
	//여행이야기 관리 이동
	@RequestMapping(value="/myStory.do")
	public String myStory() {
		
		return "mypage/myStory";
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
		
		return "mypage/myReservation";
	}
	
	
	//내 리뷰,댓글 보기 이동
	@RequestMapping(value="/myComment.do")
	public String myComment(SearchVO vo, Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		//리뷰 페이징
		int page = vo.getPage();
		int cnt = userService.myReviewCount(vo);
		vo.setPerPageNum(6);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<CommentVO> review = userService.myReview(vo);
		vo.setPage(page);
		
		model.addAttribute("review", review);
		model.addAttribute("search", vo);
		model.addAttribute("pm", pm);
		
		//댓글 페이징
		
		
		return "mypage/myComment";
	}
	
	//리뷰 그리기
	@ResponseBody
	@RequestMapping(value="/reviewSelect.do")
	public List<CommentVO> myReview(SearchVO vo, HttpServletRequest request, HttpSession session){
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		//리뷰 페이징
		int page = vo.getPage();
		int cnt = userService.myReviewCount(vo);
		vo.setPerPageNum(6);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<CommentVO> review = userService.myReview(vo);
		vo.setPage(page);
		
		return review;
	}
	
	//페이징 그리기
	@ResponseBody
	@RequestMapping(value="/reviewPaging.do")
	public PageMaker myReviewPaging(String type, SearchVO vo, HttpServletRequest request, HttpSession session){
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		int cnt = 0;
		
		if(type.equals("review")) {
			cnt = userService.myReviewCount(vo);
		}
		else {
			
		}
		
		vo.setPerPageNum(6);
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		return pm;
	}
	
	//너나들이 이동
	@RequestMapping(value="/myTeam.do")
	public String myTeam(SearchVO vo, Model model) {
		
		return "mypage/myTeam";
	}
	
	
	
	
	//공무원
	
	//마이페이지 이동(공무원)
	@RequestMapping(value="/mypageOfficial.do")
	public String mypageO() {
		return "mypage/mypageOList";
	}
	
	//지역 이벤트 관리 이동
	
	
	
	
	
	//사업자
	
	//마이페이지 이동(business)
	@RequestMapping(value="/mypageBusiness.do")
	public String mypageB() {
		return "mypage/mypageBList";
	}
	
	//내 숙소 관리 이동
	
	
	//예약자 관리 이동
	
	
	
	
	
	
	//관리자
	
	//마이페이지 이동(admin)
	@RequestMapping(value="/mypageAdmin.do")
	public String mypageA() {
		return "mypage/mypageAList";
	}
	
	//회원 관리 이동
	
	
	//HOWF 추천 관리 이동
	
	
	//HOWF 소식 관리 이동
	
	
	
	
	
	
	
	
	
	
	
	//사진 보여주기 위한 코드
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
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
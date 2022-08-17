package edu.howf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.howf.service.BoardService;
import edu.howf.service.CSService;
import edu.howf.service.NoticeService;
import edu.howf.service.StayService;
import edu.howf.service.StoryService;
import edu.howf.service.TeamService;
import edu.howf.service.UserService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.CommentVO;
import edu.howf.vo.EventVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.JoinVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.ResVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;
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
	
	@Autowired
	String iamportKey;
	
	@Autowired
	String iamportSecretKey;
	
	
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
	
	//회원 탈퇴
	@ResponseBody
	@RequestMapping(value="/delyn.do")
	public int delyn(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		return userService.userDel(login.getMidx());
	}
	
	
	
	//일반회원
	
	//마이페이지 이동(일반회원)
	@RequestMapping(value="/mypage.do")
	public String mypageN() {
		return "mypage/normal/mypageNList";
	}
	
	//여행이야기 관리 이동
	@RequestMapping(value="/myStory.do")
	public String myStory() {
		
		return "mypage/normal/myStory";
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
			model.addAttribute("tabType", "stay");
			model.addAttribute("pm", pm);
			model.addAttribute("search", vo);
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
				model.addAttribute("search", vo);
			}
			else if(type.equals("event")) {
				int cnt = userService.heartCountEvent(vo);
				pm.setTotalCount(cnt);
				
				List<HeartVO> event = userService.heartSelectEvent(vo);
				vo.setPage(page);
				
				model.addAttribute("list", event);
				model.addAttribute("tabType", "event");
				model.addAttribute("pm", pm);
				model.addAttribute("search", vo);
			}
			else if(type.equals("story")) {
				int cnt = userService.heartCountStory(vo);
				pm.setTotalCount(cnt);
				
				List<HeartVO> story = userService.heartSelectStory(vo);
				vo.setPage(page);
				
				model.addAttribute("list", story);
				model.addAttribute("tabType", "story");
				model.addAttribute("pm", pm);
				model.addAttribute("search", vo);
			}
		}
		return "mypage/normal/myHeart";
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
		
		return "mypage/normal/myReservation";
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
		
		
		return "mypage/normal/myComment";
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
	public String myTeam(SearchVO vo, Model model, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		vo.setMidx(login.getMidx());
		List<JoinVO> jv = userService.myTeamList(vo);
		
		model.addAttribute("jv", jv);
		model.addAttribute("login", login);
		
		return "mypage/normal/myTeam";
	}
	
	//내가 만든 팀에 들어온 가입신청 목록 불러옴(모달창)
	@ResponseBody
	@PostMapping("applyList.do")
	public List<JoinVO> applyList(int tidx) {
		
		List<JoinVO> jv = userService.myTeam_applyList(tidx);
		
		return jv;
	}
	//가입신청 승인
	@ResponseBody
	@PostMapping("apply_Y.do")
	public int apply_Y(int jidx) {
		
		return userService.apply_Y(jidx);
	}
	//가입신청 거절
	@ResponseBody
	@PostMapping("apply_N.do")
	public int apply_N(int jidx) {
		
		return userService.apply_N(jidx);
	}
	
	
	
	//공무원
	
	//마이페이지 이동(공무원)
	@RequestMapping(value="/mypageOfficial.do")
	public String mypageO() {
		return "mypage/official/mypageOList";
	}
	
	//지역 이벤트 관리 이동
	@RequestMapping(value="/myEvent.do")
	public String myEvent(SearchVO vo, Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		if(vo.getSortType() == null) vo.setSortType("new");
		
		//페이징
		int page = vo.getPage();
		int cnt = boardService.myEventCount(vo);
		vo.setPerPageNum(9);
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<EventVO> event = boardService.myEvent(vo);
		vo.setPage(page);
		
		model.addAttribute("event", event);
		model.addAttribute("pm", pm);
		model.addAttribute("search", vo);
		
		return "mypage/official/myEvent";
	}
	
	
	
	
	//사업자
	
	//마이페이지 이동(business)
	@RequestMapping(value="/mypageBusiness.do")
	public String mypageB() {
		return "mypage/business/mypageBList";
	}
	
	//내 숙소 관리 이동
	@RequestMapping(value="/myStay.do")
	public String myStay(SearchVO vo, Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		if(vo.getSortType() == null) vo.setSortType("name");
		
		//페이징
		int page = vo.getPage();
		int cnt = stayService.myStayCount(vo);
		vo.setPerPageNum(9);
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<StayVO> stay = stayService.myStayAll(vo);
		vo.setPage(page);
		
		model.addAttribute("stay", stay);
		model.addAttribute("pm", pm);
		model.addAttribute("search", vo);
		
		return "mypage/business/myStay";
	}
	
	
	//예약자 관리 이동
	@RequestMapping(value="reservationList.do")
	public String reservationList(ResVO vo, Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		List<ResVO> res = stayService.resSelectAllB(vo);
		
		model.addAttribute("res", res);
		
		return "mypage/business/reservationList";
	}
	
	//날짜에 맞는 예약 목록 가져오기
	@ResponseBody
	@RequestMapping(value="/resList.do")
	public List<ResVO> resList(ResVO vo, HttpServletRequest request, HttpSession session){
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		List<ResVO> res = stayService.resSelectAllB(vo);
		
		return res;
	}
	
	//예약 추가 이동
	@RequestMapping(value="/resInsert.do", method=RequestMethod.GET)
	public String resInsert(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		//본인 소유 숙소 목록
		SearchVO vo = new SearchVO();
		vo.setMidx(login.getMidx());
		vo.setSortType("name");
		List<StayVO> stay = stayService.myStayAll(vo);
		
		model.addAttribute("stay", stay);
		
		return "mypage/business/resInsert";
	}
	
	//방 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/roomSelect.do")
	public StayVO roomSelect(ResVO vo) {
		StayVO stay = stayService.staySelectOne(vo);
		
		return stay;
	}
	
	//예약 추가
	@ResponseBody
	@RequestMapping(value="/resInsert.do", method=RequestMethod.POST)
	public int resInsertAction(ResVO res, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		res.setMidx(login.getMidx());
		
		//상품 id
		Calendar cal = Calendar.getInstance();
		String merchant = "ridx_"+res.getRidx()+"_"+(int)(Math.floor(Math.random()*900)+100)+"_"+cal.get(Calendar.YEAR)+(cal.get(Calendar.MONTH)+1)+cal.get(Calendar.HOUR_OF_DAY);
		res.setMerchant(merchant);
		
		return stayService.resInsertB(res);
	}
	
	//예약 취소
	@ResponseBody
	@RequestMapping(value="/resDelete.do")
	public String resDelete(int reidx, CommentVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		stayService.resDeleteB(reidx, vo);
		
		return stayService.merchantSelect(reidx);
	}
	
	//아임포트 토큰 받는 함수
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost("https://api.iamport.kr/users/getToken");
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", iamportKey);
		m.put("imp_secret", iamportSecretKey);
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//Map을 사용해 Http 요청 파라미터를 만들어 주는 함수
	private List<NameValuePair> convertParameter(Map<String, String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for(Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}
	
	//결제 취소
	@ResponseBody
	@RequestMapping(value="/payCancel.do")
	public int payCancel(String merchant) {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost("https://api.iamport.kr/payments/cancel");
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", merchant);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		if(asd.equals("null")) return -1;
		else return 1;
	}
	
	
	//관리자
	
	//마이페이지 이동(admin)
	@RequestMapping(value="/mypageAdmin.do")
	public String mypageA() {
		return "mypage/admin/mypageAList";
	}
	
	//회원 관리 이동
	@RequestMapping(value="/userList.do")
	public String userList(SearchVO vo, Model model) {
		//페이징
		int page = vo.getPage();
		int cnt = userService.userListCount(vo);
		vo.setPerPageNum(10);
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<UserVO> user = userService.userList(vo);
		vo.setPage(page);
		
		model.addAttribute("user", user);
		model.addAttribute("pm", pm);
		model.addAttribute("search", vo);
		
		//지역, 나이별 차트 데이터
		List<UserVO> addrData = userService.addrData();
		List<UserVO> ageData = userService.ageData();
		
		model.addAttribute("addrData", addrData);
		model.addAttribute("ageData", ageData);
		
		return "mypage/admin/userList";
	}
	
	//회원 밴
	@ResponseBody
	@RequestMapping(value="/userBan.do")
	public int userBan(CommentVO vo) {
		int result = userService.userBan(vo);
		
		return result;
	}
	
	//사업자 가입 승인 이동
	@RequestMapping(value="/joinBusiness.do", method=RequestMethod.GET)
	public String joinB(Model model, SearchVO vo) {
		//페이징
		int page = vo.getPage();
		int cnt = userService.joinBCount(vo);
		vo.setPerPageNum(10);
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<UserVO> user = userService.joinBSelect(vo);
		vo.setPage(page);
		
		model.addAttribute("user", user);
		model.addAttribute("search", vo);
		model.addAttribute("pm", pm);
		
		return "mypage/admin/joinBusiness";
	}
	
	//사업자 가입 승인
	@ResponseBody
	@RequestMapping(value="/joinBusiness.do", method=RequestMethod.POST)
	public int joinOK(int midx) {
		return userService.joinBY(midx);
	}
	
	//사업자 가입 거절
	@ResponseBody
	@RequestMapping(value="/denyBusiness.do")
	public int joinDeny(int midx) {
		return userService.joinBN(midx);
	}
	
	//리뷰 관리 이동
	@RequestMapping(value="/reviewList.do")
	public String reviewList() {
		return "mypage/admin/reviewList";
	}
	
	
	
	//댓글 관리 이동
	@RequestMapping(value="/commentList.do")
	public String commentList() {
		return "mypage/admin/commentList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	//사업자 등록증 보여주기 위한 코드
	@RequestMapping(value="/displayDocument.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayDocument(@RequestParam("fileName") String fileName,@RequestParam(value="down",defaultValue="0" ) int down ) throws Exception{
		InputStream in = null;		
		ResponseEntity<byte[]> entity = null;
				
		try{
			//파일 타입 체크
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
					
			HttpHeaders headers = new HttpHeaders();		
					
			//bean에 주입한 물리경로 uploadPath
			in = new FileInputStream(uploadPath+"document/"+fileName);
					
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

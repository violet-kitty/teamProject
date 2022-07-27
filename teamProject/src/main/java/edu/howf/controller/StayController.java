package edu.howf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.StayService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.CommentVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.ResVO;
import edu.howf.vo.RoomVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;
import edu.howf.vo.UserVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


//숙박정보
@RequestMapping(value="/stay")
@Controller
public class StayController {
	@Autowired
	StayService stayService;
	
	@Autowired
	String uploadPath;
	
	@RequestMapping(value="/stayList.do")
	public String stayList(SearchVO vo, Model model) {
		//히어로
		
		//sort
		if(vo.getSortType()==null) vo.setSortType("star");
		
		//페이징
		int page = vo.getPage();
		int cnt = stayService.stayCountAll(vo);
		vo.setPerPageNum(9);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<StayVO> stay = stayService.staySelectAll(vo);
		vo.setPage(page);
		

		model.addAttribute("stay", stay);
		model.addAttribute("search", vo);
		model.addAttribute("pm", pm);
		
		
		return "stay/stayList";
	}
	
	@RequestMapping(value="/stayWrite.do", method=RequestMethod.GET)
	public String stayWrite() {
		return "stay/stayWrite";
	}
	
	@RequestMapping(value="/stayWrite.do", method=RequestMethod.POST)
	public String stayWrite(MultipartFile[] btnAtt, @RequestParam("roomFile")MultipartFile[] roomFile, StayVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 업로드
		File dir = new File(uploadPath);
				
		if(!dir.exists()) dir.mkdirs();
		
		StringBuilder photos = new StringBuilder("");
		
		//숙박시설의 이미지 받기
		if(btnAtt.length != 0) {
			for(MultipartFile f : btnAtt) {
				if(!f.getOriginalFilename().isEmpty()) {
					System.out.println("파일 저장 경로 : "+uploadPath);
					UUID uuid = UUID.randomUUID();
					String fileName = uuid.toString()+"_"+f.getOriginalFilename();
					f.transferTo(new File(uploadPath,fileName));
					
					photos.append(fileName+",");
				}
				else {
					System.out.println("업로드된 파일 없음");
				}
			}
			
			String photo = photos.toString();
			vo.setPhoto(photo.substring(0,photo.length()-1));
		}
		
		//방 이미지 받기
		if(roomFile.length != 0) {
			int i = 0;
			for(MultipartFile f : roomFile) {
				if(!f.getOriginalFilename().isEmpty()) {
					System.out.println("파일 저장 경로 : "+uploadPath);
					UUID uuid = UUID.randomUUID();
					String fileName = uuid.toString()+"_"+f.getOriginalFilename();
					f.transferTo(new File(uploadPath,fileName));
					vo.getRoom().get(i).setPhoto(fileName);
					
					i++;
				}
				else {
					System.out.println("업로드된 파일 없음");
				}
			}
		}
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		int result = stayService.stayInsert(vo);
		
		return "redirect:/stay/stayList.do";
	}
	
	@RequestMapping(value="/stayView.do")
	public String stayView(ResVO res, SearchVO vo, Model model) {
		//날짜 검색 기본값
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String today = sdf.format(cal.getTime());//오늘 날짜
		cal.add(cal.DATE, +1);
		String tomorrow = sdf.format(cal.getTime());//내일 날짜
		
		if(res.getDate1() == null) res.setDate1(today);
		if(res.getDate2() == null) res.setDate2(tomorrow);
		
		//숙박정보, 방 정보
		StayVO stay = stayService.staySelectOne(res);
		
		//리뷰
		//리뷰는 3개씩 보여줌
		vo.setPerPageNum(3);
		int page = vo.getPage();
		
		//리뷰 페이징
		//페이징
		int cnt = stayService.reviewCount(res.getSidx());
				
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		vo.setBidx(res.getSidx());
		if(vo.getPage()==0) vo.setPage(1);
		List<CommentVO> review = stayService.reviewSelect(vo);
		vo.setPage(page);
		
		model.addAttribute("stay", stay);
		model.addAttribute("review", review);
		model.addAttribute("pm", pm);
		model.addAttribute("vo",vo);
		model.addAttribute("res", res);
		
		return "stay/stayView";
	}
	
	//리뷰쓰기
	@ResponseBody
	@RequestMapping(value="/reviewWrite.do")
	public int reviewWrite(CommentVO vo, MultipartFile file, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 업로드
		File dir = new File(uploadPath);
		if(!dir.exists()) dir.mkdirs();
		
		if(!file.getOriginalFilename().isEmpty()) {
			System.out.println("파일 저장 경로 : "+uploadPath);
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString()+"_"+file.getOriginalFilename();
			file.transferTo(new File(uploadPath,fileName));
			vo.setPhoto(fileName);
		}
		else {
			System.out.println("업로드된 파일 없음");
		}
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		return stayService.reviewInsert(vo);
	}
	
	//리뷰 불러오기
	@ResponseBody
	@RequestMapping(value="/reviewSelect.do", produces = "application/json;charset=utf-8")
	public List<CommentVO> reviewSelect(SearchVO vo){
		vo.setPerPageNum(3);
		return stayService.reviewSelect(vo);
	}
	
	//리뷰 페이징
	@ResponseBody
	@RequestMapping(value="/reviewPaging.do", produces = "application/json;charset=utf-8")
	public PageMaker reviewPaging(SearchVO vo) {
		int cnt = stayService.reviewCount(vo.getBidx());
		vo.setPerPageNum(3);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		return pm;
	}
	
	//별점 변경
	@ResponseBody
	@RequestMapping(value="/stayStar.do")
	public float stayStar(int bidx) {
		return stayService.stayStar(bidx);
	}
	
	//수정 페이지 이동
	@RequestMapping(value="/stayModify.do", method=RequestMethod.GET)
	public String stayModify(ResVO vo, Model model) {
		StayVO stay = stayService.staySelectOne(vo);
		
		model.addAttribute("stay", stay);
		
		return "stay/stayModify";
	}
	
	//숙박 정보 수정
	@RequestMapping(value="/stayModify.do", method=RequestMethod.POST)
	public String stayModify(MultipartFile[] btnAtt, @RequestParam("roomFile")MultipartFile[] roomFile, StayVO vo, String[] imgArr, String[] roomArr1, String[] roomArr2) throws IllegalStateException, IOException {
		StringBuilder photos = new StringBuilder("");
		
		//새로운 이미지가 추가되지 않고 삭제되거나 혹은 변동 없는 경우
		if(imgArr!=null) {
			for(String a : imgArr) {
				photos.append(a.substring(1, a.length()-1)+",");
			}
			String p = photos.toString();
			vo.setPhoto(p.substring(0,p.length()-1));
		}
		
		//새로운 이미지가 추가된 경우
		//파일 업로드
		File dir = new File(uploadPath);
						
		if(!dir.exists()) dir.mkdirs();
		
		//숙박시설의 이미지 받기
		if(btnAtt != null) {
			for(MultipartFile f : btnAtt) {
				if(!f.getOriginalFilename().isEmpty()) {
					System.out.println("파일 저장 경로 : "+uploadPath);
					UUID uuid = UUID.randomUUID();
					String fileName = uuid.toString()+"_"+f.getOriginalFilename();
					f.transferTo(new File(uploadPath,fileName));
					
					photos.append(fileName+",");
				}
				else {
					System.out.println("업로드된 파일 없음");
				}
			}
			
			String photo = photos.toString();
			vo.setPhoto(photo.substring(0,photo.length()-1));
		}
		
		//방 이미지 받기
		if(roomFile != null) {
			for(MultipartFile f : roomFile) {
				if(!f.getOriginalFilename().isEmpty()) {
					System.out.println("파일 저장 경로 : "+uploadPath);
					UUID uuid = UUID.randomUUID();
					String fileName = uuid.toString()+"_"+f.getOriginalFilename();
					f.transferTo(new File(uploadPath,fileName));
					
					//roomArr2의 값이 ''이 아닌 곳에 값 넣기
					for(int i=0;i<roomArr2.length;i++) {
						if(!roomArr2[i].equals("\'\'")) {
							roomArr2[i] = fileName;
							break;
						}
					}
				}
				else {
					System.out.println("업로드된 파일 없음");
				}
			}
		}
		
		if(vo.getRoom() != null) {
			for(int i=0;i<roomArr1.length;i++) {
				System.out.println("arr1:"+roomArr1[i]);
			}
			
			//배열 비교(돌면서 원래 배열에 있던 값 새로운 배열의 없는 값에 넣어주기)
			for(int i=0;i<roomArr2.length;i++) {
				if(i<roomArr1.length && roomArr2[i].equals("\'\'")) {
					roomArr2[i] = roomArr1[i].substring(1, roomArr1[i].length()-1);
				}
				//배열에 저장된 값 vo에 넣기
				System.out.println("room:"+roomArr2[i]);
				vo.getRoom().get(i).setPhoto(roomArr2[i]);
			}
		}
		
		int result = stayService.stayModify(vo);
		
		
		return "redirect:/stay/stayView.do?sidx="+vo.getSidx();
	}
	
	//숙박 정보 삭제
	@ResponseBody
	@RequestMapping(value="/stayDelete.do")
	public int stayDelete(int sidx) {
		return stayService.stayDelete(sidx);
	}
	
	//리뷰 수정
	@ResponseBody
	@RequestMapping(value="/reviewModify.do", method=RequestMethod.GET)
	public CommentVO reviewModify(int cbidx) {
		return stayService.reviewSelectOne(cbidx);
	}
	
	//리뷰 수정 action
	@ResponseBody
	@RequestMapping(value="/reviewModify.do", method=RequestMethod.POST)
	public int reviewModify(CommentVO vo, MultipartFile file) throws IllegalStateException, IOException {
		if(file != null) {
			//파일 업로드
			File dir = new File(uploadPath);
			if(!dir.exists()) dir.mkdirs();
					
			if(!file.getOriginalFilename().isEmpty()) {
				System.out.println("파일 저장 경로 : "+uploadPath);
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString()+"_"+file.getOriginalFilename();
				file.transferTo(new File(uploadPath,fileName));
				vo.setPhoto(fileName);
			}
			else {
				System.out.println("업로드된 파일 없음");
			}
		}
		
		return stayService.reviewModify(vo);
	}
	
	//리뷰 삭제
	@ResponseBody
	@RequestMapping(value="/reviewDelete.do")
	public int reviewDelete(int cbidx) {
		return stayService.reviewDelete(cbidx);
	}
	
	//리뷰 중복 체크
	@ResponseBody
	@RequestMapping(value="/reviewDup.do")
	public int reviewDup(CommentVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		return stayService.reviewDup(vo);
	}
	
	//객실ridx 가져오기
	@ResponseBody
	@RequestMapping(value="/roomRidx.do")
	public int roomRidx(ResVO vo){
		return stayService.roomRidx(vo);
	}
	
	//예약하기 페이지 이동
	@RequestMapping(value="/stayReservation.do")
	public String stayReservation(ResVO res, String stayName, Model model) {
		//객실 정보(객실 이름, 가격), 선택한 날짜 들고 가기
		model.addAttribute("stayName", stayName);
		model.addAttribute("res", res);
		
		//상품 id(다른것과 id가 겹치면 중복된 결제건이라고 결제가 되지 않음)
		Calendar cal = Calendar.getInstance();
		String merchant = "ridx_"+res.getRidx()+"_"+(int)(Math.floor(Math.random()*900)+100)+"_"+cal.get(Calendar.YEAR)+(cal.get(Calendar.MONTH)+1)+cal.get(Calendar.HOUR_OF_DAY);
		model.addAttribute("merchant", merchant);
		
		return "stay/stayReservation";
	}
	
	//휴대폰 본인인증
	@ResponseBody
	@RequestMapping(value="/authPerson.do")
	public int auth(String phone, HttpServletRequest request, HttpServletResponse response) {
		String api_key = "NCST9YVUZ5B5V4JG";
		String api_secret = "G89QGA76EDVCLYIP7XJ0TFXEBEOUWALN";
		Message coolsms = new Message(api_key, api_secret);
		
		int authNum = (int)(Math.floor(Math.random()*900)+100);//인증번호
		
		Cookie cookie = new Cookie("authNum", Integer.toString(authNum));//인증번호를 쿠키에 저장
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
		System.out.println("인증번호 : "+authNum);
		
		//인증 문자 보내기
		/*
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone);
		params.put("from", "01035428975");
		params.put("type", "SMS");
		params.put("text", "인증번호는 ["+authNum+"]입니다.");
		params.put("app_version", "howf");
		
		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println("message:"+obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		*/
		
		return authNum;
	}
	
	//결제 검증, 예약
	@ResponseBody
	@RequestMapping(value="/tradeAuth.do")
	public String tradeAuth(String merchant_uid, String amount) {
		System.out.println("merchant:"+merchant_uid);
		System.out.println("amount:"+amount);
		return "success";
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
}

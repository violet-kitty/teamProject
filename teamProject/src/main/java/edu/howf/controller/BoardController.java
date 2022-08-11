package edu.howf.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import org.apache.commons.*;
import org.apache.commons.io.IOUtils;

import edu.howf.service.BoardService;
import edu.howf.util.MediaUtils;
import edu.howf.vo.EventVO;
import edu.howf.vo.HOWFVO;
import edu.howf.vo.HeartVO;
import edu.howf.vo.PageMaker;
import edu.howf.vo.SearchVO;
import edu.howf.vo.UserVO;

@RequestMapping(value={"/howf","/event"})
@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	String uploadPath;
	
	
	/* 이벤트 히어로 */
	@ResponseBody
	@RequestMapping(value="eventHero.do")
	public List<EventVO> eventHero() {
		//이벤트 히어로
		List<EventVO> eventHero = boardService.eventHero();
		return eventHero;
	}
	
	
	/* howf 추천 */
	@RequestMapping(value="/howfList.do")
	public String howfList(SearchVO vo, Model model) {
		//howf 히어로
		//글이 각각 하나 이상씩 있지 않으면 에러남 주의!
		List<HOWFVO> hero = boardService.howfHero();
		
		//sort 방식
		if(vo.getSortType()==null) {
			vo.setSortType("new");
		}
		
		//페이징
		int page = vo.getPage();
		int cnt = boardService.howfCountAll(vo);
		vo.setPerPageNum(9);
		
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		
		List<HOWFVO> howf = boardService.howfSelectAll(vo);
		vo.setPage(page);
		
		model.addAttribute("howf", howf);
		model.addAttribute("search", vo);
		model.addAttribute("pm", pm);
		model.addAttribute("hero", hero);
		
		return "board/howfList";
	}
	
	@RequestMapping(value="/howfWrite.do", method=RequestMethod.GET)
	public String howfWrite() {
		return "board/howfWrite";
	}
	
	@RequestMapping(value="/howfWrite.do", method=RequestMethod.POST)
	public String howfWrite(MultipartFile file, HOWFVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 업로드
		File dir = new File(uploadPath);
		
		if(!dir.exists()) dir.mkdirs();
		
		if(!file.getOriginalFilename().isEmpty()) {
			System.out.println("파일 저장 경로 : "+uploadPath);
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString()+"_"+file.getOriginalFilename();
			file.transferTo(new File(uploadPath,fileName));
			vo.setFilename(fileName);
		}
		else {
			System.out.println("업로드된 파일 없음");
		}
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		int result = boardService.howfWrite(vo);
		
		return "redirect:/howf/howfView.do?hbidx="+vo.getHbidx();
	}
	
	@RequestMapping(value="/howfView.do")
	public String howfView(int hbidx, Model model, HttpServletRequest request, HttpSession session) {
		HOWFVO howf = boardService.howfView(hbidx);
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		if(login != null) {
			//만약 로그인 된 상태라면 찜한 여부 가져오기
			HeartVO heart = new HeartVO();
			heart.setMidx(login.getMidx());
			heart.setBidx(howf.getHbidx());
			heart.setType("howf");
			int result = boardService.heartDup(heart);
			model.addAttribute("heart", result);
		}
		
		model.addAttribute("howf", howf);
		
		return "board/howfView";
	}
	
	@RequestMapping(value="/howfModify.do", method=RequestMethod.GET)
	public String howffModify(int hbidx, Model model) {
		HOWFVO vo = boardService.howfView(hbidx);
		
		model.addAttribute("howf", vo);
		
		return "board/howfModify";
	}
	
	@RequestMapping(value="/howfModify.do", method=RequestMethod.POST)
	public String howfModify(MultipartFile file, HOWFVO vo) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			//파일 업로드
			File dir = new File(uploadPath);
			
			if(!dir.exists()) dir.mkdirs();
			
			if(!file.getOriginalFilename().isEmpty()) {
				System.out.println("파일 저장 경로 : "+uploadPath);
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString()+"_"+file.getOriginalFilename();
				file.transferTo(new File(uploadPath,fileName));
				vo.setFilename(fileName);
			}
			else {
				System.out.println("업로드된 파일 없음");
			}
		}
		int result = boardService.howfModify(vo);
		System.out.println("수정 : "+result);
		
		return "redirect:/howf/howfView.do?hbidx="+vo.getHbidx();
	}
	
	@ResponseBody
	@RequestMapping(value="/howfDelete.do")
	public int howfDelete(int hbidx) {
		return boardService.howfDelete(hbidx);
	}
	
	
	/* 지역 이벤트 */
	@RequestMapping(value="/eventList.do")
	public String eventList(SearchVO vo, Model model) {
		//히어로
		List<EventVO> hero = boardService.eventHero();
		
		//sort 방식
		if(vo.getSortType()==null) {
			vo.setSortType("new");
		}
		  
		//페이징
		int page = vo.getPage();
		int cnt = boardService.eventCountAll(vo);
		vo.setPerPageNum(9);
		  
		PageMaker pm = new PageMaker();
		pm.setSearch(vo);
		pm.setTotalCount(cnt);
		  
		List<EventVO> event = boardService.eventSelectAll(vo);
		vo.setPage(page);
		  
		model.addAttribute("event",event);
		model.addAttribute("search", vo);
		model.addAttribute("pm", pm);
		model.addAttribute("hero", hero);
		 
		return "board/eventList";
	}
	
	@RequestMapping(value="/eventView.do")
	public String eventView(int ebidx, Model model, HttpServletRequest request, HttpSession session) {
		EventVO event = boardService.eventView(ebidx);
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		
		if(login != null) {
			//만약 로그인 된 상태라면 찜한 여부 가져오기
			HeartVO heart = new HeartVO();
			heart.setMidx(login.getMidx());
			heart.setBidx(ebidx);
			heart.setType("event");
			int result = boardService.heartDup(heart);
			model.addAttribute("heart", result);
		}
		
		model.addAttribute("event", event);
		
		return "board/eventView";
	}
	
	@RequestMapping(value="/eventWrite.do", method=RequestMethod.GET)
	public String eventWrite() {
		return "board/eventWrite";
	}
	
	@RequestMapping(value="/eventWrite.do", method=RequestMethod.POST)
	public String eventWrite(MultipartFile file, EventVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		//파일 업로드
		File dir = new File(uploadPath);
				
		if(!dir.exists()) dir.mkdirs();
				
		if(!file.getOriginalFilename().isEmpty()) {
			System.out.println("파일 저장 경로 : "+uploadPath);
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString()+"_"+file.getOriginalFilename();
			file.transferTo(new File(uploadPath,fileName));
			vo.setFilename(fileName);
		}
		else {
			System.out.println("업로드된 파일 없음");
		}
				
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
				
		int result = boardService.eventWrite(vo);
		
		return "redirect:/event/eventView.do?ebidx="+vo.getEbidx();
	}
	
	@RequestMapping(value="/eventModify.do", method=RequestMethod.GET)
	public String eventModify(int ebidx, Model model) {
		EventVO event = boardService.eventView(ebidx);
		
		model.addAttribute("event", event);
		
		return "board/eventModify";
	}
	
	@RequestMapping(value="/eventModify.do", method=RequestMethod.POST)
	public String eventModify(MultipartFile file, EventVO vo) {
		int result = boardService.eventModify(vo);
		return "redirect:/event/eventView.do?ebidx="+vo.getEbidx();
	}
	
	@ResponseBody
	@RequestMapping(value="/eventDelete.do")
	public int eventDelete(int ebidx) {
		return boardService.eventDelete(ebidx);
	}
	
	
	//찜
	@ResponseBody
	@RequestMapping(value="/heartInsert.do")
	public int heartInsert(HeartVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		return boardService.heartInsert(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/heartDelete.do")
	public int heartDelete(HeartVO vo, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		return boardService.heartDelete(vo);
	}
	
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

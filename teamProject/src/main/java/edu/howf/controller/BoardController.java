package edu.howf.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.howf.service.BoardService;
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
	
	String path = "C:\\upload";
	
	@RequestMapping(value="/howfList.do")
	public String howfList(SearchVO vo, Model model) {
		//히어로
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
		File dir = new File(path);
		
		if(!dir.exists()) dir.mkdirs();
		
		if(!file.getOriginalFilename().isEmpty()) {
			System.out.println("파일 저장 경로 : "+path);
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path,fileName));
			vo.setFilename(fileName);
		}
		else {
			System.out.println("업로드된 파일 없음");
		}
		
		session = request.getSession();
		UserVO login = (UserVO)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		
		int result = boardService.howfWrite(vo);
		
		return "redirect:/howf/howfList.do";
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
}

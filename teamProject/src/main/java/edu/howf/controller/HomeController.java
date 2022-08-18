package edu.howf.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.howf.service.BoardService;
import edu.howf.service.CSService;
import edu.howf.service.NoticeService;
import edu.howf.service.StayService;
import edu.howf.service.StoryService;
import edu.howf.vo.EventVO;
import edu.howf.vo.HOWFVO;
import edu.howf.vo.NoticeVO;
import edu.howf.vo.SearchVO;
import edu.howf.vo.StayVO;
import edu.howf.vo.StoryVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(SearchVO vo, Model model) {
		vo.setSortType("new");
		//공지사항 가져오기
		NoticeVO notice = noticeService.noticepop();
		vo.setPage(1);
		model.addAttribute("notice",notice);
		
		//HOWF 추천
		List<HOWFVO> howf = boardService.howfHero();
		vo.setPage(1);
		model.addAttribute("howf", howf);
		
		//여행 이야기
		vo.setPerPageNum(4);
		List<StoryVO> story = storyService.storySelectAll(vo);
		vo.setPage(1);
		model.addAttribute("story", story);
		
		//숙박 정보
		vo.setPerPageNum(20);
		vo.setSortType("star");
		List<StayVO> stay = stayService.staySelectAll(vo);
		vo.setPage(1);
		model.addAttribute("stay", stay);
		
		 
		
		return "home";
	}
	
	@RequestMapping(value="/home.do")
	public String homeDo(SearchVO vo, Model model) {
		vo.setSortType("new");
		//공지사항 가져오기
		
		
		//HOWF 추천
		List<HOWFVO> howf = boardService.howfHero();
		vo.setPage(1);
		model.addAttribute("howf", howf);
		
		//여행 이야기
		vo.setPerPageNum(4);
		List<StoryVO> story = storyService.storySelectAll(vo);
		vo.setPage(1);
		model.addAttribute("story", story);
		
		//숙박 정보
		vo.setPerPageNum(20);
		vo.setSortType("star");
		List<StayVO> stay = stayService.staySelectAll(vo);
		vo.setPage(1);
		model.addAttribute("stay", stay);
		
		
		return "home";
	}
	
	
	//검색
	@RequestMapping(value="/search.do")
	public String search(SearchVO vo, Model model) {
		vo.setSearchType("total");
		vo.setSortType("new");
		vo.setPerPageNum(3);
		model.addAttribute("search", vo);
		model.addAttribute("searchValue", vo.getSearchValue());
		
		//HOWF 추천
		List<HOWFVO> howf = boardService.howfSelectAll(vo);
		vo.setPage(1);
		model.addAttribute("howf", howf);
		
		//여행 이야기
		List<StoryVO> story = storyService.storySelectAll(vo);
		vo.setPage(1);
		model.addAttribute("story", story);
		
		//지역 이벤트
		List<EventVO> event = boardService.eventSelectAll(vo);
		vo.setPage(1);
		model.addAttribute("event", event);
		
		//숙박 정보
		List<StayVO> stay = stayService.staySelectAll(vo);
		vo.setPage(1);
		model.addAttribute("stay", stay);
		
		
		return "Search";
	}
	
}

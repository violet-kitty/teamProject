package edu.howf.controller;

import java.text.DateFormat;
import java.util.Date;
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
import edu.howf.vo.NoticeVO;

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
	public String home(Model model) {
		//공지사항 가져오기
		
		 
		
		return "home";
	}
	
	@RequestMapping(value="/home.do")
	public String homeDo(Model model) {
		//공지사항 가져오기
		
		
		return "home";
	}
	
}

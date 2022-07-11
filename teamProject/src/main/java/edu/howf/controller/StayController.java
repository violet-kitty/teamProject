package edu.howf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.howf.service.StayService;
import edu.howf.vo.SearchVO;

//숙박정보
@RequestMapping(value="/stay")
@Controller
public class StayController {
	@Autowired
	StayService stayService;
	
	@RequestMapping(value="/stayList.do")
	public String stayList(SearchVO vo, Model model) {
		return "stay/stayList";
	}
}

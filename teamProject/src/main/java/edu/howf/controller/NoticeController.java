package edu.howf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.howf.service.NoticeService;

//공지사항
@RequestMapping(value="/notice")
@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
}

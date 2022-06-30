package edu.howf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.howf.service.NoticeService;

//사용하고 싶은 중간 url 쓰기
@RequestMapping(value="/notice")
@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
}

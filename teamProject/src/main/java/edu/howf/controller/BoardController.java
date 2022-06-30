package edu.howf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.howf.service.BoardService;

@RequestMapping(value="/board")
@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
}

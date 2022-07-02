package edu.howf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.howf.service.CSService;

//1:1문의, FAQ
@RequestMapping(value="/cs")
@Controller
public class CSController {
	
	@Autowired
	CSService csService;
	
	
	
}

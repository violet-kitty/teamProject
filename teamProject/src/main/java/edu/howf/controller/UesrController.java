package edu.howf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.howf.service.UserService;

@RequestMapping(value="/user")
@Controller
public class UesrController {
	@Autowired
	UserService userService;
}

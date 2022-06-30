package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.UserDao;

@Service
public class UserServiceImple implements UserService{
	@Autowired
	UserDao userDao;
}

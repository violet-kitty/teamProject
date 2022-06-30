package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.StayDao;

@Service
public class StayServiceImple implements StayService{
	@Autowired
	StayDao stayDao;
}

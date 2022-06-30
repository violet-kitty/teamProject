package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.CSDao;

@Service
public class CSServiceImple implements CSService{
	@Autowired
	CSDao csDao;
}

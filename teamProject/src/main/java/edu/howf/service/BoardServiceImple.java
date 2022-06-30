package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.BoardDao;

@Service
public class BoardServiceImple implements BoardService{
	@Autowired
	BoardDao boardDao;
}

package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.TeamDao;

@Service
public class TeamServiceImple implements TeamService{
	
	@Autowired
	TeamDao teamDao;
	
	
}

package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.StoryDao;

@Service
public class StoryServiceImple implements StoryService{
	@Autowired
	StoryDao storyDao;
}

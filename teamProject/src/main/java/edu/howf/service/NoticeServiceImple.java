package edu.howf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.howf.dao.NoticeDao;

@Service
public class NoticeServiceImple implements NoticeService{
	@Autowired
	NoticeDao noticeDao;
}

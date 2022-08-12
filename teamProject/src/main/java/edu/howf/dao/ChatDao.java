package edu.howf.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "edu.howf.mapper.chatMapper.";
	
	

}

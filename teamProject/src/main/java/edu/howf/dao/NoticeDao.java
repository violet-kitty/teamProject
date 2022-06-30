package edu.howf.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "edu.howf.mapper.noticeMapper";
}

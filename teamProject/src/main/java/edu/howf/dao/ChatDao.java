package edu.howf.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.howf.vo.Chat;

@Repository
public class ChatDao {

	@Autowired
	private SqlSession sqlSession;
	
	

	public List<Chat> selectchatList(Map<String, Object> map) {
		
		return sqlSession.selectList("edu.howf.mapper.chatMapper.selectChatList",map);
	}

	public List<Chat> selectFirstChatList(int roomNo) {
		return sqlSession.selectList("edu.howf.mapper.chatMapper.selectFirstChatList",roomNo);
	}

	public int insertChat(Chat chat) {
		return sqlSession.insert("edu.howf.mapper.chatMapper.insertChat",chat);
	}
	
	
	
	
}

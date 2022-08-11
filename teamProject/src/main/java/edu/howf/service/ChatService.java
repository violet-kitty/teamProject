package edu.howf.service;

import java.util.List;
import java.util.Map;

import edu.howf.vo.Chat;

public interface ChatService {
	
	List<Chat> selectChatList(Map<String, Object> map);

	List<Chat> selectFirstChatList(int roomNo);

	int insertChat(Chat chat);

}

package edu.howf.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import edu.howf.vo.ChatVO;

@Service
public interface ChatService {
	
	public void addChatRoom(ChatVO cv) throws IOException;
	
	

}

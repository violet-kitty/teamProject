package edu.howf.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.howf.dto.ChatMessageDto;


@Controller
public class ChatController {
	
	private List<ChatMessageDto> messages;
	
	ChatController(){
		messages = new ArrayList<>();
	}
	
	@RequestMapping(value = "/chat/main")
	public String showMain() {
		
		return "/chat/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/chat/doAddMessage")
	public Map doAddMessage(String writer, String body) {
		
		int id = messages.size() + 1;
		ChatMessageDto chatMessage = new ChatMessageDto(id, writer, body);
		
		messages.add(chatMessage);
		
		Map<String, Object> rs = new HashMap<>();
		
		rs.put("msg", "메시지가 전송되었습니다.");
		
		return rs;
	}

}

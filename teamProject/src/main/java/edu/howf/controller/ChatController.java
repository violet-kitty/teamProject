package edu.howf.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.howf.service.ChatService;
import edu.howf.vo.Chat;
import edu.howf.vo.UserVO;
import jdk.internal.org.jline.utils.Log;


@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	//채팅창으로 입장 // 임의 테스트
	@RequestMapping("/enter/chat.do")
    public ModelAndView enterChat(@RequestParam int roomNo,ModelAndView mav,HttpSession session) {
		
		String memberId = (String)session.getAttribute("memberId");
		List<Chat> firstList = chatService.selectFirstChatList(roomNo);
		mav.addObject("roomNo",roomNo);
		mav.addObject("memberId",memberId);
		mav.addObject("firstList",firstList);
		mav.setViewName("mypage2/chatting");
    	return mav;
    }

	@RequestMapping("/test/enter.do")
	public String enter() {
		return "mypage2/change";
	}
	
	//채팅 내역 가져오기
	@RequestMapping("/chat/chatList.do")
	@ResponseBody
	public List<Chat> selectChatList(@RequestParam int roomNo,@RequestParam int endNo) {
		int startNo = endNo-11;
//		int roomNo = Integer.parseInt(room);

			
		Map<String,Object> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("startNo",endNo-1);
//		map.put("endNo", endNo-1);
		List<Chat> list = chatService.selectChatList(map);

//		mav.addObject("list", list);
//		mav.addObject("roomNo",roomNo);
//		mav.setViewName("mypage2/chatting");
		return list;
	}

	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Chat broadcasting(Chat chat) {


    	Map<String,Object> map = new HashMap<>();
    	map.put("chat", chat);
    	
        int result = chatService.insertChat(chat);

        return chat;
    }

    
}
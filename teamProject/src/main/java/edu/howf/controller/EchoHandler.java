package edu.howf.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller
@Configuration
@RequestMapping(value = "/echo")
public class EchoHandler extends TextWebSocketHandler {
	
	private Map<String, ArrayList<WebSocketSession>> List = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	//private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		logger.info("{} 연결됨"+ session.getId());
		System.out.println(session.getId()+"연결성공"+i);
		//맵을 쓸떄 방법
		//session.put(session.geId(),session);
		//List쓸 떄 방법
		//sessionList.add(session);
		//세션값을 불러온
		//0번째 중괄호에 session.getId()을 넣으라는 뜻
		//Session값을 가지고 데이터베이스등의 작업을 하면 채팅참여 사용자 정보 리스트를 구현
		// 모든 세션에 채팅 전달
		}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String msg = message.getPayload();
		logger.info("#EchoHandler, handleMsesage");
		//0번쨰에 session.getId() 1번쨰에 message.getPayload() 넣음
		//logger.info("", new String[]{session.getId(),message.getPayload()})
		System.out.println(("{}로 부터 {} 받음"+ session.getId()+ message.getPayload()));
		//연결된 모든 클라이언트에게 메시지전송
		//getPrincipal()을 이용해서 세션에 몰려있는 유저의 정보를 불러온다. 세션의 정보는 User를 이용한것과 동일하다
		// 모든 세션에 채팅 전달
		
	/*			for ( WebSocketSession sess : sessionList) {
					sess.sendMessage(new TextMessage(session.getAcceptedProtocol()+ msg));
				}
	*/
		//맵 방법
		/*
		 * Iterator<String> sessionIds = session.ketSet().iterator(); 
		 * String sessionId = "";
		 *  while (sessionIds.hasNext()) { 
		 *  sessionId = sessionIds.next();
		 * sessions.get(sessionId).sendMessge(new TextMessage("echo" + message.getPayload())); }
		 * 
		 */	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		
		logger.info("#EchoHandler, afterConnectionClosed");
		logger.info(("{} 연결 끊김"+ session.getId()));
		//List 삭제
		if(sessionList.get(session) != null) {
			List.get(sessionList.get(session)).remove(session);
	        sessionList.remove(session);
	     // 모든 세션에 채팅 전달
		}
		//map삭제
		//sessions.remove(session.getId());
		
	}
	
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(this, "/echo").setAllowedOrigins("*");
	}

}
	


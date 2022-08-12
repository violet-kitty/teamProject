//package edu.howf.controller;
//
//import java.io.IOException;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.simp.SimpMessagingTemplate;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import edu.howf.dao.TimeUtils;
//import edu.howf.service.ChatService;
//import edu.howf.vo.ChatVO;
//import edu.howf.vo.UserVO;
//
//@Controller
//public class ChatApplicationController {
//	
//	@Autowired
//	private SimpMessagingTemplate simpMessage;
//	
//	@Autowired
//	private ChatService chatService;
//	
//	//채팅으로 거래하기(productInfo 화면)
//		@RequestMapping(value="/chatMessage", method=RequestMethod.GET)
//		public String getWebSocketWithSockJs(Model model, HttpSession session, 
//				@ModelAttribute("chatRoom") ChatVO cv) throws IOException {
//			
//			//productInfo화면에서 Chat화면에 전달해줄 parameter
//			
//			UserVO login = (UserVO) session.getAttribute("login");
//			cv.setNickname(login.getNickname());
//
//			
//			
//			//이미 chatRoom이 만들어져있는지 확인
//			if (chatService.countByChatId(cv.getCidx(), cv.getNickname()) > 0) {
//				//get ChatRoomInfo
//				ChatVO chatRoomTemp = chatService.findByChatId(cv.getCidx(), cv.getNickname());
//				//load existing chat history
//				List<ChatVO> chatHistory = chatService.readChatHistory(chatRoomTemp);
//				//transfer chatHistory Model to View
//				model.addAttribute("chatHistory", chatHistory);
//				
//			} else {
//				//chatRoom 생성			
//				chatService.addChatRoom(cv);			
//				//text file 생성
//				chatService.createFile(cv.getCidx(), chatService.getId(cv.getCidx(), cv.getNickname()));								
//			}
//				
//				//chatRoom 객체 Model에 저장해 view로 전달
//				model.addAttribute("cv", cv);
//			
//			return "chatBroadcastProduct";
//		}
//
//
//
//	
//
//}

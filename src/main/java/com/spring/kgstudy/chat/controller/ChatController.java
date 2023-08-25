//package com.spring.kgstudy.chat.controller;
//
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.spring.kgstudy.chat.service.ChatService;
//import com.spring.kgstudy.chat.vo.ChatRoomVO;
//import com.spring.kgstudy.chat.vo.ChatUserVO;
//import com.spring.kgstudy.common.search.Search;
//import com.spring.kgstudy.util.LoginUtil;
//
//import lombok.RequiredArgsConstructor;
//
//
//@RequiredArgsConstructor
//@RequestMapping("chat")
//@Controller
//public class ChatController {
//
//
//	private final ChatService chatService;
//	
//	@GetMapping("getAllChatRoom")
//	public String getAllChatRoom(Model model, Search search) {
//		
//		
//	
//		Map<String,Object> resMap= chatService.getAllChatRoom(search);
//		
//		
//		model.addAttribute("resMap",resMap);
//		
//		
//		return "chatRoomList";
//		
//		
//		
//	}
//	
//
//	@GetMapping("enterChatRoom")
//	public String enterChatRoom(Model model, Search search,HttpSession session, ChatUserVO user) {
//		
//		
//	
//	
//		
//		user.setUserId(LoginUtil.getCurrentMemberAccount(session));
//		
//		Map<String,Object> resMap= chatService.getChatRoomInfo(user, search);
//		
//		model.addAttribute("resMap",resMap);
//		
//		//웹소켓 생성
//		
//		return "chatRoom";
//		
//		
//		
//	}
//	
//	
//	@GetMapping("createChatRoom")
//	public String createChatRoom(Model model, ChatRoomVO chatRoom, String[] userList) {
//		
//		
//		Map<String,Object> resMap = chatService.createChatRoom(chatRoom, userList);
//		
//
//	
//
//		
//		model.addAttribute("resMap",resMap);
//		
//		
//		//웹소켓 생성
//		
//		return "chatRoom";
//		
//		
//		
//	}
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//}

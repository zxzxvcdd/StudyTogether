package com.spring.kgstudy.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.kgstudy.chat.service.ChatService;
import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RequestMapping("chat")
@Controller
public class ChatController {


	private final ChatService chatService;
	
	@GetMapping("getAllChatRoom")
	public String getAllChatRoom(Model model, Search search) {
		
		
	
		Map<String,Object> resMap= chatService.getAllChatRoom(search);
		
		
		model.addAttribute("resMap",resMap);
		
		
		return "/chat/chatRoomList";
		
		
		
	}
	

	@GetMapping("enterChatRoom")
	public String enterChatRoom(Model model, Search search,HttpSession session, ChatUserVO user) {
		
		
	
	
		
		user.setUserId(LoginUtil.getCurrentMemberAccount(session));
		
		Map<String,Object> resMap= chatService.getChatRoomInfo(user, search);
		
		model.addAttribute("resMap",resMap);
		
		//웹소켓 생성
		
		return "/chat/chatRoom";
		
		
		
	}
	
	
	@GetMapping("createChatRoom")
	public String createChatRoomForm(Model model, HttpSession session) {
		
	
	

//		String userId = LoginUtil.getCurrentMemberAccount(session);
		String userId="123";
		ChatUserVO chatUser = new ChatUserVO();
		
		chatUser.setChatRoomId(0);
		chatUser.setUserId(userId);
		
		
		
		List<ChatUserVO> userList = chatService.getAllMember(chatUser);
		
		System.out.println(userList);
		model.addAttribute("userList", userList);

		
		return "/chat/createChatRoom";
		
		
		
	}
	
	
	@PostMapping("createChatRoom")
	public String createChatRoom(Model model,MultipartFile file, ChatRoomVO chatRoom, String[] userList) {
		
		
		String userId= "admin";
		chatRoom.setUserId(userId);
		
		

		
		Map<String,Object> resMap = chatService.createChatRoom(chatRoom, userList,file);
		

	

		
		model.addAttribute("resMap",resMap);
		
		
		//웹소켓 생성
		
		return "/chat/createChatRoom";
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
}

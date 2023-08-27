package com.spring.kgstudy.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.chat.service.ChatService;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ChatAPIController {

	
	private final ChatService service;
	
	@GetMapping("getAllMember")
	public List<ChatUserVO> getAllMember(int chatRoomId,HttpSession session ){
		
	
		String userId = LoginUtil.getCurrentMemberAccount(session);

		ChatUserVO chatUser = new ChatUserVO();
		
		chatUser.setChatRoomId(chatRoomId);
		chatUser.setUserId(userId);
		
		
		
		List<ChatUserVO> userList = service.getAllMember(chatUser);
		
		
		return userList;
		
	}
	
	
}

package com.spring.kgstudy.chat.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageExceptionHandler;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.chat.service.ChatService;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.chat.vo.ChatVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class MessageController {

	private final ChatService chatService;
	

	@MessageMapping("/chat/message")
	public void chat(ChatVO chat) {
		
		
		System.out.println(chat);
		
		
		
		chatService.insertChat(chat);
		
		
		
	}
	
	
	@MessageMapping("/chat/close")
	public void close(ChatUserVO user) {
		
		
		
		
		user= chatService.findOneChatUser(user);
		
		System.out.println(user);
		
		user.setChatUserStamp(new Date());

		
		
		chatService.updateChatUser(user);
		
		
		
	}
	
	
    @MessageExceptionHandler
    public String exception() {
    	
    	
        return "Error has occurred.";
    }
	
	
	
	
}

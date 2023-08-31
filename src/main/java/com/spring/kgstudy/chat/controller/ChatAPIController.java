package com.spring.kgstudy.chat.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.chat.service.ChatService;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.chat.vo.ChatVO;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("chat")
@RequiredArgsConstructor
@RestController
public class ChatAPIController {

	private final ChatService service;

	@GetMapping("getAllMember")
	public List<ChatUserVO> getAllMember(int chatRoomId, HttpSession session) {

		String userId = LoginUtil.getCurrentMemberAccount(session);

		ChatUserVO chatUser = new ChatUserVO();

		chatUser.setChatRoomId(chatRoomId);
		chatUser.setUserId(userId);

		List<ChatUserVO> userList = service.getAllMember(chatUser);

		return userList;

	}


	@PostMapping("inviteUser")
	public String inviteUser(int chatRoomId, HttpSession session, @RequestParam("userList[]") String userList[] ) {


		String userId = LoginUtil.getCurrentMemberAccount(session);

		
		ChatUserVO chatUser = new ChatUserVO();

		chatUser.setChatRoomId(chatRoomId);
		chatUser.setChatUserStamp(new Date());
		ChatVO chat = new ChatVO();

		
		

		String inviteMsg = userId+"님이 ";
		if (userList != null && userList.length > 0) {

			for(String invite : userList) {

		
				chatUser.setUserId(invite);
				chat = service.insertUser(chatUser);
				if (chat != null) {

					inviteMsg += invite + ", ";

				} else {

				}

			}
			
			inviteMsg = inviteMsg.substring(0, inviteMsg.length()-2);
			inviteMsg += "님을 초대하였습니다.";

			chat.setChatContent(inviteMsg);
			service.insertChat(chat);
			
			service.sendUserList(chatUser);
			
			return "초대 성공";
		}
		
		return "초대 실패";
		
	}

	
	
	@GetMapping("exitChatRoom")
	public String exitChatRoom(ChatUserVO user,HttpSession session) {
		
		
		String userId = LoginUtil.getCurrentMemberAccount(session);

		user.setUserId(userId);
		
		if(service.deleteChatUser(user)) {
			
			ChatVO chat = new ChatVO();
			
			chat.setChatDate(new Date());
			chat.setChatContent(userId+"님이 퇴장하였습니다.");
			chat.setChatRoomId(user.getChatRoomId());
			chat.setChatState("alert");
			chat.setUserId("admin");
			
			service.insertChat(chat);
			
			return "success";
			
		}else{
			
			return "fali";
		}
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
}

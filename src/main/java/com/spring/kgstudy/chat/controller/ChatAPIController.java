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

		


		String inviteMsg = "";
		if (userList != null && userList.length > 0) {

			for(String invite : userList) {

		
				chatUser.setUserId(invite);
				chat = service.insertUser(chatUser);
				if (chat != null) {

					inviteMsg += invite + "님, ";

				} else {

				}

			}

			inviteMsg += "이 초대되었습니다.";

			chat.setChatContent(inviteMsg);
			service.insertChat(chat);
			
			service.sendUserList(chatUser);
			
			return "초대 성공";
		}
		
		return "초대 실패";
		
	}

}

package com.spring.kgstudy.chat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.chat.dao.ChatDAO;
import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.common.search.Search;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatService {


	private final ChatDAO chatDao;
	
	
	
	public List<ChatRoomVO> getAllChatRoom(Search search) {
		
		
		List<ChatRoomVO> chatRoomList = chatDao.findAllRoom(search);
		
		
		return chatRoomList;
		
		
		
		
	}
	
	
	
	
	
	
	
	
	public void updateChatCnt(int chatRoomId) {
		
		
		chatDao.updateChatCnt(chatRoomId);
		
		
		
	}
	
	
	
	
	
}

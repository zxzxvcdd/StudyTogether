package com.spring.kgstudy.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.chat.dto.ChatInfoDTO;
import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.chat.vo.ChatVO;
import com.spring.kgstudy.common.search.Search;

@Mapper
public interface ChatDAO {
	
	
	public List<ChatRoomVO> findAllRoom(Search search);
	
	public ChatInfoDTO findOneRoom(Search search);
	
	public int findAllRoomCnt(int chatRoomId, Search search);
	
	public int findAllChat(int chatRoomId,Search search);
	
	public ChatUserVO findOneChatUser(ChatUserVO user);
	

	public boolean insertChatRoom(ChatRoomVO chatRoom);
	
	public boolean insertChatUser(ChatUserVO chatUser);
	
	public boolean insertChat(ChatVO chat);
	
		
	
	public boolean updateChatRoom(ChatRoomVO chatRoom);
	
	public boolean updateChatUser(ChatUserVO chatUser);
	
	public boolean updateChat(ChatVO chat, Search search);
	public boolean updateChatCnt(int chatRoomId);
	
	
	public boolean deleteChatRoom(ChatRoomVO chatRoom);
	
	public boolean deleteChatUser(ChatUserVO chatUser);
	
	public boolean deleteChat(ChatVO chat);
	
	
	
	
	
	
	
	
	

}

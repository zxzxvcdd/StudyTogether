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
	
	
	public List<ChatInfoDTO> findAllRoom(Search search);
	
	public ChatInfoDTO findOneRoom(Search search);
	
	public int findAllRoomCnt(Search search);
	
	
	public int findAllChat(Search search);
	
	
	
	public boolean updateChatUser(ChatUserVO chatUser);
	
	
	public boolean updateChatRoom(ChatRoomVO chatRoom);
	
	public boolean updateChat(ChatVO chat);
	
	
	
	
	
	
	
	
	
	

}

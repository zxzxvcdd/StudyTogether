package com.spring.kgstudy.chat.dto;

import java.util.List;

import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.chat.vo.ChatVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatInfoDTO {

	private ChatRoomVO chatRoom;
	
	private List<ChatUserVO> chatUserList;
	
	private List<ChatVO> chatList;


	
	
	
}

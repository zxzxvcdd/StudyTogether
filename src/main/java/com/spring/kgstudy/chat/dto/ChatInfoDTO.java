package com.spring.kgstudy.chat.dto;

import java.util.List;

import com.spring.kgstudy.chat.vo.ChatRoomVO;
import com.spring.kgstudy.chat.vo.ChatUserVO;
import com.spring.kgstudy.chat.vo.ChatVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter@Setter
public class ChatInfoDTO extends ChatRoomVO {

	
	private List<ChatUserVO> chatUserList;
	
	private List<ChatVO> chatList;

	@Override
	public String toString() {
		return "ChatInfoDTO [chatUserList=" + chatUserList + ", chatList=" + chatList + ", getChatRoomId()="
				+ getChatRoomId() + ", getChatRoomTitle()=" + getChatRoomTitle() + ", getChatRoomComment()="
				+ getChatRoomComment() + ", getChatRoomGoal()=" + getChatRoomGoal() + ", getChatRoomMax()="
				+ getChatRoomMax() + ", getChatRoomCategory()=" + getChatRoomCategory() + ", getChatRoomImg()="
				+ getChatRoomImg() + ", getChatRoomState()=" + getChatRoomState() + ", getUserId()=" + getUserId()
				+ ", getExitOpt()=" + getExitOpt() + ", getExitCk()=" + getExitCk() + ", getChatRoomDate()="
				+ getChatRoomDate() + ", getChatRoomCnt()=" + getChatRoomCnt() + "]";
	}


	
	
	
	
	
}

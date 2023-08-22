package com.spring.kgstudy.chat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatUserVO {

	private String userId;
	private int chatRoomId;
	private String roomAuth;
	private Date chatUserStamp;
	
	
}

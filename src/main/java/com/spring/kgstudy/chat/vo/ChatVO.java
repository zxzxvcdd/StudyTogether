package com.spring.kgstudy.chat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatVO {

	
	private int chatId;
	private int chatRoomId;
	private String userId;
	private String chatContent;
	private Date chatDate;
	private String chatState;
	private int chatCkCnt;
	
	
	
}

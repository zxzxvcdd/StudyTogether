package com.spring.kgstudy.chat.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomVO {


	private int chatRoomId;
	private String chatRoomTitle;
	private String chatRoomComment;
	private String chatRoomGoal;
	private int chatRoomCategory;
	private String chatRoomState;
	private String userId;
	private int exitOpt;
	private char exitYN;

	

	
	
	
	
	
}

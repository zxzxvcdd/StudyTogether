package com.spring.kgstudy.chat.vo;

import java.util.Date;

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

	private int exitOpt;
	private char exitYN;

	

	
	
	
	
	
}

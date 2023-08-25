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
	private int chatRoomMax;
	private int chatRoomCategory;
	private String chatRoomImg;
	private String chatRoomState;
	private String userId;
	private int exitOpt;
	private String exitCk;
	private Date chatRoomDate;
	

	
	private int chatRoomCnt;
	
	
	
	
}

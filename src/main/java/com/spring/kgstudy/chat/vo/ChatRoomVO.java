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
	private String chatRoomGoal;
	private String chatRoomComment;
	private int chatRoomAttendanceCnt;
	private int chatRoomRanking;
	private String attendDay;
	private String attendTime;
	private int forcedExitOpt;
	private char forcedExitYN;
	
	private int category;
	private String sCategory;
	private String userId;
	private String wId;
	private String status;
	private char sleader;
	

	
	
	
	
	
}

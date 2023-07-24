package com.spring.kgstudy.member.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class IdCheckDTO {
	
	private String user_id;
	private int result;
	
}

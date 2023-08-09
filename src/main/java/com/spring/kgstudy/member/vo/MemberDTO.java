package com.spring.kgstudy.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDTO {

	private String userId;
	private String userName;
	private String userEmail;
	private String userTel;
	private String userGender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userBirthday;
	private String userGrant;
	private String storeName;
	private int storeId;
	
}

package com.spring.kgstudy.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Data @AllArgsConstructor
public class MemberVO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_tel;
	private String user_gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_birthday;
	private String user_grant;
	
}

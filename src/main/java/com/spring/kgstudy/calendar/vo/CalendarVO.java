package com.spring.kgstudy.calendar.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CalendarVO {
	
	private int id;
	private String title;
	private String content;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end;
	
	private String color;
	
}

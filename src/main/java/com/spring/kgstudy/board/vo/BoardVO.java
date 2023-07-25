package com.spring.kgstudy.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardVO {
	private int boardId; //게시판 번호
	private String userId; // 회원 ID
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date indate; // 작성일
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private int count; // 조회수
	//private String filename; //파일
	private int boardGroup; // 부모글와 답글을 묶는 역할
	private int boardSequence; //답글의 순서
	private int boardLevel; //답글의 레벨(들여쓰기)
	private int boardAvailable; // 삭제된 글인지 여부	
}

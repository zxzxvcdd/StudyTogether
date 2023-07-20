package com.spring.kgstudy.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int board_id;
	private String user_id;
	private Date date;
	private String title;
	private String content;
	private String writer;
	private int hitup;
	private String filename;
	private int ref;
	private int re_step;
	private int re_level;
	
}

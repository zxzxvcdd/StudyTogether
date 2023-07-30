package com.spring.kgstudy.review.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Data @AllArgsConstructor
public class ReviewVO {
	
	private int review_id;
	private String user_id;
	private int store_id;
	private String store_name;
	private int reservation_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date review_date;
	private String review_content;
	private String review_filename;
	private double review_star;
	
}

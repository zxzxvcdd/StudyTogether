package com.spring.kgstudy.review.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.spring.kgstudy.board.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewVO {
	
	private int review_id; //리뷰 코멘트 번호
	private String user_id; // 회원 ID
	private int store_id; // 지점 ID
	private String store_name; // 지점명
	private int reservation_id; // 예약 ID
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date review_date; //작성일
	private String review_content; // 내용
	private String review_filename; // 파일
	private double review_star; // 평점
	
	
}

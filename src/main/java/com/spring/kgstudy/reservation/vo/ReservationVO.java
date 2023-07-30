package com.spring.kgstudy.reservation.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.spring.kgstudy.review.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data @AllArgsConstructor
public class ReservationVO {
	
	private int reservationId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reservationDay;
	private int storeId;
	private String storeName;
	private int passId;
	private String userId;
	private int seatId;
	private int useTime;
	
}

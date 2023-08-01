package com.spring.kgstudy.seat.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeatVO {
	
	private int reservationId;
	private int seatId;
	private String seatName;
	private int storeId;
	private String userId;
	private String seatType;
	private int x;
	private int y;


	
	
	
}

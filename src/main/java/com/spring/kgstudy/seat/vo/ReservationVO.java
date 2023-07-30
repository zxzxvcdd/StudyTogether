package com.spring.kgstudy.seat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservationVO {

	private int reservationId;
	private String storeName;
	private Date reservationDay;
	private int storeId;
	private int passId;
	private String userId;
	private int seatId;
	private int useTime;
	
	
}

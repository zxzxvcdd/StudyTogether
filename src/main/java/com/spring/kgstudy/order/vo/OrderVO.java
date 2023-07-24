package com.spring.kgstudy.order.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderVO {


	private int orderId;
	private String userId;
	private String rderName;
	private int orderPrice;
	private Date orderDate;
	
	
	
	
	
	
}

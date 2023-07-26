package com.spring.kgstudy.order.vo;

import java.util.Date;

import com.spring.kgstudy.common.order.OrderState;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderVO {


	private int orderId;
	private String impUid;
	private String userId;
	private String orderName;
	private OrderState orderState;
	private int orderPrice;
	private Date orderDate;
	
	
	
	
	
	
}

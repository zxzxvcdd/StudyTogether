package com.spring.kgstudy.order.dto;

import java.util.Date;

import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.order.vo.OrderVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter@Setter@ToString
public class OrderDTO extends OrderVO{


	private PassType passType;
	private int passTime;
	private Date passStart;
	private Date passEnd;
	private PassState passState;
	
	
}

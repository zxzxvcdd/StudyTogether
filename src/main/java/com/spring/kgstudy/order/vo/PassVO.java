package com.spring.kgstudy.order.vo;

import java.util.Date;

import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class PassVO {
	

	
	private int passId;
	private int orderId;
	private int menuId;
	private String userId;
	private PassType passType;
	private int passTime;
	private Date passStart;
	private Date passEnd;
	private int passPrice;
	private String passName;
	private PassState passState;
	


			
			
	
	

}

package com.spring.kgstudy.pass.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class PassVO {
	
	
	
//	create table pass_table(
//
//			pass_id number constraint pass_id_pk primary key
//			, order_id number
//			, user_id number
//			, pass_type varchar2(200)
//			, pass_time number
//			, pass_used number
//			, pass_start date
//			, pass_end date
//			, pass_price number
//			, pass_name varchar2(200)
//			, pass_state vatchar2(200)
//			, constraint pass_user_fk foreign key (user_id) references meber(user_id)
//			, constraint pass_order_fk foreign key (order_id) references order_table(order_id)
//			, constraint pass_type_ck check(pass_type in('time','seson')
//			,
//
//			)
	
	private int passId;
	private int orderId;
	private String userId;
	private String passType;
	private int passTime;
	private Date passStart;
	private Date passEnd;
	private int passPrice;
	private String passName;
	private String passState;
	


			
			
	
	

}

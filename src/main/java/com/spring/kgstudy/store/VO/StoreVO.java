package com.spring.kgstudy.store.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {

	
//	create table store_table(
//			store_id number constraint store_id_pk primary key
//			, user_id varchar(200)
//			, store_name varchar2(200) constraint store_name_unique UNIQUE (store_name)
//			, store_address varchar2(200)
//			, store_road_address varchar2(200)
//			, store_tel varchar2(40)
//			, store_info varchar2(200)
//			, store_lat number
//			, store_lng number
//			, constraint store_user_fk foreign key (user_id) references member(user_id)
//			);
//	
	
	private int storeId;
	private String userId;
	private String storeName;
	private String storeAddress;
	private String storeRoadAddress;
	private String storeTel;
	private String storeInfo;
	private double storeLat;
	private double storeLng;
	
}

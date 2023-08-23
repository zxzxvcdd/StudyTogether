package com.spring.kgstudy.store.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {


	
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

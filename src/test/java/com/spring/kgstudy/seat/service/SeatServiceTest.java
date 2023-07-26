package com.spring.kgstudy.seat.service;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.kgstudy.seat.vo.SeatVO;



class SeatServiceTest {

	
	@Autowired
	private SeatService service;
	
	@Test
	void test() {
	
	
		
		ArrayList<SeatVO> voList = new ArrayList<SeatVO>();
		
		for(int i=1;i<=30;i++) {
			SeatVO vo = new SeatVO();

			vo.setSeatName(""+i);
			vo.setStoreId(1);
			vo.setSeatType("Y");
			voList.add(vo);
			
			
		}
		
		
		
		service.insertSeat(voList);
		
	}

}

package com.spring.kgstudy.seat.service;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.seat.vo.SeatVO;


@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class SeatServiceTest {

	
	@Autowired
	private SeatService service;
	
	@Test
	void test() {
	
	
		
		ArrayList<SeatVO> voList = new ArrayList<SeatVO>();
		
		for(int i=1;i<=30;i++) {
			SeatVO vo = new SeatVO();

			vo.setSeatName(""+i);
			vo.setStoreId(4);
			vo.setSeatType("Y");
			voList.add(vo);
			
		}
		
		

		service.insertSeat(voList);
		
	
		
	}
	
	
	@Test
	void checkin() {
		
		
		
		SeatVO seat = new SeatVO();
		
		PassVO pass =new PassVO();
		
		pass.setPassId(1);
		
		
		seat.setSeatId(53);
		seat.setSeatName("23");
		seat.setStoreId(2234);
		seat.setSeatType("Y");
		
		boolean result = service.seatChoise(seat, pass);
		
		System.out.println(result);
		
		
	}
	
	@Test
	void checkout() {
		
		
		int reservId = 8;
	
		
		boolean result = service.seatCheckOut(reservId);
		
		System.out.println(result);
		
		
	}
	
	
	
	

}

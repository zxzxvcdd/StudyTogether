package com.spring.kgstudy.seat.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.scheduler.ReserveScheduler;
import com.spring.kgstudy.seat.dao.SeatDAO;
import com.spring.kgstudy.seat.vo.ReservationVO;
import com.spring.kgstudy.seat.vo.SeatVO;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class SeatServiceTest {

	@Autowired
	private SeatService service;
	@Autowired
	private SeatDAO sdao;
	@Autowired
	private OrderDAO orderDao;

	@Test
	void test() {

		/*
		 * ArrayList<SeatVO> voList = new ArrayList<SeatVO>();
		 * 
		 * for(int i=1;i<=30;i++) { SeatVO vo = new SeatVO();
		 * 
		 * vo.setSeatName(""+i); vo.setStoreId(4); vo.setSeatType("Y"); voList.add(vo);
		 * 
		 * }
		 * 
		 * 
		 * 
		 * service.insertSeat(voList);
		 */

	}

	@Test
	public void reservDummy() {
		LocalDate now1 = LocalDate.now();
		
		LocalDate start = now1.minusYears(40);
		
		for (int i = 1; i <=3800; i++) {
	
			 Random random1 = new Random();
			 Long ranDay = (long) (random1.nextInt((int) (now1.toEpochDay() -start.toEpochDay()+1)) + start.toEpochDay());
			 
			 Date now = 	Date.from(LocalDate.ofEpochDay(ranDay).atStartOfDay(ZoneId.systemDefault()).toInstant());
			SeatVO vo = new SeatVO();

			vo.setSeatId(i + 720);

			Search search = new Search();
			search.setType("pass");
			search.setKeyword("" + i);

			PassVO pass = orderDao.findOnePass(search);

			if(pass.getPassState()==PassState.EXPIRED) {
				
				return;
			}
			vo = sdao.findSeatBySeatId(vo.getSeatId());

			if (vo.getSeatType().equals("Y")) {

			

				if (pass.getPassState() == PassState.DEACTIVE) {

					pass.setPassState(PassState.ACTIVE);

					if (pass.getPassType() == PassType.SEASON) {

						pass.setPassStart(now);

						Date endDate = new Date(now.getTime() + pass.getPassTime() * 1000);

						pass.setPassEnd(endDate);

						orderDao.updatePass(pass);
						
					}
				}

				ReservationVO reserv = new ReservationVO();

				reserv.setPassId(pass.getPassId());
				reserv.setUserId(pass.getUserId());
				reserv.setReservationDay(now);
				reserv.setSeatId(vo.getSeatId());
				reserv.setStoreId(vo.getStoreId());

				Random random = new Random();
				
				int ranM = random.nextInt(60*24)+1;
				
				reserv.setUseTime(60*ranM);

				sdao.insertReserv(reserv);

				System.out.println(reserv);


				if (pass.getPassType() == PassType.TIME) {

					int passTime = pass.getPassTime()-ranM;
					pass.setPassTime(passTime);
					
					if(passTime<=0) {
						
						pass.setPassState(PassState.EXPIRED);
						pass.setPassTime(0);
					}
				
					
				
					
					orderDao.updatePass(pass);


					
				}
				
				
				

			}
		}

	}

	@Test
	void checkin() {

		SeatVO seat = new SeatVO();

		PassVO pass = new PassVO();

		pass.setPassId(3);

		seat.setSeatId(53);
		seat.setSeatName("23");
		seat.setStoreId(2234);
		seat.setSeatType("Y");

		ReservationVO reserv = service.seatChoise(seat, pass);

		System.out.println(reserv);

	}

	@Test
	void checkout() {

		int reservId = 5002;

		boolean result = service.seatCheckOut(reservId);

		System.out.println(result);

	}

}

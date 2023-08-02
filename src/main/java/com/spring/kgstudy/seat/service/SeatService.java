package com.spring.kgstudy.seat.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.scheduler.ReserveScheduler;
import com.spring.kgstudy.seat.dao.SeatDAO;
import com.spring.kgstudy.seat.vo.ReservationVO;
import com.spring.kgstudy.seat.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SeatService{
	
	
	private final SeatDAO sdao;
	
	private final OrderDAO orderDao;
	
	public ArrayList<SeatVO> test(int storeId) {
		return sdao.findSeat(storeId);
	}
	
	
	public int updateTimePass() {
		
		int result = 0;
		
		
		
		Search search = new Search();
		
		
		search.setType("ex");
	
		
		ArrayList<PassVO> timePassList = orderDao.findPass(search);
		
		
		for(PassVO timePass : timePassList) {
			
			
			timePass.setPassState(PassState.EXPIRED);
			
			if(orderDao.updatePass(timePass)) result++;
			
		
			
			
		}
		
		
		
		
		
		
		return result;
		
		
		
	}
	
	
	
	public int insertSeat(List<SeatVO> voList) {
		
		int flag=0;
		for(SeatVO vo : voList) { 
			
			
			
			if(vo.getSeatId()>0) {
				
				if(!sdao.updateSeat(vo)){
					flag++;
				}
			}else {
				
				if(!sdao.insertSeat(vo)) {
					flag++;
				};
				
			}
			
			
			
		}
		return flag;
		
	
	}
	
	public boolean deleteSeat(int seatId) {
		
		
		boolean result =sdao.deleteSeat(seatId);
		
		return result;
		
	
	}
	
	
	//좌석선택

	public ReservationVO seatChoise(SeatVO vo,PassVO pass) {

		ReservationVO reserv= null;
		int seatId = vo.getSeatId();

		Search search= new Search();
		search.setType("pass");
		search.setKeyword(""+pass.getPassId());
		
		pass = orderDao.findOnePass(search);
		
		vo =sdao.findSeatBySeatId(seatId);
		vo.setUserId(pass.getUserId());
		
		
		if(pass.getPassState()==PassState.EXPIRED) {
			
			return null;
		}
		
		
		String type = vo.getSeatType();
		

		System.out.println("type"+type);

		if(type.equals("Y")) {

			


			
			
			Date now = new Date();
			
			if(pass.getPassState()==PassState.DEACTIVE) {
				
				pass.setPassState(PassState.ACTIVE);
				
				if(pass.getPassType()==PassType.SEASON) {
					
					pass.setPassStart(now);
					
					Date endDate = new Date(now.getTime()+pass.getPassTime()*1000);
					
					System.out.println(endDate);
					pass.setPassEnd(endDate);
				

					orderDao.updatePass(pass);
			
					
				}
			}
			
			
			reserv = new ReservationVO();
			
			
			
			reserv.setPassId(pass.getPassId());
			reserv.setUserId(pass.getUserId());
			reserv.setReservationDay(now);
			reserv.setSeatId(vo.getSeatId());
			reserv.setStoreId(vo.getStoreId());
			reserv.setUseTime(0);
			
			
			System.out.println(reserv);
			
			
			if(!sdao.insertReserv(reserv)) return null;
			
			
			vo.setReservationId(reserv.getReservationId());			
			vo.setSeatType("N");

			System.out.println(vo);

			if(!sdao.updateSeat(vo)) return null;
			

			
			
			if(pass.getPassType()==PassType.TIME) {
				
				Long endTime = now.getTime()+pass.getPassTime()*1000;
				pass.setPassEnd(new Date(endTime));
				pass.setPassStart(now);
			
				System.out.println(pass);
				 if(!orderDao.updatePass(pass))return null;
				
				
				
				
				Calendar cal=Calendar.getInstance();
				
				cal.setTime(now);
				cal.set(Calendar.HOUR_OF_DAY, 23);
				cal.set(Calendar.MINUTE, 0);
				cal.set(Calendar.SECOND, 0);
				
				Date deadLine = cal.getTime();
				
				
			
				if(deadLine.getTime()>endTime) {
				
					ReserveScheduler.checkInList.add(endTime, reserv.getReservationId());
				
					
					
				}
				
				
				
				
				
				
				
				
				
				
			}
			
			
			
			
		}
		
		return reserv;
		
    }
    
    

	//좌석퇴실

	public boolean seatCheckOut(int reservId) {


		Search search= new Search();
		
		search.setType("reservation");
		search.setKeyword(""+reservId);
		
		
		ReservationVO reserv = sdao.findOneResrv(search);
		
		System.out.println(reserv);
		if(reserv.getUseTime()!=0)return false;
		
		search.setType("pass");
		search.setKeyword(""+reserv.getPassId());
				
		
		
		PassVO pass =orderDao.findOnePass(search);
		
		System.out.println(pass);
		
		int usedSec = (int) (new Date().getTime()- reserv.getReservationDay().getTime())/1000 ;
		
		reserv.setUseTime(usedSec);
		
		if(!sdao.updateResrv(reserv)) return false;
		System.out.println(reserv);
		
		
		if(pass.getPassType()==PassType.TIME) {
			
			
			
			int reSec = pass.getPassTime()-usedSec;
			
			if(reSec<=0) {
				pass.setPassState(PassState.EXPIRED);
				reSec=0;
			}
			pass.setPassTime(reSec);
			
			if(!orderDao.updatePass(pass))return false;
			
			System.out.println(pass);
			System.out.println("엔드타임" + pass.getPassEnd().getTime());
			
			
			List<Integer> checkInListByTime = ReserveScheduler.checkInList.get(pass.getPassEnd().getTime());
			
			if(checkInListByTime!=null ) {
				if(checkInListByTime.size() ==1) {
				System.out.println(ReserveScheduler.checkInList.remove(pass.getPassEnd().getTime()));
				
				}else {
					
					for(int i=0; i<checkInListByTime.size();i++) {
						
						if(checkInListByTime.get(i) == pass.getPassEnd().getTime()) {
							
							System.out.println(checkInListByTime.remove(i));
							
							}
						
							}
				
				
				
					}
			}
			
			
			
			
			
			
			
			
		}
		

		
		SeatVO vo = sdao.findSeatBySeatId(reserv.getSeatId());


		
		

		String type = sdao.seatCheck(reserv.getSeatId());


		if(type.equals("N")) {



			vo.setSeatType("Y");
			vo.setUserId("");

			
	
			boolean result = sdao.updateSeat(vo);
		
			System.out.println(vo);

			return result;
		}

		return false;

	}



	public Map<String, Object> findPassList(Search search) {
		
		
		Map<String,Object> resMap = new HashMap<String, Object>();
		
		
		ArrayList<PassVO> passList = orderDao.findPass(search);
		

		ArrayList<PassVO> timePass = new ArrayList<PassVO>();
		ArrayList<PassVO> dayPass = new ArrayList<PassVO>();
		
		int sumPassTime = 0;
		
		int totalPrice = 0;
		
		for(PassVO pass : passList) {
			
			totalPrice += pass.getPassPrice();
			
			if(pass.getPassType()==PassType.TIME) {
				timePass.add(pass);
				
				
				sumPassTime += pass.getPassTime();
				
				
				
			}else {
				dayPass.add(pass);
			}
		}
		
		
		
		resMap.put("totalPrice", totalPrice);
		resMap.put("sumPassTime", sumPassTime);
		  
		resMap.put("timePassList", timePass);
		resMap.put("dayPassList", dayPass);
		
		
		return resMap;
	}
	

	


	}
	
	

	



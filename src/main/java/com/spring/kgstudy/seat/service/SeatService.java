package com.spring.kgstudy.seat.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.PassVO;
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
	
	
	
	public boolean insertSeat(ArrayList<SeatVO> voList) {
		
		
		for(SeatVO vo : voList) { 
			
			
			
			if(vo.getSeatId()>0) {
				
				sdao.updateSeat(vo);
			}else {
				
				sdao.insertSeat(vo);
				
			}
			
			
			
		}
		return true;
		
	
	}
	
	
	//좌석선택

	public boolean seatChoise(SeatVO vo,PassVO pass) {

    	boolean result = false;
		int seatId = vo.getSeatId();

		Search search= new Search();
		search.setType("pass");
		search.setKeyword(""+pass.getPassId());
		
		pass = orderDao.findOnePass(search);
		
		System.out.println(pass);
		
		if(pass.getPassState()==PassState.EXPIRED) {
			
			return result;
		}
		
		
		String type = sdao.seatCheck(seatId);
		

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
					

					
			
					
				}
			}
			
			
			ReservationVO reserv = new ReservationVO();
			
			
			
			reserv.setPassId(pass.getPassId());
			reserv.setUserId(pass.getUserId());
			reserv.setReservationDay(now);
			reserv.setSeatId(vo.getSeatId());
			reserv.setStoreId(vo.getStoreId());
			reserv.setUseTime(0);
			
		
			
			
			if(!sdao.insertReserv(reserv)) return result;
			
			System.out.println(reserv);

			vo.setReservationId(reserv.getReservationId());			
			vo.setSeatType("N");

			System.out.println(vo);
			if(!sdao.updateSeat(vo))return result;
			

			
			
			if(pass.getPassType()==PassType.TIME) {
				
				
				pass.setPassStart(now);
			
				System.out.println(pass);
				 if(!orderDao.updatePass(pass))return result;
				
				
				
				System.out.println(5);

				Calendar cal=Calendar.getInstance();
				
				cal.setTime(now);
				cal.set(Calendar.HOUR_OF_DAY, 23);
				cal.set(Calendar.MINUTE, 0);
				cal.set(Calendar.SECOND, 0);
				
				Date deadLine = cal.getTime();
				
				System.out.println(deadLine);
				
				if(deadLine.getTime()>now.getTime()+pass.getPassTime()*1000) {
					
					//동적 스케쥴링
					
					System.out.println("스케쥴");
					
					
				}
				result = true;
				
				
				
				
				
				
				
				
				
			}
			
			
			
			
		}
		
		return result;
		
    }
    
    

	//좌석퇴실

	public boolean seatCheckOut(int reservId) {


		Search search= new Search();
		
		search.setType("reservation");
		search.setKeyword(""+reservId);
		
		
		ReservationVO reserv = sdao.findOneResrv(search);
		
		if(reserv.getUseTime()!=0)return false;
		System.out.println(reserv);
		
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
			
			//스케줄 삭제 처리
			
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
	
		
		
		for(PassVO pass : passList) {
			
			if(pass.getPassType()==PassType.TIME) {
				timePass.add(pass);
				
			}else {
				dayPass.add(pass);
			}
		}
		
		
		
		resMap.put("timePassList", timePass);
		resMap.put("dayPassList", dayPass);
		
		
		return resMap;
	}


	}
	
	

	



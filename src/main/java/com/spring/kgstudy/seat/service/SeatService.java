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
    @Async
	public boolean seatChoise(SeatVO vo,PassVO pass) {

    	boolean result = false;
		int seatId = vo.getSeatId();

		Search search= new Search();
		search.setType("pass");
		search.setKeyword(""+pass.getPassId());
		
		pass = orderDao.findOnePass(search);
		
		
		if(pass.getPassState()==PassState.EXPIRED) {
			
			return result;
		}
		
		
		String type = sdao.seatCheck(seatId);
		

		if(type.equals("Y")) {

			


			
			
			Date now = new Date();
			
			if(pass.getPassState()==PassState.DEACTIVE) {
				
				pass.setPassState(PassState.ACTIVE);
				
				if(pass.getPassType()==PassType.SEASON) {
					
					pass.setPassStart(now);
					
					Date endDate = new Date(now.getTime()+pass.getPassTime()*1000);
					pass.setPassEnd(endDate);
					

					
					if(orderDao.updatePass(pass))return result;
					
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
			
			vo.setReservationId(reserv.getReservationId());			
			vo.setSeatType("N");
			if(!sdao.updateSeat(vo))return result;
			
			
			if(pass.getPassType()==PassType.TIME) {
				
				
				 if(orderDao.updatePass(pass))return result;
				
				
				
				

				Calendar cal=Calendar.getInstance();
				
				cal.setTime(now);
				cal.set(Calendar.HOUR_OF_DAY, 23);
				cal.set(Calendar.MINUTE, 0);
				cal.set(Calendar.SECOND, 0);
				
				Date deadLine = cal.getTime();
				
				if(deadLine.getTime()>now.getTime()+pass.getPassTime()*1000) {
					
					//동적 스케쥴링
					
					
					
					
				}
				result = true;
				
				
				
				
				
				
				
				
				
			}
			
			
			
			
		}
		
		return result;
		
    }
    
    

	//좌석퇴실
    @Async
	public boolean seatCheckOut(SeatVO vo) {

		int seatId = vo.getSeatId();
		
		

		Search search= new Search();
		
		search.setType("seat");
		search.setKeyword(""+seatId);
		
		
		ReservationVO reserv = sdao.findOneResrv(search);
		
		
		
		search.setType("pass");
		search.setKeyword(""+reserv.getPassId());
				
		
		
		PassVO pass =orderDao.findOnePass(search);
		
		int usedSec = (int) (new Date().getTime()- reserv.getReservationDay().getTime()) * 1000;
		
		reserv.setUseTime(usedSec);
		
		if(sdao.updateResrv(reserv)) return false;
		
		
		
		if(pass.getPassType()==PassType.TIME) {
			
			
			
			int reSec = pass.getPassTime()-usedSec;
			
			if(reSec<=0) {
				pass.setPassState(PassState.EXPIRED);
				reSec=0;
			}
			pass.setPassTime(reSec);
			
			if(orderDao.updatePass(pass))return false;
			
			
			//스케줄 삭제 처리
			
		}
		
		
		

		String type = sdao.seatCheck(seatId);


		if(type.equals("N")) {



			vo.setSeatType("Y");
			vo.setUserId("");

	
			boolean result = sdao.updateSeat(vo);
		

			return result;
		}

		return false;

	}



	public Map<String, Object> findPassList(Search search) {
		
		
		Map<String,Object> resMap = new HashMap<String, Object>();
		
		ArrayList<PassVO> passList = orderDao.findPass(search);
		

		ArrayList<PassVO> timePass = new ArrayList<PassVO>();
		ArrayList<PassVO> dayPass = new ArrayList<PassVO>();
	
		
		System.out.println(passList);
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
	
	

	



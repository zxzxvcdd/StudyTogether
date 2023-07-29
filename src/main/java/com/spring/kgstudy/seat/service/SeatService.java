package com.spring.kgstudy.seat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.vo.MenuVO;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.seat.dao.SeatDAO;
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
	public boolean seatChoise(SeatVO vo) {

		int seatId = vo.getSeatId();

		String type = sdao.seatCheck(seatId);


		if(type.equals("Y")) {



			vo.setSeatType("N");

			System.out.println(vo);
			boolean result = sdao.updateSeat(vo);
			System.out.println(result);
			
			return result;
			
		}
		
		return false;
		
    }
    
    

	//좌석퇴실
	public boolean seatCheckOut(SeatVO vo) {

		int seatId = vo.getSeatId();
		
		System.out.println(seatId);

		String type = sdao.seatCheck(seatId);

		System.out.println("service: "+type);

		if(type.equals("N")) {



			vo.setSeatType("Y");
			vo.setUserId("");

			System.out.println(vo);
			boolean result = sdao.updateSeat(vo);
			System.out.println(result);

			return result;
			}

		return false;

		}
	
	
		/*
		 * public boolean findSeatByUser(String userId, String seatType) {
		 * 
		 * int cnt = sdao.findSeatByUser(userId, seatType);
		 * 
		 * System.out.println("findSeatByUser: "+cnt);
		 * 
		 * if(cnt > 1) { return false; }else { return true; }
		 * 
		 * }
		 */



	public Map<String, Object> findPassList(Search search) {
		
		
		ArrayList<PassVO> passList = orderDao.findPass(search);
		

		ArrayList<PassVO> timePass = new ArrayList<PassVO>();
		ArrayList<PassVO> dayPass = new ArrayList<PassVO>();
	
		Map<String,Object> resMap = new HashMap<String, Object>();
		
		for(PassVO pass : passList) {
			
			if(pass.getPassType()==PassType.TIME) {
				timePass.add(pass);
				
			}else {
				dayPass.add(pass);
			}
		}
		
		
		
		
		return null;
	}


	}

	
	
	

	



package com.spring.kgstudy.seat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.seat.dao.SeatDAO;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SeatService{
	
	
	private final SeatDAO sdao;
	
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
	
	
	public boolean seatChoise(int seatId, String userId) {
	
		
		String type = sdao.seatCheck(seatId);
		
		if(type.equals("Y")) {
			
			SeatVO vo = new SeatVO();
			
			vo.setSeatType(type);
			vo.setUserId(userId);
			
			sdao.updateSeat(vo);
			
			
			
			
			
			
			
		}
		
		
	}
	
	
	
	

	

}

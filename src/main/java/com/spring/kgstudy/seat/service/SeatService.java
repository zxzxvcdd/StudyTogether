package com.spring.kgstudy.seat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.seat.dao.SeatDAO;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SeatService{
	
	
	private final SeatDAO sdao;
	
	//좌석출력
	public ArrayList<SeatVO> test(int storeId) {
		return sdao.findSeat(storeId);
	}
	
	
	//좌석추가
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
	public boolean seatChoise(SeatVO vo) {
	
		int seatId = vo.getSeatId();
		
		String type = sdao.seatCheck(seatId);
		
		
		if(type.equals("Y")) {
			
			

			vo.setSeatType("N");

			System.out.println(vo);
			boolean result = sdao.updateSeat(vo);
			System.out.println(result);
			
			return true;
		}
		
		return false;
		
	}
	
	
	//좌석퇴실
    @Async
	public boolean seatCheckOut(SeatVO vo) {
		
		int seatId = vo.getSeatId();
		
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
		
		
	}
	
	
	
	

	



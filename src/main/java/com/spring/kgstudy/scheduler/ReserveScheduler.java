package com.spring.kgstudy.scheduler;

import java.util.Date;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class ReserveScheduler {

	
	public static MultiValueMap<Long,Integer> checkInList = new LinkedMultiValueMap<>();
	
	private final SeatService seatService;
 	
	
	   @Scheduled(cron = "0 * 9-22 * * * ")
	    public void checkOut() {
	       
		   	
		   
		  for(Entry<Long, List<Integer>> checkInByTime : checkInList.entrySet()) {
			
			  
			  if(new Date().getTime() > checkInByTime.getKey()) {
				  
				  System.out.println("이용권 시간 만료 퇴실 처리");
				  for(int reservId : checkInByTime.getValue()) {
					  
					  
					  if(!seatService.seatCheckOut(reservId)) {
						  
						  System.out.println(reservId +"좌석 자동퇴실 실패");
					  }
					  
					
	
				  }
				  
				//퇴실처리, 스케줄 삭제
				
				  
				  
			  }
			  	
			  
			  
		  }
		   
		   
	    }
	   

	   
	   
	   
	   @Scheduled(cron = "0 0 23 * * *")
	    public void checkOutAll() {
	       
		   //전부 퇴실처리
		   
		   System.out.println("23시 전좌석 퇴실 처리");
		   for(Entry<Long, List<Integer>> checkInByTime : checkInList.entrySet()) {
				
	
					  for(int reservId : checkInByTime.getValue()) {
						  
				
						  if(!seatService.seatCheckOut(reservId)) {
							  
							  System.out.println(reservId +"좌석 자동퇴실 실패");
						  }
						  
						
						  //퇴실처리, 스케줄 삭제
						  
					  }
					  
					  int result = seatService.updateTimePass();
					  
					  System.out.println("기간권 "+result+"건 만료처리");
					  
				
					  
					  
				  }
				  	
				  
				  
			  
		   

		   
	    }
	   
	   

	
	
}

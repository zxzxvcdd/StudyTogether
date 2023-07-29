package com.spring.kgstudy.scheduler;

import java.util.Date;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Component
public class ReserveScheduler {

	
	public static MultiValueMap<Long,Integer> checkInList = new LinkedMultiValueMap<>();
	
 	
	
	   @Scheduled(cron = "0 * * * * * ")
	    public void checkOut() {
	       
		   	
		   
		  for(Entry<Long, List<Integer>> reservInfoList : checkInList.entrySet()) {
			
			  
			  if(new Date().getTime() > reservInfoList.getKey()) {
				  
				  for(int reservId : reservInfoList.getValue()) {
					  
					  
					
					  //퇴실처리
					  
				  }
				  
				  
			  }
			  	
			  
			  
		  }
		   
		   
	    }
	   

	   
	   
	   
	   @Scheduled(cron = "0 0 23 * * *")
	    public void checkOutALl() {
	       
		   //전부 퇴실처리
		   

		   
	    }
	   
	   

	
	
}

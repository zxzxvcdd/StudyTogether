package com.spring.kgstudy.scheduler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ReserveScheduler {

	
	public static Map<String,Object> checkInList = new HashMap<String,Object>();
	
 	
	
	   @Scheduled(cron = "0 * * * * * ")
	    public void checkOut() {
	       
		
		   
		   
	    }
	   

	   
	   
	   
	   @Scheduled(cron = "0 0 23 * * *")
	    public void checkOutALl() {
	       

		   
	    }
	   
	   

	
	
}

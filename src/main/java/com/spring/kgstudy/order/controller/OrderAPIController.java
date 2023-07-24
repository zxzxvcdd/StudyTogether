package com.spring.kgstudy.order.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/test")
@RestController
public class OrderAPIController {

	
	
	@GetMapping("test.do")
	public int test(String userId) {
		
		if(userId.equals("1")) {
			
			return 1;
			
		}else {
			return 0;
		}
		
		
	}
	
	
	
}

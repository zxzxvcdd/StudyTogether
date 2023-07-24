package com.spring.kgstudy.order.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/test")
@RestController
public class OrderAPIController {

	
	
	@GetMapping("test.do")
	public int test() {
		
		
		return 1;
		
	}
	
	
	
}

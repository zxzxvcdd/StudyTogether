package com.spring.kgstudy.seat.restcontroller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.seat.service.SeatService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/seat")
public class SeatRestController {
	
	private final SeatService service;
	
	@GetMapping("seatChecke.do")
	public String seatChoise( int seatId) {
		
		//세션에서 유저 아이디 받아옴
		String userId = "admin";
		
		
		
		
		
		
		return "seatPage";
		
	}
	
	
}

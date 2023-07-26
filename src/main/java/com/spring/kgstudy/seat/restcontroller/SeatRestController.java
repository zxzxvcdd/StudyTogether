package com.spring.kgstudy.seat.restcontroller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/seat")
public class SeatRestController {
	
	private final SeatService service;
	
	@PostMapping("seatChecke.do")
	public String seatChoise(@RequestBody SeatVO vo) {
		
		//세션에서 유저 아이디 받아옴
		String userId = "admin";
		int seatId = vo.getSeatId();
		String seatName = vo.getSeatName();
		
		System.out.println(seatId+","+seatName);
		
		service.seatChoise(seatId, userId, seatName);
		
		
		
		return "seatPage";
		
	}
	
	
}

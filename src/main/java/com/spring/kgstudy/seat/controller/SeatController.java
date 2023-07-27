package com.spring.kgstudy.seat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.seat.service.SeatService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/seat")
public class SeatController {
	
	private final SeatService service;
	
	@GetMapping("seat.do")
	public String test(Model model, int storeId) {
		
		model.addAttribute("seat", service.test(storeId));
		return "seatPage";

	}
	
	

}

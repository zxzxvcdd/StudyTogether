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
	public String getSeatView(Model model, String storeId)  {
		
		storeId="2324";
		model.addAttribute("seat", service.test(Integer.parseInt(storeId)));
		
		return "seatPage";
		
	}
	
	
	@GetMapping("seatUpdate.do")
	public String seatUpdateForm(Model model, String storeId)  {
		
		storeId="2324";
		model.addAttribute("seat", service.test(Integer.parseInt(storeId)));
		
		return "seatUpdateForm";
		
	}
	

}

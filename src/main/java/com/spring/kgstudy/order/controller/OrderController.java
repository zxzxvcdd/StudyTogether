package com.spring.kgstudy.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.kgstudy.order.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class OrderController {
	
	private final OrderService service;
	
	
	
	@GetMapping("hi.do")
	public String test(Model model) {
		
		model.addAttribute("hi",service.test());
		
		return "home";
	}
	
	

	
	
	
}

package com.spring.kgstudy.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class StoreController {

	
	private final StoreService storeService;
	
	
	@GetMapping("get.do")
	public String storeIndex() {
		
		System.out.println("hi");
		
		
		return "/store/store";
		
		
	}
	
	
	
}

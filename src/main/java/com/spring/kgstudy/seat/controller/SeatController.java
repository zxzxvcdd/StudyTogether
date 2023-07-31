package com.spring.kgstudy.seat.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.store.VO.StoreVO;
import com.spring.kgstudy.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/seat")
public class SeatController {
	
	private final SeatService service;
	private final StoreService storeService;
	
	@GetMapping("seat.do")
	public String test(Model model, String storeId)  {
		
		
		
		Search search= new Search();
		search.setAmount(999999);
		
		System.out.println(search);
		ArrayList<StoreVO> storeList = storeService.findMap(search);
		
		System.out.println(storeList.size());
		if(storeId!=null) {
			
			model.addAttribute("seat", service.test(Integer.parseInt(storeId)));
		}
		
		model.addAttribute("storeList", storeList);
		
		
		return "seatPage";
		
	}
	
	

}

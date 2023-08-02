package com.spring.kgstudy.seat.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;
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
	public String getSeatView(Model model, String storeId)  {
		
		
		Search search= new Search();
		search.setAmount(999999);
		
		System.out.println(search);
		ArrayList<StoreVO> storeList = storeService.findMap(search);
		
		System.out.println(storeList.size());
		if(storeId!=null) {
			
			ArrayList<SeatVO> seatList = service.test(Integer.parseInt(storeId));
			search.setType("store");
			search.setKeyword(storeId);
			
			StoreVO store = storeService.findOneStore(search);
			System.out.println(store.getStoreName());
			
			model.addAttribute("stName", store.getStoreName());
			
			int seatCnt = 0;
			int seatCk = 0;
			
			for(SeatVO seat : seatList) {
			
				if(seat.getSeatType().equals("N")) {
					seatCnt++;
				}else if(seat.getSeatType().equals("Y")) {
					seatCk++;
				}
			}
			System.out.println(seatCk);
			model.addAttribute("seatCnt", seatCnt);
			model.addAttribute("seatCk", seatCk);
			
			model.addAttribute("seat", seatList);
			
			model.addAttribute("totalSeat", seatList.size());
			
			
			

			
		}
		
			
		
		
		model.addAttribute("storeList", storeList);
		
		System.out.println(model.getAttribute("stName"));
		
		
		return "seatPage";
		
	}
	
	
	@GetMapping("seatUpdate.do")
	public String seatUpdateForm(Model model, String storeId, Search search)  {
		
		if(storeId==null||storeId.length()<1) return "redirect:seatPage";
		ArrayList<SeatVO> seatList = service.test(Integer.parseInt(storeId));
		
		search.setType("store");
		search.setKeyword(storeId);
			
		StoreVO store = storeService.findOneStore(search);
		System.out.println(store.getStoreName());
		
		model.addAttribute("stName", store.getStoreName());
		
		
		int seatCnt = 0;
		int seatCk = 0;
		
		for(SeatVO seat : seatList) {
			
			if(seat.getSeatType().equals("N")) {
				seatCnt++;
			}else if(seat.getSeatType().equals("Y")) {
				seatCk++;
			}
		}
	
		model.addAttribute("seatCnt", seatCnt);
		model.addAttribute("seatCk", seatCk);
		
		model.addAttribute("totalSeat", seatList.size());
		
		model.addAttribute("seat", seatList);
		
		return "seatUpdateForm";
		
	}
	

}

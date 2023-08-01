package com.spring.kgstudy.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.store.VO.StoreVO;
import com.spring.kgstudy.store.service.StoreService;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class StoreController {

	
	private final StoreService storeService;
	
	
	@GetMapping("find.do")
	public String storeIndex() {
		
	
		
		return "/store/store";
		
		
	}
	
	
	
	@GetMapping("save.do")
	public String saveMap(HttpSession session, Model model) {
		
		if(LoginUtil.isLogin(session)) {
			
			
			
			String grant= LoginUtil.getCurrentMemberAuth(session);
			
			System.out.println(grant);
			if(!grant.equals("admin")) {
				model.addAttribute("msg","관리자만 가능한 기능입니다.");
				
			}else{
				
				if(storeService.saveMap()) {
					
					model.addAttribute("msg","지도 저장완료");
					
				}
				
			};
			
		}else {
			model.addAttribute("msg","관리자만 가능한 기능입니다.");
			
		}
		
	
		
		

		
		
		
		return "/store/store";
		
		
	}
	
	
	@GetMapping("goSeat.do")
	public String goSeat(StoreVO store,Search search) {
	
		search.setType("name");
		search.setKeyword(store.getStoreName());
		store = storeService.findOneStore(search);
		
		
		return "redirect:/seat/seat.do?storeId="+store.getStoreId();
		
		
		
	}
	
	
	
}

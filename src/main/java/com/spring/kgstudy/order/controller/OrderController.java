package com.spring.kgstudy.order.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.service.MenuService;
import com.spring.kgstudy.menu.vo.MenuVO;
import com.spring.kgstudy.order.service.IamportService;
import com.spring.kgstudy.order.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/order")
public class OrderController {
	
	private final OrderService orderService;
	
	private final IamportService iamportService;
	
	
	  
	@GetMapping("hi.do")
	public String test(Model model) {
		
	
		
		return "home";
		
	}
	
	@GetMapping("/passOrder.do")
	public String orderForm(Model model) {
		
		
		Search search = new Search();

		
		search.setAmount(100);

		Map<String, Object> resMap = orderService.getMenuList(search);

		model.addAttribute("resMap",resMap);
		
		
		return "/order/orderForm";
		
	}
	
	

	

}

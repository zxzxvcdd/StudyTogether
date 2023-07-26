package com.spring.kgstudy.order.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.menu.vo.MenuVO;
import com.spring.kgstudy.order.service.OrderService;
import com.spring.kgstudy.order.vo.OrderVO;
import com.spring.kgstudy.order.vo.PassVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("/order")
@RestController
@RequiredArgsConstructor
public class OrderAPIController {

	
	OrderService orderService;
	
	@GetMapping("test.do")
	public int test(String userId) {
		
		if(userId.equals("1")) {
			
			return 1;
			
		}else {
			return 0;
		}
		
		
	}
	
	@PostMapping("complete.do")
	public String orderComplete(MenuVO menu, OrderVO order, Long paidAt, HttpSession session) {
		
		
		Date pDate = new java.util.Date(paidAt * 1000L);
		
		order.setOrderDate(pDate);

//		String userId = LoginUtil.getUserId(session);
//		order.setUserId(userId);
		
		
		String msg = orderService.orderProgress(menu, order);
		
		return msg;
		

		
	}
	
	
	@PostMapping("refund.do")
	public String orderRefund(PassVO pass) {
		
		
		
//		String userId = LoginUtil.getUserId(session);
//		order.setUserId(userId);
		String msg = orderService.orderRefund(pass);
		
		


		return msg;
		
	}
	
	
	
}

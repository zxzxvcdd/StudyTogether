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
import com.spring.kgstudy.util.LoginUtil;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("/order")
@RestController
@RequiredArgsConstructor
public class OrderAPIController {

	
	private final OrderService orderService;
	
	@PostMapping("test.do")
	public String test(String bno) {
		
		System.out.println(bno);
	
			return "안녕";
			
		
		
		
	}
	
	@PostMapping("complete.do")
	public String orderComplete(MenuVO menu, OrderVO order, Long paidAt, HttpSession session) {
		
		
	System.out.println(order.getImpUid());
		
		
		Date pDate = new java.util.Date(paidAt * 1000L);
		
		order.setOrderDate(pDate);
		
		

		String userId = LoginUtil.getCurrentMemberAccount(session);
		order.setUserId(userId);
	
		String msg = orderService.orderProgress(menu, order);
		
		return msg;
		

		
	}
	
	
	@PostMapping("refund.do")
	public String orderRefund(PassVO pass, HttpSession session) {
		
		
		
		String userId = LoginUtil.getCurrentMemberAccount(session);
		pass.setUserId(userId);
		String msg = orderService.orderRefund(pass);
		
		


		return msg;
		
	}
	
	
	
}

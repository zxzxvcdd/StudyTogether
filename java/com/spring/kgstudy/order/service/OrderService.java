package com.spring.kgstudy.order.service;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.order.dao.OrderDAO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderService {

	
	private final OrderDAO dao;
	
	
	public String test() {
		
		
	
		return dao.test();
	}
}

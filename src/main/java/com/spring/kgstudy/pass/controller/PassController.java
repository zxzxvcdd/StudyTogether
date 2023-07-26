package com.spring.kgstudy.pass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PassController {

	//이용권 구매 페이지로 이동
	@RequestMapping(value = "/passOrder.do")
	public String passOrderForm(Model model) throws Exception {
		return "/pass/orderForm";
	}

}

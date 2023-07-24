package com.spring.kgstudy.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.kgstudy.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor //final이 붙거나 @NotNull이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Controller
public class MemberController {
	
	private final MemberService service;
	
	
	@GetMapping("main.do")
	public String test(Model model) {
		
		model.addAttribute("hi", service.mainPage());
		
		return "/main/main"; //WEB-INF/views/main/main.jsp 경로
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

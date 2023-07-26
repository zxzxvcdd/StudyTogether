package com.spring.kgstudy.member.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class MemberAPIController {

	private final MemberService service;

	// 아이디 중복 체크
	 @RequestMapping(value = "/IdCheck.do", method = RequestMethod.POST)
	 public int nameCheck(@RequestParam("user_id") String user_id) {
		 
		 System.out.println("idcheck");
		 return service.idCheck(user_id); 

	 }

}


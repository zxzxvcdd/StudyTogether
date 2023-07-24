package com.spring.kgstudy.member.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.member.dto.IdCheckDTO;
import com.spring.kgstudy.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class MemberAPIController {

	private final MemberService service;

	// 아이디 중복 체크

	/*
	 * @PostMapping(value="/IdCheck.do",produces = "application/json; charset=utf8")
	 * public ResponseEntity idCheck(String user_id, ResponseEntity<Integer> res) {
	 * 
	 * 
	 * int result=service.idCheck(user_id);
	 * 
	 * 
	 * res System.out.println(result);
	 * 
	 * return result;
	 * 
	 * 
	 * }
	 */

	
	 @RequestMapping(value = "/IdCheck.do", method = RequestMethod.POST)
	 @ResponseBody 
	 public int nameCheck(@RequestParam("user_id") String user_id) {
		return service.idCheck(user_id); }


}


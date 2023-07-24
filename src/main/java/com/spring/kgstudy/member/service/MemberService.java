package com.spring.kgstudy.member.service;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.member.dao.MemberDAO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {
	
	private final MemberDAO dao;
	
	//메인 페이지로 이동
	public String mainPage() {
		return dao.mainPage();
	}
	
	
	
	
	
	
	
	
	
	
}

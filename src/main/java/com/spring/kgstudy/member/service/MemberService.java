package com.spring.kgstudy.member.service;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.member.dao.MemberDAO;
import com.spring.kgstudy.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {
	
	private final MemberDAO dao;
	
	//메인 페이지로 이동
	public String mainPage() {
		return dao.mainPage();
	}

	//회원가입
	public void insertUser(MemberVO memberVO) {
		dao.insertUser(memberVO);
	}

	public int idCheck(String user_id) {
		int result = dao.idCheck(user_id);
		
		System.out.println(result);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}

package com.spring.kgstudy.member.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.member.dao.MemberDAO;
import com.spring.kgstudy.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {
	
	private final MemberDAO dao;
	
	@Resource(name = "bcryptPasswordEncoder")   // 암호화를 위한 bcrypt 객체 의존성 주입 (DI)
	private BCryptPasswordEncoder bcrypt;
	
	
	
	//메인 페이지로 이동
	public String mainPage() {
		return dao.mainPage();
	}

	//회원가입
	public void insertUser(MemberVO memberVO) {
		
		String encPw = bcrypt.encode(memberVO.getUser_pw()); //비밀번호 암호화
		memberVO.setUser_pw(encPw); //암호화한 pw 세팅
		
		dao.insertUser(memberVO);
	}

	public int idCheck(String user_id) {
		
		return dao.idCheck(user_id);
	}
	
	
	
	
	
	
	
	
	
	
}

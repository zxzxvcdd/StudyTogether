package com.spring.kgstudy.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	public String mainPage(); //메인 페이지로 이동 테스트

	public void insertUser(MemberVO memberVO); //회원가입
	
	public int idCheck(String user_id);
	
}

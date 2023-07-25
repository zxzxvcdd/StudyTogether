package com.spring.kgstudy.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	public String mainPage(); //메인 페이지로 이동 테스트

	public boolean insertUser(MemberVO memberVO); //회원가입
	
	public int idCheck(String user_id); //아이디 중복 체크
	
	public MemberVO findOneMember(String user_id); //로그인
	
	public MemberVO findId(MemberVO memberVO); //아이디 찾기

	public MemberVO findPw(MemberVO memberVO); //비밀번호 찾기
	
	public boolean updatePw(MemberVO memberVO); //비밀번호 재설정
	
}

package com.spring.kgstudy.mypage.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.member.vo.MemberVO;

@Mapper
public interface MypageDAO {
	
	public MemberVO findOneMember(String user_id); //마이페이지 비밀번호 체크
	
	public boolean memberUpdate(MemberVO memberVO); //마이페이지 회원정보 수정
	
	
	
	
	
	
}

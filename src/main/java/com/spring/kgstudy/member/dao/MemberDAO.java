package com.spring.kgstudy.member.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	
	//메인 페이지로 이동 테스트
	public String mainPage();
	
}

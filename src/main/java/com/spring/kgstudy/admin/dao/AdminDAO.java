package com.spring.kgstudy.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberDTO;
import com.spring.kgstudy.member.vo.MemberVO;

@Mapper
public interface AdminDAO {

	
	

	public boolean memberUpdate(MemberDTO memberDTO); 
	
	public List<MemberDTO> findAllMember(Search search);
	
	public int findMemberCnt(Search search); 

	public boolean deleteMember(String userId);

	public MemberDTO getOneMember(String userId);

	public boolean updateStore(MemberDTO memberDTO);

	
	
	
}

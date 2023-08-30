package com.spring.kgstudy.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.admin.dao.AdminDAO;
import com.spring.kgstudy.common.paging.Page;
import com.spring.kgstudy.common.paging.PageMaker;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberDTO;

import com.spring.kgstudy.store.dao.StoreDAO;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {

	
	
	private final AdminDAO adminDao;
	private final StoreDAO storeDao;
	
	
	public Map<String, Object> getAllMember(Search search){
		
	
		System.out.println(search);
		System.out.println(search.getAmount());
		System.out.println("page"+search.getPageNum());
		
		
		List<MemberDTO> memberList = adminDao.findAllMember(search);
		int tc = adminDao.findMemberCnt(search);
		
		System.out.println(memberList);
		
		PageMaker paging = getPage(search, tc);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put("memberList", memberList);
		
		resMap.put("paging",paging);
		
		
		return resMap;
		
		
		
	}
	
	
	public int deleteMember(String[] userList) {
		
		int result=0;
		for(String userId : userList) {
			
			
			if(adminDao.deleteMember(userId)) {
				
				result++;
			}
				
			
			
		}
		return result;
		
		
	}
	
	
	public MemberDTO getOneMember(String userId) {

		
		return adminDao.getOneMember(userId);
		
		
		

	}
	
	
	public boolean modifyMember(MemberDTO member) {
		
		
		boolean result = false;
		
		result = adminDao.memberUpdate(member);
		

		if(member.getUserGrant().equals("manager")&&member.getStoreId()!=0) {
			
			result = adminDao.updateStore(member);
			
		}
		
		
		
		return result;
		
		
	}
	
	public PageMaker getPage(Search search, int tc) {
		
		
		
		PageMaker pm = new PageMaker(
				new Page(search.getPageNum(), search.getAmount())
				, tc);
		
		
		return pm;
		
	}


	
	


	
	
	
	
	
}

package com.spring.kgstudy.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.paging.Page;
import com.spring.kgstudy.common.paging.PageMaker;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.dao.MenuDAO;
import com.spring.kgstudy.menu.vo.MenuVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MenuService {

	
	private final MenuDAO dao;
	
	
	public boolean insertMenu(MenuVO vo) {
		
		boolean flag = false;
		
		
		flag = dao.insertMenu(vo);
		

		return flag;
		
		
	}
	public boolean updateMenu(MenuVO vo) {
		
		
		boolean flag = false;
		
		
		flag = dao.updateMenu(vo);
		
		
		return flag;
		
	}
	public boolean deleteMenu(MenuVO vo) {
		
		boolean flag = false;
		
		
		flag = dao.deleteMenu(vo.getMenuId());
		
		
		return flag;
		
		
	}
	
	
	public Map<String,Object> findAllMenu(Search search){
		
	
		ArrayList<MenuVO> menuList = null;
	
		
    
		
		menuList = dao.findAllMenu(search);
		
		
		ArrayList<MenuVO> timePass = new ArrayList<MenuVO>();
		ArrayList<MenuVO> dayPass = new ArrayList<MenuVO>();
	
		Map<String,Object> resMap = new HashMap<String, Object>();
		
		for(MenuVO menu : menuList) {
			
			if(menu.getPassType()==PassType.TIME) {
				timePass.add(menu);
				
			}else {
				dayPass.add(menu);
			}
		}
		
		
		resMap.put("timePassList", timePass);
		resMap.put("dayPassList", dayPass);
		
		resMap.put("pm",getPage(search));
		
		
		
		
		return resMap;
		
		
		
		
		
	}
	
	public MenuVO findOneMenu(Search search) {
		
		
		MenuVO vo = null;
		
		
		vo = dao.findOneMenu(search);
		
		
		return vo;
		
		
		
		
		
	}
	
	
	
	public PageMaker getPage(Search search) {
		
		int tc = dao.searchMenuCnt(search);
		
		PageMaker pm = new PageMaker(
				new Page(search.getPageNum(), search.getAmount())
				, tc);
		
		
		return pm;
		
	}
	
	
	
	
	
}


package com.spring.kgstudy.menu.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.vo.MenuVO;

@Mapper
public interface MenuDAO {

	
	
	
	public boolean insertMenu(MenuVO vo);
	public boolean updateMenu(MenuVO vo);
	public boolean deleteMenu(int menuId);
	
	
	public ArrayList<MenuVO> findAllMenu(Search search);
	
	public int searchMenuCnt(Search search);
	
	public MenuVO findOneMenu(Search search);
	
	
	
	
	
	
	
}

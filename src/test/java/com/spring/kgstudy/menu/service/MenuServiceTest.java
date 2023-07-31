package com.spring.kgstudy.menu.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.vo.MenuVO;



@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class MenuServiceTest {

	
	
	/*
	 * 
	 * Calendar cal=Calendar.getInstance();
	 * 
	 * cal.setTime(now); System.out.println(now); System.out.println(cal.getTime());
	 * cal.add(Calendar.SECOND,60*10); System.out.println(cal.getTime());
	 * 
	 * 
	 * int def = (int) (cal.getTime().getTime() - now.getTime());
	 * 
	 * cal.add(Calendar.SECOND, -def/1000);
	 * 
	 * System.out.println(cal.getTime());
	 */
	
	@Test
	public void qwe() {
		
		
	
		
       SimpleDateFormat form = new SimpleDateFormat("yy/mm/dd");

      
        
        Calendar now = Calendar.getInstance();
		
		
		System.out.println(form.format(now.getTime()));
		now.add(Calendar.DATE, -7);
		System.out.println(form.format(now.getTime()));
		

	}

	
	
	@Autowired
	MenuService menuService;

	
	@Test
	public void test() {
		
		Calendar cal=Calendar.getInstance();
		Date now = new Date();
		LocalDate today = LocalDate.now();

		
		
		cal.setTime(now);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		System.out.println(now);
		System.out.println(cal.getTime());
		
		
		System.out.println(today);
		
		
		Long mils = now.getTime();
		
		System.out.println(new Date(mils));
		
		System.out.println(now.before(cal.getTime()));

		
	}
	
	@Test
	void insertTest() {

		
		for(int i=1;i<11;i++) {
		MenuVO vo = new MenuVO();
		
		
		vo.setMenuName(i+"시간권");
		vo.setPassPrice(5000*i);
		vo.setPassTime(60*60*i);
		vo.setPassType(PassType.TIME);
	
		menuService.insertMenu(vo);

		}
		
		
		for(int i=1;i<11;i++) {
		MenuVO vo = new MenuVO();
		
		
		vo.setMenuName(i+"일권");
		vo.setPassPrice(5000*18*i);
		vo.setPassTime(60*60*24*i);
		vo.setPassType(PassType.SEASON);
	
		menuService.insertMenu(vo);

		}
		

	}
	
	
	/*
	 * @Test void deleteTest() {
	 * 
	 * for(int i=1;i<12;i++) { MenuVO vo = new MenuVO(); vo.setMenuId(i);
	 * 
	 * menuService.deleteMenu(vo);
	 * 
	 * }
	 * 
	 * }
	 */


	
	@Test
	void updateTest() {

		
		
		MenuVO vo = new MenuVO();
		
		vo.setMenuId(12);
		vo.setMenuName("1시간권");
		vo.setPassPrice(6000);
		vo.setPassTime(60*60);
		vo.setPassType(PassType.TIME);
	
		menuService.updateMenu(vo);

		
		

		

	}
	
	
	@Test
	void findAllTest() {

		

		Search search = new Search();		
		ArrayList<MenuVO> menuList = null;
		
		
		Map<String,Object> resMap = menuService.findAllMenu(search);

		menuList = (ArrayList<MenuVO>) resMap.get("menuList");
		
		
		for(MenuVO menu : menuList) {
			
			System.out.println(menu);
		}
		
		
		

		

	}
	
	
	@Test
	void findOneTest() {

		

		Search search = new Search();		
		ArrayList<MenuVO> menuList = null;

		int menuId= 13;
		
		search.setType("menu");
		search.setKeyword(""+menuId);
		
		MenuVO menu = menuService.findOneMenu(search);

		

	    System.out.println(menu);
		
		
		
		

		

	}
	

}

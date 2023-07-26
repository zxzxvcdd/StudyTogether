package com.spring.kgstudy.menu.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.service.MenuService;
import com.spring.kgstudy.menu.vo.MenuVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/menu")
public class MenuController {

	
	private final MenuService menuService;
	
	
	@GetMapping("")
	public String getMenuList(Model model, Search search) {
		
		Map<String, Object> resMap = menuService.findAllMenu(search);

		model.addAttribute("resMap",resMap);
		
		return "/menu/menuList";
		
	}
	
	
	@GetMapping("insert.do")
	public String menuInsertForm(HttpServletRequest request) {
		
		
        String referer = request.getHeader("Referer");

        request.getSession().setAttribute("redirectURI", referer);


		return "/menu/menuInsertForm";
		
	}
	

	
	@PostMapping("insert.do")
	public String insertMenu(Model model,MenuVO menu, HttpServletRequest request) {
		
		boolean flag = menuService.insertMenu(menu);
		

		String redirectURI = "";
		
		
		
		if(flag) {

			model.addAttribute("msg", "메뉴가 추가되었습니다.");
			
			redirectURI = (String) request.getSession().getAttribute("redirectURI");
			request.getSession().removeAttribute(redirectURI);
			
		}else {
			model.addAttribute("msg", "중복 된 메뉴입니다.");
			redirectURI = request.getHeader("Referer");
			
		}
		

		return "redirect:"+redirectURI;
		
	}

	
	@GetMapping("update.do")
	public String menuUpdateForm(Model model,Search search, MenuVO menu, HttpServletRequest request) {
		

		
		
		search.setType("menu");
		search.setKeyword(""+menu.getMenuId());
		
        String referer = request.getHeader("Referer");

        request.getSession().setAttribute("redirectURI", referer);

		
		menu= menuService.findOneMenu(search);
		
		model.addAttribute("menu",menu);

		return "/menu/menuUpdateForm";
		
	}
	
	
	@PutMapping("update.do")
	public String updateMenu(Model model,MenuVO menu, HttpServletRequest request) {
		
		boolean flag = menuService.updateMenu(menu);
		String redirectURI = "";

		if(flag) {

			model.addAttribute("msg", "메뉴가 수정되었습니다.");
			
			redirectURI = (String) request.getSession().getAttribute("redirectURI");
			request.getSession().removeAttribute(redirectURI);
			
			
		}else {
			model.addAttribute("msg", "중복 된 메뉴입니다.");
			redirectURI = request.getHeader("Referer");
		}
		

		return "redirect:"+redirectURI;
		
	}
	
	

	
	@DeleteMapping("delete.do")
	public String deleteMenu(Model model,MenuVO menu, HttpServletRequest request) {
		
		boolean flag = menuService.deleteMenu(menu);
		
		
		String redirectURI = request.getHeader("Referer");

		if(flag) {

			model.addAttribute("msg", "메뉴가 삭제되었습니다.");
			
			
		}else {
			model.addAttribute("msg", "이미 삭제 된 메뉴입니다.");
			
		}
		

		return "redirect:"+redirectURI;
		
	}


	
	
	
}

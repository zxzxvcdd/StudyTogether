package com.spring.kgstudy.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.kgstudy.admin.service.AdminService;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberDTO;
import com.spring.kgstudy.menu.service.MenuService;
import com.spring.kgstudy.menu.vo.MenuVO;
import com.spring.kgstudy.store.VO.StoreVO;
import com.spring.kgstudy.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/admin")
@Controller
@RequiredArgsConstructor
public class AdminController {

		
	private final AdminService service;
	private final StoreService storeService;
	private final MenuService menuService;
	
	@GetMapping("getMemberList.do")
	public String getMemberList(Model model, Search search) {
		
		
			
		
		Map<String, Object> resMap = service.getAllMember(search);
		
		
		resMap.put("search", search);
		
		
		model.addAttribute("resMap",resMap);
		
		
		
		
		return "/admin/memberManager";
		
	}
	
	@GetMapping("deleteMember.do")
	public String deleteMember(Model model, String[] checkId, HttpServletRequest request) {
		
		String redirectURI = (String)request.getHeader("Referer");
		
		String msg="";
		
		
		int result = service.deleteMember(checkId);
		
		
		msg = result+"건 삭제 완료";
		
		
		
		model.addAttribute("msg", msg);
		
		return "redirect:"+redirectURI;
		
		
	}

	@GetMapping("modifyMember.do")
	public String getModifyMemberForm(Model model, String userId, HttpServletRequest request,Search search) {
		
		String redirectURI = (String)request.getHeader("Referer");
		
		request.getSession().setAttribute("redirectURI", redirectURI);

		
		MemberDTO member = service.getOneMember(userId);
		
		
		
		

		ArrayList<StoreVO> storeList = storeService.findMap(search);

		System.out.println(member);
		
		model.addAttribute("storeList",storeList);
		model.addAttribute("member",member);
		
		
		
		return "/admin/memberModify";
		
		
	}
	
	
	@PostMapping("modifyMember.do")
	public String modifyMember(RedirectAttributes ra, String userId,  HttpServletRequest request,MemberDTO member) {
		
	
		String redirectURI="";
		
		
		String msg="";
	
		if(service.modifyMember(member)) {
			
			msg="수정 성공";
			redirectURI = (String) request.getSession().getAttribute("redirectURI");
			request.getSession().removeAttribute(redirectURI);
		}else {
			msg="수정 실패";
			redirectURI=(String)request.getHeader("Referer");
		}
		


		
		ra.addFlashAttribute("msg",msg);

		
		
		
		return "redirect:"+redirectURI;

	}
	
	@GetMapping("getMenuList.do")
	public String getMenuList(Model model) {
		
		
		
		Search search = new Search();

		
		search.setAmount(100);

		Map<String, Object> resMap = menuService.findAllMenu(search);
		model.addAttribute("resMap",resMap);
		

		return "/admin/menuManager";
	}
	
	
	@GetMapping("addMenu.do")
	public String addMenu(Model model, MenuVO menu) {
		
		
		String msg="메뉴 추가 실패";
		if(menuService.insertMenu(menu)) {
			
			msg="메뉴 추가 완료";
		}
		
		
		model.addAttribute("msg",msg);
		

		return "/admin/menuManager";
	}

	@PostMapping("deleteMenu.do")
	public String deleteMenu(Model model, List<Integer> menuId) {
		
		
		String msg =  menuService.deleteMenu(menuId) + "건 삭제 완료";
			
		
		
		model.addAttribute("msg",msg);
		

		return "/admin/menuManager";
	}

	@GetMapping("updateMneu.do")
	public String updateMenu(Model model, MenuVO menu) {
		
		
		
		
		
		String msg="메뉴 수정 실패";
		if(menuService.updateMenu(menu)) {
			
			msg="메뉴 수정 완료";
		}
		
		
		model.addAttribute("msg",msg);
		

		return "/admin/menuManager";
	}
	
}

package com.spring.kgstudy.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.REXPMismatchException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.kgstudy.admin.service.AdminService;
import com.spring.kgstudy.admin.service.RService;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberDTO;
import com.spring.kgstudy.menu.service.MenuService;
import com.spring.kgstudy.menu.vo.MenuVO;
import com.spring.kgstudy.order.service.OrderService;
import com.spring.kgstudy.order.vo.OrderVO;
import com.spring.kgstudy.store.service.StoreService;
import com.spring.kgstudy.store.vo.StoreVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("/admin")
@Controller
@RequiredArgsConstructor
public class AdminController {

	private final AdminService service;
	private final StoreService storeService;
	private final MenuService menuService;
	private final OrderService orderService;
	private final RService rService;

	@GetMapping("getMemberList.do")
	public String getMemberList(Model model, Search search) {

		Map<String, Object> resMap = service.getAllMember(search);

		resMap.put("search", search);

		model.addAttribute("resMap", resMap);

		return "/admin/memberManager";

	}

	@GetMapping("deleteMember.do")
	public String deleteMember(Model model, String[] checkId, HttpServletRequest request) {

		String redirectURI = (String) request.getHeader("Referer");

		String msg = "";

		int result = service.deleteMember(checkId);

		msg = result + "건 삭제 완료";

		model.addAttribute("msg", msg);

		return "redirect:" + redirectURI;

	}

	@GetMapping("modifyMember.do")
	public String getModifyMemberForm(Model model, String userId, HttpServletRequest request, Search search) {

		String redirectURI = (String) request.getHeader("Referer");

		request.getSession().setAttribute("redirectURI", redirectURI);

		MemberDTO member = service.getOneMember(userId);

		ArrayList<StoreVO> storeList = storeService.findMap(search);

		System.out.println(member);

		model.addAttribute("storeList", storeList);
		model.addAttribute("member", member);

		return "/admin/memberModify";

	}

	@PostMapping("modifyMember.do")
	public String modifyMember(RedirectAttributes ra,  HttpServletRequest request,MemberDTO member) {
		
	
		String redirectURI="";
		
		
		String msg="";
	
		if(service.modifyMember(member)) {
			
			msg="수정 성공";
			redirectURI = (String) request.getSession().getAttribute("redirectURI");
			request.getSession().removeAttribute(redirectURI);
		} else {
			msg = "수정 실패";
			redirectURI = (String) request.getHeader("Referer");
		}

		ra.addFlashAttribute("msg", msg);

		return "redirect:" + redirectURI;

	}

	@GetMapping("getMenuList.do")
	public String getMenuList(Model model) {

		Search search = new Search();

		search.setAmount(100);

		Map<String, Object> resMap = menuService.findAllMenu(search);
		model.addAttribute("resMap", resMap);

		return "/admin/menuManager";
	}

	@GetMapping("addMenu.do")
	public String addMenu(Model model, MenuVO menu) {

		System.out.println(menu);
		String msg = "메뉴 추가 실패";
		if (menuService.insertMenu(menu)) {

			msg = "메뉴 추가 완료";
		}

		model.addAttribute("msg", msg);

		return "redirect:/admin/getMenuList.do";
	}

	@PostMapping("deleteMenu.do")
	public String deleteMenu(Model model, int[] menuId) {

		String msg = menuService.deleteMenu(menuId) + "건 삭제 완료";

		model.addAttribute("msg", msg);

		return "redirect:/admin/getMenuList.do";
	}

	@GetMapping("updateMenu.do")
	public String updateMenu(Model model, MenuVO menu) {

		String msg = "메뉴 수정 실패";
		if (menuService.updateMenu(menu)) {

			msg = "메뉴 수정 완료";
		}

		model.addAttribute("msg", msg);

		return "redirect:/admin/getMenuList.do";
	}

	@GetMapping("orderList.do")
	public String getOrderList(Model model, Search search, HttpServletRequest req) {

		req.getParameterNames().asIterator().forEachRemaining(key -> System.out.println(key));
		
		System.out.println(search);
		Map<String, Object> resMap = orderService.getOrderList(search);

		resMap.put("search", search);

		model.addAttribute("resMap", resMap);

		return "/admin/orderManager";
	}

	@PostMapping("orderRefund.do")
	public String getOrderList(int[] orderId, RedirectAttributes ra, HttpServletRequest request) {

		System.out.println(orderId);

		OrderVO order = new OrderVO();
		Map<String, Object> resMap = new HashMap<String, Object>();
		int suc = 0;
		int fail = 0;
		int updateFail = 0;
		List<Integer> failList = new ArrayList<Integer>();
		for (int i : orderId) {

			order.setOrderId(i);

			int flag = orderService.orderRefundComplete(order);

			if (flag == 1) {

				suc++;

			} else if (flag == 0) {
				fail++;

			} else if (flag == 2) {
				updateFail++;
				failList.add(i);

			}

		}

		String msg = "환불 성공 : " + suc;

		if (fail > 0) {
			msg += "\n환불 실패 : " + fail;

		}
		if (updateFail > 0) {
			msg += "\n환불완료, 상태변경 오류 : " + updateFail;
			resMap.put("failList", failList);
		}

		resMap.put("msg", msg);

		String redirectURI = (String) request.getHeader("Referer");

		ra.addFlashAttribute("resMap", resMap);

		return "redirect:" + redirectURI;
	}
	
	// 이용 통계 분석 =======================================================
	
	//월별 매출 차트
	@GetMapping("MaeGraphPage.do")
	public String MaeGraphPage() {
		return "/admin/adminMaeGraph";
	}

	@PostMapping("makeMaeGraph.do")
	public String makeMaeGraph(@RequestParam("year") String year, Model model) throws REXPMismatchException {

		String fileName = rService.MakeMaeGraph(year);
		model.addAttribute("imgName", fileName);
		model.addAttribute("year", year);
		
		System.out.println("MaeGraph name : " + fileName);

		return "/admin/adminMaeGraph";
	}

	
	//나이대별 인원수 차트
	@GetMapping("AgeGraphPage.do")
	public String AgeGraphPage(Model model) throws REXPMismatchException {
		
		String fileName = rService.ageGraph();
		model.addAttribute("imgName", fileName);
		System.out.println("AgeGraph name : " + fileName);
		
		return "/admin/adminAgeGraph";
	}


}

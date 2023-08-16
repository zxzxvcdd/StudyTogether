package com.spring.kgstudy.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.order.OrderState;
import com.spring.kgstudy.common.paging.Page;
import com.spring.kgstudy.common.paging.PageMaker;
import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.menu.service.MenuService;
import com.spring.kgstudy.menu.vo.MenuVO;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.OrderVO;
import com.spring.kgstudy.order.vo.PassVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderService {

	
	private final OrderDAO dao;
	private final IamportService iamportService;
	private final MenuService menuService;
	
	public Map<String,Object> getMenuList(Search search){
		
		
		
		return menuService.findAllMenu(search);
		
		
	}
	
	
	public String orderProgress(MenuVO menu, OrderVO order) {
		

		String result = "order-complete-fail";
		
		
		String impUid = order.getImpUid();
		System.out.println(impUid);
		
		int amount = 0; 
		  
		  try { 
			  
	 
		  String accessToken = iamportService.getAccessToken(); 
		  
	
		  amount =	iamportService.getPaymentsInfo(impUid, accessToken);
		  
		  
		  
		  } catch (Exception e) { // TODO Auto-generated catch block
		  e.printStackTrace(); }
		  

		  Search search = new Search();
		  
		  search.setType("menu");
		  search.setKeyword(""+menu.getMenuId());
		  menu = menuService.findOneMenu(search);
		  

		
		String userId = order.getUserId();
		
		int paidAmount = menu.getPassPrice();

		
		if (paidAmount == amount) {
			System.out.println("결제금액일치");

			order.setOrderName(menu.getMenuName());
			order.setOrderState(OrderState.PAID);
			order.setOrderPrice(paidAmount);
		
			
			
			if (dao.insertOrder(order)==1) {
				System.out.println("order 생성");
				
				
				
				int orderId= order.getOrderId();
				
				
				PassType passType = menu.getPassType();
				PassVO pass =new PassVO();
				
				pass.setOrderId(orderId);
				pass.setPassPrice(paidAmount);
				pass.setPassName(menu.getMenuName());
				pass.setUserId(order.getUserId());
				pass.setPassState(PassState.DEACTIVE);
				pass.setPassType(passType);
				
				pass.setPassTime(menu.getPassTime());
	
				pass.setMenuId(menu.getMenuId());
				System.out.println(pass);
				
				if(dao.insertPass(pass)) {
					System.out.println("pass생성");
					result="결제 성공";
				}else {
					
					result="이용권 생성 실패";
					
				}
				
				
				
				
				
				
			}

		}else {
			result="결제정보 불일치";
		}

		System.out.println(result);
		
		return result;
			
	}

	public String orderRefund(OrderVO order) {
		
		Search search = new Search();

		search.setType("order");
		search.setKeyword(""+order.getOrderId());
		
		System.out.println(order);
		PassVO pass = dao.findOnePass(search);
		
		System.out.println(pass);
		if(pass.getPassState()!=PassState.DEACTIVE) {
			
		return "사용하지 않은 이용권만 환불이 가능합니다.\n 관리자에게 문의 해주세요";	
		
		}
		
		search.setType("order");
		search.setKeyword(""+order.getOrderId());
		
		order = dao.findOneOrder(search);
		
		if(order.getOrderState()!=OrderState.PAID) return "결제완료 상태의 주문만 환불 가능합니다.";
		
		
	
			
			
			
		order.setOrderState(OrderState.PENDING_REFUND);
		dao.updateOrder(order);
		
		return "환불 승인 대기중";
		

		
	}


	public int orderRefundComplete(OrderVO order) {
		
		
		String accessToken="";
		try {
			accessToken = iamportService.getAccessToken();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} 
		
		Search search = new Search();
		search.setType("order");
		search.setKeyword(""+order.getOrderId());
		
		order = dao.findOneOrder(search);
		
		
		int impResult = iamportService.refundOrder(order, accessToken);
		
		if(impResult!=0) return 0;
		
		order.setOrderState(OrderState.REFUNDED);
		if(dao.updateOrder(order)) 		return 1;
;
		return 2;
		
		
				
		
		}

	public Map<String,Object> getOrderList(Search search){
		
		
		List<OrderVO> orderList = dao.findOrder(search);
		
		int cnt = dao.findOrderCnt(search);
		
		PageMaker page = new PageMaker(new Page(search.getPageNum(),search.getAmount()), cnt);
		
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put("orderList", orderList);
		resMap.put("paging",page);
		
		return resMap;
		
		
		
	}

}

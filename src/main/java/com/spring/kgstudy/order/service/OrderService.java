package com.spring.kgstudy.order.service;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.order.OrderState;
import com.spring.kgstudy.common.pass.PassState;
import com.spring.kgstudy.common.pass.PassType;
import com.spring.kgstudy.common.search.Search;
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
	
	public String orderProgress(MenuVO menu, OrderVO order) {
		

		String result = "order-complete-fail";
		
		String impUid = order.getImpUid();
		
		
		int amount = 0; 
		  
		  try { 
			  
		  String accessToken = iamportService.getAccessToken(); 
		  
		  amount =	iamportService.getPaymentsInfo(impUid, accessToken);
		  
		  
		  
		  } catch (Exception e) { // TODO Auto-generated catch block
		  e.printStackTrace(); }
		  


		
		String userId = order.getUserId();
		int paidAmount = menu.getPassPrice();

		
		
		if (paidAmount == amount) {

			order.setOrderName(menu.getMenuName());
			order.setOrderState(OrderState.PAID);
			order.setOrderPrice(paidAmount);
		
			if (dao.insertOrder(order)) {
				
				int orderId = dao.getOrderSeq();
				PassType passType = menu.getPassType();
				PassVO pass =new PassVO();
				
				pass.setOrderId(orderId);
				pass.setPassPrice(paidAmount);
				pass.setPassName(menu.getMenuName());
				pass.setUserId(order.getUserId());
				pass.setPassState(PassState.DEACTIVE);
				pass.setPassType(passType);
				
				pass.setPassTime(menu.getPassTime());
	
				
				
				if(dao.insertPass(pass)) {
					
					result="결제 성공";
				}else {
					
					result="이용권 생성 실패";
					
				}
				
				
				
				
				
				
			}

		}else {
			result="결제정보 불일치";
		}

		
		return result;
			
	}

	public String orderRefund(PassVO pass) {
		
		Search search = new Search();

		search.setType("pass");
		search.setKeyword(""+pass.getPassId());
		
		pass = dao.findOnePass(search);
		
		if(pass.getPassState()!=PassState.DEACTIVE) {
			
		return "사용하지 않은 이용권만 환불이 가능합니다.\n 관리자에게 문의 해주세요";	
		
		}
		
		
		String accessToken="";
		try {
			accessToken = iamportService.getAccessToken();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		search.setType("order");
		search.setKeyword(""+pass.getOrderId());
		
		OrderVO order = dao.findOneOrder(search);
		
		int impResult = iamportService.refundOrder(order, accessToken);
		
		if(impResult==0) {
			
			order.setOrderState(OrderState.REFUNDED);
			dao.updateOrder(order);
			
			return "환불 완료";
			
		}
		
		
		return "환불 완료 삭제 실패";
		
	}
	

	

}

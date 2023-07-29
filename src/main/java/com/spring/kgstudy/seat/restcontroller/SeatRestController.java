package com.spring.kgstudy.seat.restcontroller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/seat")
public class SeatRestController {


	private final SeatService service;

	
	@PostMapping("getPassList.do")
	public Map<String, Object> getPassList(HttpSession session,Search search){
		
		Map<String, Object> resMap = null;
		
		if(LoginUtil.isLogin(session)) {
			
		
			
	
		
		String userId = LoginUtil.getCurrentMemberAccount(session);
		
		
		search.setType("user");
		search.setKeyword(userId);
		search.setAmount(100);
		
		
		
		
		resMap = service.findPassList(search);
		
		
		
		}else {
		
		
			resMap = new HashMap<String, Object>();
			
					resMap.put("msg", "no-login");
		
		
		}
		
		
		return resMap;
		
		
		
		
	}

	
	

	@PostMapping("seatChecke.do")
	public String seatChoise(SeatVO vo, PassVO pass, HttpSession session) {

		
		
		
		if(!LoginUtil.isLogin(session)) {
			return "no-login";
			
		}

		Date now = new Date();
		
		if(session.getAttribute("checkIn")!=null) {
			

			Long checkIn = (Long) session.getAttribute("checkIn");
			
			if (checkIn < now.getTime())return "checkedIN";
			else session.removeAttribute("checkIn");
			
		}
		
		String userId = LoginUtil.getCurrentMemberAccount(session);

		
		
		vo.setUserId(userId);

		
		
		boolean result = service.seatChoise(vo,pass);
		
		
		if(result) session.setAttribute("checkIn",now.getTime()+pass.getPassTime()*1000);

		return result ? "success" : "fail";

	}

	@PostMapping("seatCheckOut.do")
	public String seatCheckOut(SeatVO vo,HttpSession session) {

		
		if(!LoginUtil.isLogin(session)) {
			return "no-login";
			
		}

		String userId = LoginUtil.getCurrentMemberAccount(session);
		
		
		if(!userId.equals(vo.getUserId())) return "fail";

	
		
		
		boolean result = service.seatCheckOut(vo.getReservationId());

		if(result) {
			
			session.removeAttribute("checkIn");
			
		}
	
		
		

		return result ? "success" : "fail";
	}

}

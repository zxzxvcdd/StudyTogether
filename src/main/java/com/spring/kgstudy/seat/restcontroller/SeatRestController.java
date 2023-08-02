package com.spring.kgstudy.seat.restcontroller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.ReservationVO;
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

	
	

	@PostMapping("seatCheck.do")
	public String seatChoise(SeatVO vo, PassVO pass, HttpSession session) {

		

		
		if(!LoginUtil.isLogin(session)) {
			return "no-login";
			
		}

		Date now = new Date();
		
		if(session.getAttribute("checkIn")!=null) {
			

			Long checkIn = (Long) session.getAttribute("checkIn");
			
			System.out.println("만료"+checkIn);
			System.out.println("현재"+now.getTime());
			System.out.println(checkIn < now.getTime());
			if (checkIn < now.getTime())return "checkedIN";
			else session.removeAttribute("checkIn");
			
		}
		
		String userId = LoginUtil.getCurrentMemberAccount(session);

		
		
		vo.setUserId(userId);

		
		
		ReservationVO reserv = service.seatChoise(vo,pass);
		
		
		if(reserv!=null) {
			session.setAttribute("checkIn",now.getTime()+pass.getPassTime()*1000);
			session.setAttribute("reservId", reserv.getReservationId());
		
			return "success";
		}

		return "fail";

	}

	@PostMapping("seatCheckOut.do")
	public String seatCheckOut(ReservationVO reserv,HttpSession session) {

	
		
		if(!LoginUtil.isLogin(session)) {
			return "no-login";
			
		}

		String userId = LoginUtil.getCurrentMemberAccount(session);
		

		
		System.out.println(reserv);
		boolean result = service.seatCheckOut(reserv.getReservationId());

		if(result) {
			
			session.removeAttribute("checkIn");
			
		}
	
		
		

		return result ? "success" : "fail";
	}
	
	
	
	
	@PostMapping("updateSeat.do")
	public Map<String, Object> updateSeatt(HttpSession session, @RequestBody List<SeatVO> seatList){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
//		if(!LoginUtil.isLogin(session)||LoginUtil.getCurrentMemberAuth(session).equals("user")) {
//			resMap.put("msg", "권한없음");
//			return resMap;
//		}
//			
		
	
		System.out.println("list : "+seatList);


		int flag =service.insertSeat(seatList);
		
		String msg = "";
		if(flag==0) {
			msg="수정성공";
		}else {
			msg="수정실패";
			
		}
		
		
		resMap.put("msg",msg);
		
		
		
		System.out.println(resMap.get("msg"));
		return resMap;
		

		
	}
	
	
	@GetMapping("deleteSeat.do")
	public Map<String, Object> deleteSeat(HttpSession session,Search search, int seatId){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
//		if(!LoginUtil.isLogin(session)||LoginUtil.getCurrentMemberAuth(session).equals("user")) {
//			resMap.put("msg", "권한없음");
//			return resMap;
//		}
//			
		
		String msg = "";
		int flag =0;
		if(service.deleteSeat(seatId)) {
			
			flag=1;
			msg="삭제 성공";
		}else {
			msg="삭제 실패";
		
		}
		
		
		
		
		
		resMap.put("msg", msg);
		resMap.put("flag", flag);
		
		
		
		return resMap;
		

		
	}
	
	
	
	
	

}

package com.spring.kgstudy.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberVO;
import com.spring.kgstudy.mypage.dao.MypageDAO;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.seat.dao.SeatDAO;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.ReservationVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MypageService {

	private final MypageDAO dao;
	private final SeatDAO seatDao;
	private final SeatService seatService;
	
	
	private final PasswordEncoder passwordEncoder;
	
	
	//마이페이지 비밀번호 체크
	public boolean mypagePwCheck(MemberVO memberVO) {
		
		String rawPw = memberVO.getUser_pw();

		memberVO = dao.findOneMember(memberVO.getUser_id()); // db에서 login한 유저의 아이디를 가져와서
		
		String encodedPw = memberVO.getUser_pw(); // login한 유저의 pw를 MemberVO pw안에 넣는다.
		
		//System.out.println("mypagePwCheck vo : " + memberVO);
		
		boolean pwdSuccess = passwordEncoder.matches(rawPw, encodedPw);
		
		//System.out.println("평문 pw:" + rawPw);
		//System.out.println("암호화된 pw:" + encodedPw);

		if (pwdSuccess) {
			return true;
		} else {
			return false;
		}

	}

	//마이페이지 회원 수정
	public boolean mypageUserUpdate(MemberVO memberVO) {
		
		String pwdBycrypt = passwordEncoder.encode(memberVO.getUser_pw());
		memberVO.setUser_pw(pwdBycrypt);
		
		/* System.out.println("pw 암호화:" + pwdBycrypt); */
		
		boolean updateSuccess = dao.memberUpdate(memberVO);
		
		if (updateSuccess) {
			return true;
		} else {
			return false;
		}
		
	}


	
	public Map<String, Object> mypageFindReserv(Search search) {
		

		System.out.println(search.getAmount());
		System.out.println(search);
		ArrayList<ReservationVO> reservList = seatDao.findAllReserv(search);
		
		
		
		search.setType("user");
		
		search.setAmount(100);
		
		Map<String, Object> resMap = seatService.findPassList(search);
		
		
		
		
		resMap.put("reservList", reservList);
		

		ArrayList<String> reservDates= new ArrayList<String>();
		
		
		int sumTime = 0;
		for(ReservationVO reserv : reservList) {
		
			System.out.println(reserv);
			sumTime += reserv.getUseTime();
			reservDates.add(search.getForm().format(reserv.getReservationDay()));
		}
		
		resMap.put("sumTime", sumTime); //총 공부시간
		resMap.put("reservDates", reservDates); 
		
		return resMap;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

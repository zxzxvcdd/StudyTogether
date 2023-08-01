package com.spring.kgstudy.member.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.dao.MemberDAO;
import com.spring.kgstudy.member.vo.MemberVO;
import com.spring.kgstudy.order.dao.OrderDAO;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.scheduler.ReserveScheduler;
import com.spring.kgstudy.seat.dao.SeatDAO;
import com.spring.kgstudy.seat.vo.ReservationVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {

	private final MemberDAO dao;

	private final PasswordEncoder passwordEncoder;
	
	private final SeatDAO seatDao;
	private final OrderDAO orderDao;

	//메인 페이지로 이동
	public String mainPage() {
		return dao.mainPage();
	}

	
	//회원가입
	public boolean insertUser(MemberVO memberVO) {

		// BCryptPasswordEncoder 암호화 사용
		String pwdBycrypt = passwordEncoder.encode(memberVO.getUser_pw());

		//System.out.println("pw 암호화:" + pwdBycrypt);

		memberVO.setUser_pw(pwdBycrypt);

		
		System.out.println(memberVO);
		boolean loginSuccess = dao.insertUser(memberVO);
		
		if (loginSuccess) {
			return true;
		} else {
			return false;
		}
		
	}

	//중복 아이디 체크
	public int idCheck(String user_id) {
		int result = dao.idCheck(user_id);

		System.out.println(result);
		return result;
	}

	//로그인
	public boolean loginUser(MemberVO memberVO, HttpSession session) {

		String rawPw = memberVO.getUser_pw();

		memberVO = dao.findOneMember(memberVO.getUser_id()); // db에서 login한 유저의 아이디를 가져와서
		
		if(memberVO == null) {
			return false;
		}
		
		String encodedPw = memberVO.getUser_pw(); // login한 유저의 pw를 MemberVO pw안에 넣는다.

		boolean pwdSuccess = passwordEncoder.matches(rawPw, encodedPw);
											//matches(평문 pw, 암호화된 pw) 순서!!
		
		//System.out.println("평문 pw:" + rawPw);
		//System.out.println("암호화된 pw:" + encodedPw);

		
		
		
		if (pwdSuccess) {
			session.setAttribute("loginUser", memberVO); //성공하면 세션에 memberVO 넣어주기
			System.out.println(memberVO);
			
			Search search = new Search();
			search.setType("user");
			search.setAmount(9999);
			search.setKeyword(memberVO.getUser_id());
			List<ReservationVO> reservList = seatDao.findAllReserv(search);
			System.out.println(reservList);
			
			for(ReservationVO reserv : reservList) {
				
				if(reserv.getUseTime()==0) {
			
					System.out.println(reserv);
					
					search.setType("pass");
					search.setKeyword(""+reserv.getPassId());
					
					PassVO pass =orderDao.findOnePass(search);
					
					Long endLine = reserv.getReservationDay().getTime()+pass.getPassTime()*1000;
					
					Date now = new Date();
					if(now.getTime()>endLine) {
						
						ReserveScheduler.checkInList.add(endLine, reserv.getReservationId());
					}else {
					
						session.setAttribute("checkIn",endLine);
						session.setAttribute("reservId", reserv.getReservationId());
						System.out.println(endLine);
					}
					break;
				}
				
			}
			
			return true;
		} else {
			return false;
		}

	}
	
	//아이디 찾기
	public MemberVO findId(MemberVO memberVO) {
		memberVO = dao.findId(memberVO);
		
		/* System.out.println("아이디 찾기 service : " + memberVO); */
		
		return memberVO;
	}

	//비밀번호 찾기
	public MemberVO findPw(MemberVO memberVO) {
		
		memberVO = dao.findPw(memberVO);
		
		/* System.out.println("비밀번호 찾기 service : " + memberVO); */
		
		return memberVO;
	}


	public boolean updatePw(MemberVO memberVO) {
		
		String pwdBycrypt = passwordEncoder.encode(memberVO.getUser_pw());

		memberVO.setUser_pw(pwdBycrypt);
		
		/* System.out.println("pw 암호화:" + pwdBycrypt); */

		System.out.println(memberVO);
		boolean updateSuccess = dao.updatePw(memberVO);
		
		if (updateSuccess) {
			return true;
		} else {
			return false;
		}
		
	}
	
}//MemberService-end

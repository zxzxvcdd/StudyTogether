package com.spring.kgstudy.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.dao.MemberDAO;
import com.spring.kgstudy.member.dto.KakaoDTO;
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
	
	/*
	 * @Autowired private MemberRepository mr;
	 */

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
		
		boolean pwdSuccess = false;
		if(memberVO.getUser_email().length()>=1) {
			
			memberVO = ckMemberKakao(memberVO.getUser_email());
			if(memberVO!=null) {
				pwdSuccess = true;
			}
			
			
		}else {
			String rawPw = memberVO.getUser_pw();
	
			memberVO = dao.findOneMember(memberVO.getUser_id()); // db에서 login한 유저의 아이디를 가져와서
			
			if(memberVO == null) {
				return false;
			}
			
			String encodedPw = memberVO.getUser_pw(); // login한 유저의 pw를 MemberVO pw안에 넣는다.
	
			pwdSuccess = passwordEncoder.matches(rawPw, encodedPw);
												//matches(평문 pw, 암호화된 pw) 순서!!
		}
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
	
	//카카오 로그인 ===================================================================
	
	//access_Token을 요청하는 메서드 생성
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=5c6a09db0cbb787e1692171c6940bdd9"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/kgstudy/kakaoLogin.do"); // 본인이 설정한 주소
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	
	// 메서드 리턴타입 KakaoDTO로 변경 및 import.
	public KakaoDTO getUserInfo(String access_Token) {
			
			KakaoDTO userInfo = null;
		
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				int responseCode = conn.getResponseCode();
				//System.out.println("responseCode : " + responseCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				//System.out.println("response body : " + result);
				
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				
				String nickname = properties.getAsJsonObject().get("nickname").getAsString();
				String email = kakao_account.getAsJsonObject().get("email").getAsString();
				String kakaoId = kakao_account.getAsJsonObject().get("email").getAsString();
				
				userInfo = new KakaoDTO(kakaoId,nickname,email);
		
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			return userInfo;
		}


		public MemberVO ckMemberKakao(String email) {
			
			MemberVO member = dao.findOneEmail(email);
			
			return member;
		}
	
	
}//MemberService-end

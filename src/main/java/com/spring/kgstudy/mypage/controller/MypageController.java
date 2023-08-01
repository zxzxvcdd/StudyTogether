package com.spring.kgstudy.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberVO;
import com.spring.kgstudy.mypage.service.MypageService;
import com.spring.kgstudy.order.vo.PassVO;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MypageController {

	private final MypageService service;

	
	// 마이페이지 버튼을 누르면 나의 학습 정보 페이지로 이동
	@RequestMapping(value = "/userStudyChartView.do")
	public String mypageStudyChartForm(Search search, HttpSession session, Model model) throws Exception {
		
		if(!LoginUtil.isLogin(session))return "redirect:/loginPageView.do";
		
		String user_id = (LoginUtil.getCurrentMemberAccount(session));

		//String user_id="user32";
		
		search.setType("tc");
		search.setKeyword(user_id);
		search.setAmount(9999);
		model.addAttribute("resMap", service.mypageFindReserv(search));
		model.addAttribute("search",search);
		

		
		return "/mypage/userStudyChart";
	}

	// ========================================================================
	// 마이페이지에서 개인정보 확인/수정 누르면 비밀번호체크 페이지로 이동
	@RequestMapping(value = "/userModifyCkView.do")
	public String mypageModifyCkForm(MemberVO memberVO, Model model) throws Exception {
		return "/mypage/userModifyCk";
	}

	// 비밀번호 체크페이지에서 비밀번호가 일치하면 회원정보수정 페이지로 이동
	@RequestMapping(value = "/userModify.do")
	public String mypageModifyForm(MemberVO memberVO, Model model) throws Exception {
		return "/mypage/userModify";
	}

	// 마이페이지 비밀번호 체크
	@RequestMapping(value = "/modifyck.do", method = RequestMethod.POST)
	public String mypagePwCheck(MemberVO memberVO, Model model, HttpSession session) {

		boolean result = service.mypagePwCheck(memberVO);

		if (result) {
			model.addAttribute("vo", session.getAttribute("loginUser"));
			model.addAttribute("msg", "회원 정보 수정 페이지로 이동합니다.");
		} else {
			model.addAttribute("msg", "비밀번호를 다시 입력해주세요");
		}

		return result ? "/mypage/userModify" : "/mypage/userModifyCk";
	}

	
	// 마이페이지에서 회원수정
	@RequestMapping(value = "/userUpdate.do", method = RequestMethod.POST)
	public String mypageUserUpdate(MemberVO memberVO, Model model) {

		boolean result = service.mypageUserUpdate(memberVO);

		if (result) {
			model.addAttribute("msg", "수정이 완료되었습니다. 다시 로그인해주세요");
		} else {
			model.addAttribute("msg", "수정 실패");
		}

		return result ? "/member/login" : "/mypage/userModify";
	}
	
	
	// 마이페이지에서 리뷰페이지로 넘어가기
	@RequestMapping(value = "/userLivewView.do")
	public String mypageLeviwForm() throws Exception {
		
		
		return "/mypage/userReviewList";
	}
	
	
	@RequestMapping(value = "/studyData.do")
	public String studyDataForm(Search search, HttpSession session, Model model, HttpServletRequest rq) throws Exception {


		if(!LoginUtil.isLogin(session))return "redirect:/loginPageView.do";
		String user_id = (LoginUtil.getCurrentMemberAccount(session));

		//String user_id="user32";

		search.setType("tc");
		search.setKeyword(user_id);
		search.setAmount(9999);
		
		
		model.addAttribute("resMap", service.mypageFindReserv(search));
		model.addAttribute("search",search);

		return "/mypage/userStudyChart";
	}
	

	
	
}// MypageController-end

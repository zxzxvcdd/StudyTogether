package com.spring.kgstudy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.kgstudy.member.service.MemberService;
import com.spring.kgstudy.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor // final이 붙거나 @NotNull이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Controller
public class MemberController {

	private final MemberService service;

	@GetMapping("main.do")
	public String test(Model model) {

		model.addAttribute("hi", service.mainPage()); // 테스트

		return "/main/main"; // WEB-INF/views/main/main.jsp 경로
	}

	// =======================================================================

	// 헤더의 로그인 아이콘을 누르면 로그인 페이지로 이동시키기
	@RequestMapping(value = "/loginPageView.do") // 기본이 GET방식임
	public String loginForm(MemberVO memberVO) throws Exception {
		return "/member/login"; // 바로 View로 보내줌
	}

	// 회원가입 페이지로 이동시키기
	@RequestMapping(value = "/joinPageView.do")
	public String joinForm(MemberVO memberVO) throws Exception {
		return "/member/join";
	}

	// 회원가입 기능
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String sawonInsert(MemberVO memberVO, Model model) {

		boolean result = service.insertUser(memberVO);
		// service => DAO => Mapper.xml(sql) => DB => return

		if (result) {
			model.addAttribute("joinMsg", "회원가입 성공");
		} else {
			model.addAttribute("joinMsg", "회원가입 실패");
		}

		return result ? "/member/login" : "/member/join";
	}

	// 로그인 기능
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String memberLogin(MemberVO memberVO, HttpSession session, Model model) {

		boolean result = service.loginUser(memberVO, session);
		

		if (result) {
			model.addAttribute("loginMsg", "로그인 성공");
			
			
		} else {
			model.addAttribute("loginMsg", "로그인 실패");
		}

		return result ? "/main/main" : "/member/login";
		// 로그인 성공하면 메인페이지 : 실패하면 로그인 페이지를 보여주기
	}

	// 로그아웃 기능
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String memberLogout(HttpSession session, Model model) throws IOException {

		session.removeAttribute("loginUser"); // 로그아웃
		
		session.invalidate();
		
		model.addAttribute("loginMsg", "로그아웃 하였습니다.");


		return "/main/main";
	}

	// =======================================================================
	// 아이디찾기 페이지로 이동
	@RequestMapping(value = "/findAccountPageView.do")
	public String findAccountForm(MemberVO memberVO) throws Exception {
		return "/member/findAccount";
	}

	// 아이디찾기 결과창 페이지로 이동
	@RequestMapping(value = "/member/findResult")
	public String findIdResultForm(MemberVO memberVO) throws Exception {
		return "/member/findResult";
	}

	// 아이디 찾기
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(MemberVO memberVO, Model model) {

		System.out.println(memberVO);
		MemberVO resultVO = service.findId(memberVO);

		boolean result = resultVO != null;

		if (result) {
			model.addAttribute("resultVO", resultVO);
		} else {
			model.addAttribute("findIdMsg", "이름 또는 전화번호를 잘못 입력하셨습니다. 다시 입력해주세요.");
		}

		return result ? "/member/findResult" : "/member/findAccount";
	}

	// 비밀번호찾기 페이지로 이동
	@RequestMapping(value = "/findAccountPwPageView.do")
	public String findPwAccountForm(MemberVO memberVO) throws Exception {
		return "/member/findAccountPw";
	}

	// 비밀번호 재설정 페이지로 이동
	@RequestMapping(value = "/member/findResultPw")
	public String findPwResultForm(MemberVO memberVO) throws Exception {
		return "/member/findResultPw";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public String findPw(MemberVO memberVO, Model model) {

		MemberVO resultVO = service.findPw(memberVO);

		boolean result = resultVO != null;

		if (result) {
			model.addAttribute("resultVO", resultVO);
		} else {
			model.addAttribute("findPwMsg", "이름 또는 아이디 또는 전화번호를 잘못 입력하셨습니다. 다시 입력해주세요.");
		}

		return result ? "/member/findResultPw" : "/member/findAccountPw";
	}

	// 비밀번호 재설정기능
	@RequestMapping(value = "/findUpdatePw.do", method = RequestMethod.POST)
	public String findUpdatePw(MemberVO memberVO, Model model) {

		boolean result = service.updatePw(memberVO);

		if (result) {
			model.addAttribute("updatePwMsg", "비밀번호 변경 성공.");
		} else {
			model.addAttribute("updatePwMsg", "비밀번호 변경 실패.");
		}

		return result ? "/member/login" : "/member/findResultPw";
	}

}

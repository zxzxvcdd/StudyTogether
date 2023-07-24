package com.spring.kgstudy.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String loginForm(@ModelAttribute("MemberVO") MemberVO memberVO, Model model) throws Exception {

		return "/member/login"; // 바로 View로 보내줌
	}

	// 회원가입 페이지로 이동시키기
	@RequestMapping(value = "/joinPageView.do") // 기본이 GET방식임
	public String joinForm(@ModelAttribute("memberVO") MemberVO memberVO, Model model) throws Exception {

		return "/member/join"; // 바로 View로 보내줌
	}

	// 회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String sawonInsert(@ModelAttribute("memberVO") MemberVO memberVO, Model model) {

		service.insertUser(memberVO);
		// service => DAO => Mapper.xml(sql) => DB => return
		// dao가 mapper interface 기법 사용
		// 전에는 sqlsession.getMapper() 형식으로 일일이 작성했었음(mybatis 3.0 전버전)

		return "redirect:loginPageView.do"; //회원가입 완료가 되면 로그인 페이지로 이동
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

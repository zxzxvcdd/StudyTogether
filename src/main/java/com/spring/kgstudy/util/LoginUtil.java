package com.spring.kgstudy.util;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.util.WebUtils;

import com.spring.kgstudy.member.vo.MemberVO;

public class LoginUtil {

    public static final String LOGIN_FLAG = "loginUser";
    public static final String LOGIN_FROM = "loginMethod";
    public static final String LOGIN_COOKIE = "autoLoginCookie";

    // 로그인했는지 알려주기
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_FLAG) != null;
    }

    // 로그인한 사용자 계정 가져오기
    public static String getCurrentMemberAccount(HttpSession session) {
    	MemberVO member = (MemberVO) session.getAttribute(LOGIN_FLAG);
        return member.getUser_id();
    }

    // 로그인한 사용자 권한 가져오기
    public static String getCurrentMemberAuth(HttpSession session) {
    	MemberVO member = (MemberVO) session.getAttribute(LOGIN_FLAG);
        return member.getUser_grant();
    }

    // 자동 로그인 쿠키 가져오기
	/*
	 * public static Cookie getAutoLoginCookie(HttpServletRequest request) { return
	 * WebUtils.getCookie(request, LOGIN_COOKIE); }
	 * 
	 * // 자동 로그인 쿠키가 있는지 여부 확인 public static boolean
	 * hasAutoLoginCookie(HttpServletRequest request) { return
	 * getAutoLoginCookie(request) != null; }
	 */

}
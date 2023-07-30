package com.spring.kgstudy.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.member.vo.MemberVO;
import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.service.ReviewService;
import com.spring.kgstudy.review.vo.ReviewVO;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewController {

	private final ReviewService reviewService;

	// 전체 리스트 보기
	@RequestMapping(value = "/reviewListView.do")
	public String reviewList(ReviewVO vo, Model model, Search search) throws Exception {
		
		List<ReviewVO> Rlist = reviewService.getAllReview(vo, search);
		
		model.addAttribute("Rlist", Rlist);
		
		model.addAttribute("reviewCnt",Rlist.size());
		
		double avgStar = 0;
		
		Map<String,Integer> starMap = new HashMap<String, Integer>();
		
		for(int i=1;i<6;i++) {
			starMap.put("starCnt"+i,0);
		}
		
		for(ReviewVO rv : Rlist) {
			
			int star =  (int) rv.getReview_star();
			
			starMap.put("starCnt"+star, starMap.get("starCnt"+star)+1);
			
			avgStar += star;
		}
		
		avgStar /= Rlist.size();
		
		model.addAttribute("avgStar", avgStar);
		model.addAttribute("starMap", starMap);
		
		return "review/reviewList";
	}

	// 마이페이지 => [나의 리뷰 관리] 버튼 클릭
	//  => (서버)내가 작성한 리뷰 리스트, 최근 방문 매장 찾아서 리뷰 작성 여부 확인 후 => 사용자에게 view를 보여줌
	@RequestMapping(value = "/userReviewView.do")
	public String userReviewView(ReviewVO reviewVO, Model model, HttpSession session) throws Exception {

		
		if(!LoginUtil.isLogin(session))return "redirect:/loginPageView.do";
		
		reviewVO.setUser_id(LoginUtil.getCurrentMemberAccount(session));
		

		
		Map<String, Object> ReviewMap = reviewService.userReviewView(reviewVO);

		/* String reservId = (String) ReviewMap.get("reservId"); */

		ReservationVO reservationVO = (ReservationVO) ReviewMap.get("reservationVO");
		ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) ReviewMap.get("reviewList");

		if (reservationVO != null) {
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("reservationVO", reservationVO);
		} else {
			model.addAttribute("reviewList", reviewList);
		}

		return "/mypage/userReviewList";
	}
	
	
	//리뷰 등록
	@PostMapping("/reviewInsert.do")
	public String reviewInsert(ReviewVO reviewVO,MultipartFile file, RedirectAttributes ra, HttpServletRequest rq) {
		

		boolean result = reviewService.reviewInsert(reviewVO, file);
		// service => DAO => Mapper.xml(sql) => DB => return
		
		if (result) {
			ra.addFlashAttribute("msg", "리뷰 성공"); //msg를 전송하기 위해 RedirectAttributes 사용
		} else {
			ra.addFlashAttribute("msg", "리뷰 실패");
		}
		
		return "redirect:/userReviewView.do";
	}
	
	
	
}

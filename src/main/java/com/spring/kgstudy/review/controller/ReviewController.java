package com.spring.kgstudy.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.kgstudy.member.vo.MemberVO;
import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.service.ReviewService;
import com.spring.kgstudy.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewController {

	private final ReviewService reviewService;

	// 전체 리스트 보기
	@RequestMapping(value = "/reviewListView.do")
	public String reviewList(ReviewVO vo, Model model) throws Exception {
		List<ReviewVO> Rlist = reviewService.getAllReview(vo);
		model.addAttribute("Rlist", Rlist);

		return "review/reviewList"; // /WEB-INF/vies/review/reviewList.jsp
	}

	// 마이페이지 => [나의 리뷰 관리] 버튼 클릭
	//  => (서버)내가 작성한 리뷰 리스트, 최근 방문 매장 찾아서 리뷰 작성 여부 확인 후 => 사용자에게 view를 보여줌
	@RequestMapping(value = "/userReviewView.do")
	public String userReviewView(ReviewVO reviewVO, Model model) throws Exception {

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
	public String reviewInsert(ReviewVO reviewVO, MultipartFile review_file, RedirectAttributes ra, HttpServletRequest rq) {
		
		
		rq.getParameterNames().asIterator().forEachRemaining(key -> System.out.println("key:"+key));
		
		
		System.out.println(reviewVO);
		System.out.println(review_file);
		boolean result = reviewService.reviewInsert(reviewVO, review_file);
		// service => DAO => Mapper.xml(sql) => DB => return
		
	
		
		
		if (result) {

			ra.addFlashAttribute("msg", "리뷰 성공");
			
		} else {

			ra.addFlashAttribute("msg", "리뷰 실패");
		}
		
		
		return "redirect:/userReviewView.do?user_id="+reviewVO.getUser_id(); 
	}
	
	
	
	
	
	
}

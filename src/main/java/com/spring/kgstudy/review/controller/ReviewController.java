package com.spring.kgstudy.review.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.service.ReviewService;
import com.spring.kgstudy.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor // final이 붙거나 @NotNull이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Controller
public class ReviewController {

	private final ReviewService reviewService;


	// 일단 리뷰 리스트 페이지 보여주기
	// @RequestMapping(value = "/reviewListView.do")
	// public String loginForm() throws Exception {
	//	return "/review/reviewListTemplate";
	// }
	
	//별점 테스트
		@RequestMapping(value = "/reviewList.do")
		public String star_list(ReviewVO vo, Model model) throws Exception{
			List<ReviewVO> Rlist = reviewService.getAllReview(vo);
			model.addAttribute("Rlist", Rlist);
			System.out.println(Rlist);
			return "review/star_list";  // /WEB-INF/vies/review/reviewList.jsp  
			
		}
	
	
	//전체 리스트 보기
	@RequestMapping(value = "/reviewListView.do")
	public String reviewList(ReviewVO vo, Model model) throws Exception{
		List<ReviewVO> Rlist = reviewService.getAllReview(vo);
		model.addAttribute("Rlist", Rlist);
		System.out.println(Rlist);
		return "review/reviewList";  // /WEB-INF/vies/review/reviewList.jsp  
		
	}
	
	//마이페이지 => 나의 리뷰 관리 버튼 클릭 
		// => (서버)내가 작성한 리뷰 리스트, 최근 방문 매장 찾아서 리뷰 작성 여부 확인 후 => 사용자에게 view를 보여줌
		@RequestMapping(value = "/userReviewView.do") // 기본이 GET방식임
		public String userReviewView(ReviewVO reviewVO, Model model) throws Exception {
			
			//ArrayList<ReviewVO> reviewList = service.userReviewView(reviewVO);
			//model.addAttribute("reviewList", reviewList);
			
			Map<String, Object> ReviewMap = reviewService.userReviewView(reviewVO);
			
			String reservId = (String) ReviewMap.get("reservId");
			
			ReservationVO reservationVO = (ReservationVO) ReviewMap.get("reservationVO");
			ArrayList<ReviewVO> reviewList = (ArrayList<ReviewVO>) ReviewMap.get("reviewList");
			
			if (reservationVO != null) {
				//model.addAttribute("ReviewMap", ReviewMap);
				//System.out.println(ReviewMap);
				model.addAttribute("reviewList", reviewList);
				model.addAttribute("reservationVO", reservationVO);
				
			} else {
				//model.addAttribute("ReviewMap", ReviewMap);
				model.addAttribute("reviewList", reviewList);
			}
			
			return "/mypage/userReviewList";
		}

}

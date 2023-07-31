package com.spring.kgstudy.review.controller;

import java.sql.SQLException;
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

import com.spring.kgstudy.common.vo.Criteria;
import com.spring.kgstudy.common.vo.PageMaker;
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
	public String reviewList(Model model, Criteria cri) throws Exception {
		
		System.out.println(cri);
		List<ReviewVO> Rlist = reviewService.getAllReview(cri);
		
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
		
		// 페이징 처리에 필요한 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(reviewService.totalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "review/reviewList";
	}

	// 마이페이지 => [나의 리뷰 관리] 버튼 클릭
	//  => (서버)내가 작성한 리뷰 리스트, 최근 방문 매장 찾아서 리뷰 작성 여부 확인 후 => 사용자에게 view를 보여줌
	@RequestMapping(value = "/userReviewView.do")
	public String userReviewView(Criteria cri, Model model, HttpSession session) throws Exception {

		
		if(!LoginUtil.isLogin(session))return "redirect:/loginPageView.do";
		
		

		String userId= (LoginUtil.getCurrentMemberAccount(session));
		
		cri.setType("user");
		cri.setKeyword(userId);

		
		Map<String, Object> ReviewMap = reviewService.userReviewView(cri);

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
	
	//@RequestMapping("/remove.do")
	@RequestMapping(value = "/remove.do")
	public String remove(ReviewVO reviewVO, Model model)throws ClassNotFoundException,SQLException {
		reviewService.remove(reviewVO);
		
		return "redirect:/userReviewView.do";
		
	}
	
	public int totalCount(Criteria cri) {
		
		return reviewService.totalCount(cri);
	}
	
	
	
	
	
}

package com.spring.kgstudy.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.member.dao.MemberDAO;
import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.dao.ReviewDAO;
import com.spring.kgstudy.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReviewService {
	
	
	private final ReviewDAO reviewdao;

	public List<ReviewVO> getAllReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		ArrayList<ReviewVO> Rlist = new ArrayList<ReviewVO>();
		
		Rlist = reviewdao.getAllReview(vo);
		return Rlist;
	}
	
	public Map<String, Object> userReviewView(ReviewVO reviewVO) {
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			ArrayList<ReviewVO> reviewList = reviewdao.findList(reviewVO);
			
			map.put("reviewList",reviewList);
			
			ReservationVO reservationVO = reviewdao.revIdfind(reviewVO.getUser_id());
			
			map.put("reservationVO",reservationVO);
			
			if(reservationVO != null) {
				String reservId = reviewdao.findReservId(reservationVO.getReservationId());
				
				map.put("reservId", reservId);
				
				return map;
			}
			
			return map;
			
		}
	
	public void insertReview(ReviewVO vo) {
		
		reviewdao.insertReview(vo);
		
	}
	
	
	
	
	
	
	

	
	
}//ReviewService-end

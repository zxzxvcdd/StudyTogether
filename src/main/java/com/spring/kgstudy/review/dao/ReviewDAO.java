package com.spring.kgstudy.review.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.vo.ReviewVO;

@Mapper
public interface ReviewDAO {
	
	public ArrayList<ReviewVO> getAllReview(Search search);
	
	public ArrayList<ReviewVO> findList(ReviewVO reviewVO);

	public ReservationVO revIdfind(String user_id);

	public String findReservId(int reservationId);
	
	
	
}

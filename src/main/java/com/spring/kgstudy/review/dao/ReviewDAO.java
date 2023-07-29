package com.spring.kgstudy.review.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.vo.ReviewVO;


//ReviewDAO --> src/main/resources/mapper 로 감


//mapper interface ==> 선언만 해줌
@Mapper
public interface ReviewDAO {
	
	public ArrayList<ReviewVO> getAllReview(ReviewVO vo);

	public ArrayList<ReviewVO> findList(ReviewVO reviewVO);

	public ReservationVO revIdfind(String user_id);

	public String findReservId(int reservationId);

	public void insertReview(ReviewVO vo);

}

package com.spring.kgstudy.review.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.review.vo.ReviewVO;
import com.spring.kgstudy.seat.vo.ReservationVO;


//ReviewDAO --> src/main/resources/mapper 로 감


//mapper interface ==> 선언만 해줌
@Mapper
public interface ReviewDAO {
	
	public ArrayList<ReviewVO> getAllReview(Search search);

	public ArrayList<ReviewVO> findList(ReviewVO reviewVO);

	public ReservationVO revIdfind(String user_id);

	public String findReservId(int reservationId);

	public void reviewInsert(ReviewVO vo);

}

package com.spring.kgstudy.review.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.vo.Criteria;
import com.spring.kgstudy.review.vo.CntByStarDTO;
import com.spring.kgstudy.review.vo.ReviewVO;
import com.spring.kgstudy.seat.vo.ReservationVO;
import com.spring.kgstudy.store.VO.StoreVO;


//ReviewDAO --> src/main/resources/mapper 로 감


//mapper interface ==> 선언만 해줌
@Mapper
public interface ReviewDAO {
	
	public ArrayList<ReviewVO> getAllReview(Criteria cri);

	public ArrayList<ReviewVO> findList(Criteria cri);

	public ReservationVO revIdfind(String user_id);

	public int findReservId(int reservationId);

	public void reviewInsert(ReviewVO vo);
	
	public void reviewDelete(ReviewVO reviewVO);

	public int totalCount(Criteria cri);
	
	public int totalStar(Criteria cri);
	
	public List<CntByStarDTO> cntByStar(Criteria cri);
	
	public ArrayList<StoreVO> findAllStore(Criteria cri);

}

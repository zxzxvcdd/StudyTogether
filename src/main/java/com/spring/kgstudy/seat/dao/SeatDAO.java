package com.spring.kgstudy.seat.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.seat.vo.SeatVO;

@Mapper
public interface SeatDAO {

	ArrayList<SeatVO> findSeat(int storeId);
	
	boolean insertSeat(SeatVO vo);
	
	int findSeatBySeatId(int seatId);
	
	boolean updateSeat(SeatVO vo);

	
}

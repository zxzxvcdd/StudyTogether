package com.spring.kgstudy.seat.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.seat.vo.ReservationVO;
import com.spring.kgstudy.seat.vo.SeatVO;

@Mapper
public interface SeatDAO {

	ArrayList<SeatVO> findSeat(int storeId);
	
	boolean insertSeat(SeatVO vo);
	
	SeatVO findSeatBySeatId(int seatId);
	
	boolean updateSeat(SeatVO vo);
	
	String seatCheck(int seatId);

	
	boolean insertReserv(ReservationVO vo);
	
	boolean updateResrv(ReservationVO vo);
	
	ArrayList<ReservationVO> findAllReserv(Search search);
	
	ReservationVO findOneResrv(Search search);
	
	int findResrvCnt(Search search);
	
	
	
	boolean deleteResrv(ReservationVO vo);

	boolean deleteSeat(int seatId);
	
	
	
	
}

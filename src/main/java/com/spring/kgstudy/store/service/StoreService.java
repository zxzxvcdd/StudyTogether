package com.spring.kgstudy.store.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;
import com.spring.kgstudy.store.VO.StoreVO;
import com.spring.kgstudy.store.dao.StoreDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {

	
	
	private final StoreDAO storeDao;
	private final KakaoMapService kakaoMapService;
	private final SeatService seatService;
	
	public boolean saveMap() {
		
		List<StoreVO> resultList = kakaoMapService.saveMap();
		
		int[] x = {100, 195, 290, 385, 480, 575, 670, 765, 860, 955, 100, 195, 290, 385, 480, 575, 670, 765, 860, 955, 100, 195, 290, 385, 480, 575, 670, 765, 860, 955};
		int[] y	= {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30};


		
		System.out.println(resultList.size());
		
		
		for(StoreVO store : resultList){
			
			if(!(storeDao.insertStore(store))) {
				System.out.println("Insert Map Fail - map id "+store.getStoreId());
				
			}else {
			
				ArrayList<SeatVO> seatList = new ArrayList<SeatVO>();


				for(int i=1;i<=30;i++) {
					SeatVO seat = new SeatVO();

					seat.setSeatName(""+i);
					seat.setStoreId(store.getStoreId());
					
					seat.setX(x[i-1]);
					seat.setY(y[i-1]);
					seat.setSeatType("N");
					seatList.add(seat);
					
					
				}
			
				System.out.println(store.getStoreId()+"번 매장 좌석 생성");
				seatService.insertSeat(seatList);
			}
			
			
			
			
		}
		
		
		
		
		
		return true;
		
		
		
	}

	
	public ArrayList<StoreVO> findMap(Search search){
		
		ArrayList<StoreVO> result = null;
		
		
		
		
		
		result= storeDao.findAllStore(search);
		
		
		return result;
		
		
		
	}
	
	public StoreVO findOneStore(Search search) {
		
		StoreVO store = storeDao.findOneStore(search);
		
		return store;
		
		
	}
	

	
	
}

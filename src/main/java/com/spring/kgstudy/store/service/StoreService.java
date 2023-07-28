package com.spring.kgstudy.store.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.store.VO.StoreVO;
import com.spring.kgstudy.store.dao.StoreDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {

	
	
	private final StoreDAO storeDao;
	private final KakaoMapService kakaoMapService;
	
	public boolean saveMap() {
		
		List<StoreVO> resultList = kakaoMapService.saveMap();
		
		for(StoreVO vo : resultList){
			
			if(!(storeDao.insertStore(vo))) {
				System.out.println("Insert Map Fail - map id "+vo.getStoreId());
				
			}
			
		}
		
		
		return true;
		
		
		
	}

	
	public ArrayList<StoreVO> findMap(Search search){
		
		ArrayList<StoreVO> result = null;
		
		
		
		
		
		result= storeDao.findAllStore(search);
		
		
		return result;
		
		
		
	}
	
	
}

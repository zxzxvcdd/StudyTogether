package com.spring.kgstudy.store.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.common.vo.Criteria;
import com.spring.kgstudy.review.service.ReviewService;
import com.spring.kgstudy.store.vo.StoreVO;

import lombok.RequiredArgsConstructor;


@RequestMapping("/store")
@RequiredArgsConstructor
@RestController
public class StoreAPI {

	

	private final ReviewService reviewService;

	@GetMapping("getStoreStar.do")
	public Map<String,Object> getStoreStar(StoreVO store, Criteria cri){
		
		Map<String,Object> resMap = new HashMap<String, Object>();
		
		cri.setType("review_date");
		cri.setKeyword(store.getStoreName());
		
		System.out.println(cri);
		int reviewCnt = reviewService.totalCount(cri);
		System.out.println(reviewCnt);
		double totalStar = reviewService.getTotalStar(cri);
		
		double avgStar = (Math.round(totalStar*10/reviewCnt)/10);
		
		System.out.println(avgStar);
		resMap.put("reviewCnt",reviewCnt); 
		resMap.put("avgStar",avgStar); 
		
		
		
		
		return resMap;
		
		
	}
	
	
}

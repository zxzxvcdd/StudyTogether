package com.spring.kgstudy.review.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.spring.kgstudy.common.vo.Criteria;
import com.spring.kgstudy.reservation.vo.ReservationVO;
import com.spring.kgstudy.review.dao.ReviewDAO;
import com.spring.kgstudy.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReviewService {

	private final ReviewDAO reviewdao;
	

	@Resource(name="uploadPath")  //properties에 있는 uploadPath값 가져오기
	private String uploadPath;  
	
	// 리뷰 전체 보기
	public List<ReviewVO> getAllReview(Criteria cri) {
		// TODO Auto-generated method stub
		ArrayList<ReviewVO> Rlist = new ArrayList<ReviewVO>();
		
		Rlist = reviewdao.getAllReview(cri);
		return Rlist;
	}

	// 마이페이지 나의 리뷰 보기
	public Map<String, Object> userReviewView(Criteria cri) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ReviewVO> reviewList = reviewdao.getAllReview(cri);
		
		
		map.put("reviewList",reviewList);
		
		ReservationVO reservationVO = reviewdao.revIdfind(cri.getKeyword());
		
		map.put("reservationVO",reservationVO);
		
		return map;
		
	}


	public boolean reviewInsert(ReviewVO reviewVO, MultipartFile file) {
		
		String originalName = file.getOriginalFilename();
		String fileName = originalName.substring(originalName.lastIndexOf("\\") + 1);
		
		System.out.println(fileName);
		File target = new File(uploadPath, fileName);
		System.out.println("upload path : " + uploadPath);
		
		String uuid = UUID.randomUUID().toString();
		
		String savefileName = uuid + "_" + fileName;
		
		System.out.println(savefileName);
		
		//경로설정
        Path savePath = Paths.get(uploadPath + File.separator + savefileName);
		
        
        //파일 복사
        try {
        	FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(savePath.toFile()));
			System.out.println("파일 복사 됨");
			
			reviewVO.setReview_filename(savefileName);
			reviewdao.reviewInsert(reviewVO);
			
			return true;
		} catch (IOException e) {
			System.out.println("파일 복사 실패");
			return false;
		}
        
        //--------------------------------------------------------------------
        
        
	}

	public void remove(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		reviewdao.reviewDelete(reviewVO);
	}

	public int totalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewdao.totalCount(cri);
	}
	
	
	
	
	
	
}//ReviewService-end

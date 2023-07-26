package com.spring.kgstudy.store.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.store.VO.StoreVO;

@Mapper
public interface StoreDAO {
	
	
	
	
	public boolean insertStore(StoreVO vo);
	
	public boolean updateStore(StoreVO vo);
	
	
	public boolean deleteStore(int storeId);
	
	public ArrayList<StoreVO> findAllStore(Search search);
	
	public int searchStoreCnt(Search search);
	
	public StoreVO findOneStore(Search search);
	
	
	
	
	
	
	
	

}

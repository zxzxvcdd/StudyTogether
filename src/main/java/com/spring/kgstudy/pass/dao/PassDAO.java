package com.spring.kgstudy.pass.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.pass.vo.PassVO;

@Mapper
public interface PassDAO {

	
	
	
	
	public boolean insertPass(PassVO vo);
	public boolean updatePass(PassVO vo);
	public boolean deletePass(PassVO vo);
	
	
	public ArrayList<PassVO> findAllPass(Search search);
	
	public int searchPassCnt(Search search);
	
	public PassVO findOnePass(Search search);
	
	
	
	
}

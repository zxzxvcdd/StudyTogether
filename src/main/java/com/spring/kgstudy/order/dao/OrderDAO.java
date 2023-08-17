package com.spring.kgstudy.order.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.order.dto.OrderDTO;
import com.spring.kgstudy.order.vo.OrderVO;
import com.spring.kgstudy.order.vo.PassVO;



@Mapper
public interface OrderDAO {

	

	
	public int getOrderSeq();

	public int insertOrder(OrderVO order);

	public ArrayList<OrderDTO> findOrder(Search search) ;

	public int findOrderCnt(Search search);

	public boolean deleteOrder(String impUid);
	public boolean updateOrder(OrderVO order);
	
	public OrderVO findOneOrder(Search search);

	
	
	public boolean insertPass(PassVO vo);

	public boolean updatePass(PassVO vo);

	public ArrayList<PassVO> findPass(Search search);
	
	public PassVO findOnePass(Search search);
	
	public int findPassCnt(Search search);

	public boolean deletePass(int passId);

	




}

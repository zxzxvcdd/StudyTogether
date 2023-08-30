package com.spring.kgstudy.calendar.dao;

import java.util.ArrayList;
import java.util.Calendar;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.calendar.vo.CalendarVO;

@Mapper
public interface CalendarDAO {
	
	public ArrayList<CalendarVO> getList();
	
	public boolean insertCalen(CalendarVO vo);

	public CalendarVO getOneData(int id);
	
	public boolean deleteCalen(int id);
	
	public boolean updateCalen(CalendarVO vo);
	
}

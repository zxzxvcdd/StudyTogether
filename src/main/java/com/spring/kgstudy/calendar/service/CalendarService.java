package com.spring.kgstudy.calendar.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.kgstudy.calendar.dao.CalendarDAO;
import com.spring.kgstudy.calendar.vo.CalendarVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarService {

	private final CalendarDAO dao;

	public ArrayList<CalendarVO> getList(String userID) {
		
		ArrayList<CalendarVO> list = new ArrayList<>();
		
		list = dao.getList(userID);
		System.out.println(list);
		return list;
	}

	public boolean calenInsert(CalendarVO vo) {

		boolean result = dao.insertCalen(vo);

		if (result) {
			return true;
		} else {
			return false;
		}
	}

	public CalendarVO getOneData(int id) {

		CalendarVO vo = dao.getOneData(id);

		System.out.println(vo);

		return vo;
	}

	public boolean calenDelete(int id) {

		boolean result = dao.deleteCalen(id);

		if (result) {
			return true;
		} else {
			return false;
		}

	}

	public boolean calenUpdate(CalendarVO vo) {

		boolean result = dao.updateCalen(vo);

		if (result) {
			return true;
		} else {
			return false;
		}
	}

	
}

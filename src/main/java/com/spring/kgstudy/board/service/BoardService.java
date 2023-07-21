package com.spring.kgstudy.board.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.spring.kgstudy.board.dao.BoardDAO;
import com.spring.kgstudy.board.vo.BoardVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {
	
	private final BoardDAO dao;
	
	
	public ArrayList<BoardVO> test(){
		return null;
	}
}

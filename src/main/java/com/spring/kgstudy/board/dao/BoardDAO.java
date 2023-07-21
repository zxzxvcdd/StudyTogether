package com.spring.kgstudy.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.board.vo.BoardVO;



@Mapper
public interface BoardDAO {
	
	ArrayList<BoardVO> getAll(); //게시판 전체 검색
	
	void insert(BoardVO boardVO); //게시판 삽입
	
	BoardVO getOneBoard(BoardVO boardVO); //게시판 1개 가져오기
	
	void update(BoardVO boardVO); //게시판 수정
	
	void delete(BoardVO boardVO); //게시판 삭제
			
}

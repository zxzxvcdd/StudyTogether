package com.spring.kgstudy.board.service;

import java.util.List;

import com.spring.kgstudy.board.vo.BoardVO;

public interface BoardService {

	List<BoardVO> getList() throws Exception;
	public void register(BoardVO vo);
	public BoardVO get(int boardId);
	public void modify(BoardVO vo);
	public void remove(int boardId);
	public void replyProcess(BoardVO vo);
}

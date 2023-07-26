package com.spring.kgstudy.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getList();
	public void insert(BoardVO vo);
	public void insertSelectKey(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int boardId);
	public BoardVO read(int boardId);
	public void replySeqUpdate(BoardVO parent);
	public void replyInsert(BoardVO vo);
	
}

package com.spring.kgstudy.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.kgstudy.board.vo.BoardVO;
import com.spring.kgstudy.common.vo.Criteria;
import com.spring.kgstudy.member.vo.MemberVO;

@Mapper
public interface BoardMapper {	
	public List<BoardVO> getList(Criteria cri);
	public void insert(BoardVO vo);
	public void insertSelectKey(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int board_id);
	public BoardVO read(int board_id);
	public void replySeqUpdate(BoardVO parent);
	public void replyInsert(BoardVO vo);
	public int totalCount(Criteria cri);
	public void countUpdate(String user_id);
	
}

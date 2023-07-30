package com.spring.kgstudy.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.kgstudy.board.vo.BoardVO;
import com.spring.kgstudy.common.vo.Criteria;

@Service("Board")
public interface BoardService {

	List<BoardVO> getList(Criteria cri) throws Exception;
	public void register(BoardVO vo);
	public BoardVO get(int board_id);
	public void modify(BoardVO vo);
	public void remove(int board_id);
	public void replyProcess(BoardVO vo);
	public int totalCount(Criteria cri);
	public void countUpdate(BoardVO vo, HttpServletRequest rq, HttpServletResponse rs);
	
}

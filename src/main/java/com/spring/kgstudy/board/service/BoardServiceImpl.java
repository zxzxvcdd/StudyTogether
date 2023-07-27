package com.spring.kgstudy.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.kgstudy.board.mapper.BoardMapper;
import com.spring.kgstudy.board.vo.BoardVO;
import com.spring.kgstudy.common.vo.Criteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		List<BoardVO> list = boardMapper.getList(cri);
		
		System.out.println(list);
		return list;
	}

	@Override
	public void register(BoardVO vo) {
		// TODO Auto-generated method stub
		boardMapper.insert(vo);
	}

	@Override
	public BoardVO get(int board_id) {
		// TODO Auto-generated method stub
		BoardVO vo = boardMapper.read(board_id);
		return vo;
	}

	@Override
	public void modify(BoardVO vo) {
		// TODO Auto-generated method stub
		boardMapper.update(vo);
		
	}

	@Override
	public void remove(int board_id) {
		// TODO Auto-generated method stub
		boardMapper.delete(board_id);
		
	}

	@Override
	public void replyProcess(BoardVO vo) {
		// TODO Auto-generated method stub
		// - 답글 만들기
		// 1. 부모글의(원글)의 정보를 가져오기(vo -> board_id)
		BoardVO parent = boardMapper.read(vo.getBoard_id());
		// 2. 부모글의 boardGroup의 값을 -> 답글(vo)정보에 정보하기
		vo.setBoardGroup(parent.getBoard_id());
		// 3. 부모글의 boardSequence의 값을 1을 더해서 -> 답글(vo)정보에 저장하기
		vo.setBoardSequence(parent.getBoardSequence()+1);
		// 4. 부모글의 boardLevel의 값을 1을 더해서 -> 답글(vo)정보에 저장하기
		vo.setBoardLevel(parent.getBoardLevel()+1);
		// 5. 같은 boardGroup에 있는 글 중에서 
		//	  부모글의 boardSequence 보다 큰 값들을 모두 1씩 업데이트하기
		boardMapper.replySeqUpdate(parent);
		// 6. 답글(vo)을 저장하기
		boardMapper.replyInsert(vo);
	}


	@Override
	public int totalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.totalCount(cri);
	}
	
	
	
	

}

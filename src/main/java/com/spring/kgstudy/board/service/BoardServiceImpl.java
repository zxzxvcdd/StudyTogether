package com.spring.kgstudy.board.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		//boardMapper.countUpdate(board_id);
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
		// 2. 부모글의 boardGroup의 값을 -> 답글(vo)정보에 ㅓ저장하기
		vo.setBoardGroup(parent.getBoardGroup());
		// 3. 부모글의 boardSequence의 값을 1을 더해서 -> 답글(vo)정보에 저장하기
		vo.setBoardSequence(parent.getBoardSequence()+1);
		// 4. 부모글의 boardLevel의 값을 1을 더해서 -> 답글(vo)정보에 저장하기
		vo.setBoardLevel(parent.getBoardLevel()+1);
		// 5. 같은 boardGroup에 있는 글 중에서 부모글의 boardSequence 보다 큰 값들을 모두 1씩 업데이트하기
		boardMapper.replySeqUpdate(parent);
		// 6. 답글(vo)을 저장하기
		boardMapper.replyInsert(vo);
	}


	@Override
	public int totalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.totalCount(cri);
	}

	@Override
	public void countUpdate(BoardVO vo, HttpServletRequest rq, HttpServletResponse rs) {
		
		String userID = vo.getUser_id();
		
		Cookie[] cookies = rq.getCookies();
		
		boolean flag = true;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals(userID+"1")) { // 쿠키이름이 게시글 조회 아이디와 동일한지 검사
					flag = false; // 중복의 의미
					break;
				}
			}
		}
		
		if(flag) { // 중복이 없다면 true
			// DAO연결 조회수증가
			boardMapper.countUpdate(userID);
			
			// 1. 마지막에 조회된 글 번호를 쿠키로 생성해서, 클라이언트 측으로 전송
			Cookie cookie = new Cookie(userID+"1", userID); // 쿠키형식( 1:1 , 2:2 ).....
			cookie.setMaxAge(60); // 1분 수명설정
			rs.addCookie(cookie);
			
		}
		
		
	}


}

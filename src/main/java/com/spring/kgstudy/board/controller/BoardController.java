package com.spring.kgstudy.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.kgstudy.board.service.BoardService;
import com.spring.kgstudy.board.vo.BoardVO;

@Controller //POJO
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list.do")
	public String getlist(Model model) throws Exception {
		List<BoardVO> list = boardService.getList();
		model.addAttribute("list", list); //Model
		return "/board/boardList"; //view	
	}
	
	@GetMapping("/register.do")
	public String register() {
		return "board/register";
	}
	
	@RequestMapping("/register.do")	   //리다이렉트 후에도 데이터를 유지하면서 다른 페이지로 전달
	public String register(BoardVO vo, RedirectAttributes rttr) {
		boardService.register(vo); // 게시물 등록(vo -> boardId , boardGroup)
		rttr.addFlashAttribute("result", vo.getBoardId()); //${result}
			 //객체바인딩 addFlashAttribute 1회성 세션임. jsp 에서 ${result} 사용가능 
		return "redirect:/board/list.do";
	}
	
	@GetMapping("/get.do")
	public String get(@RequestParam("boardId") int boardId, Model model) {
		BoardVO vo = boardService.get(boardId);
		model.addAttribute("vo", vo);
		return "board/get"; // /WEB-INF/views/board/get.jsp
	}
	
	@GetMapping("/modify.do")
	public String modify(@RequestParam("boardId") int boardId, Model model) {
		BoardVO vo = boardService.get(boardId);
		model.addAttribute("vo", vo);
		return "board/modify"; // /WEB-INF/views/board/modify.jsp
	}
	
	@PostMapping("/modify.do")
	public String modify(BoardVO vo) {
		boardService.modify(vo); //수정
		return "redirect:/board/list.do";
	}
	
	@GetMapping("/remove.do")
	public String remove(int boardId) {
		boardService.remove(boardId);
		return "redirect:/board/list.do";	
	}
	
	@GetMapping("/reply.do")
	public String reply(int boardId, Model model){
		BoardVO vo = boardService.get(boardId);
		model.addAttribute("vo", vo);
		return "board/reply"; // /WEB-INF/views/board/reply.jsp	
	}
	
	@PostMapping("/reply.do")
	public String reply(BoardVO vo) {
		// 답글에 필요한 처리....
		boardService.replyProcess(vo);
		return "redirect:/board/list.do";
	}
	

}

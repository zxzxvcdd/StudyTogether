package com.spring.kgstudy.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.kgstudy.board.service.BoardService;
import com.spring.kgstudy.board.vo.BoardVO;
import com.spring.kgstudy.common.vo.Criteria;
import com.spring.kgstudy.common.vo.PageMaker;

@Controller //POJO
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list.do")
	public String getlist(Criteria cri, Model model) throws Exception {
		List<BoardVO> list = boardService.getList(cri);
		model.addAttribute("list", list); //Model
		// 페이징 처리에 필요한 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.totalCount());
		model.addAttribute("pageMaker", pageMaker);
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
			 //객체바인딩 addFlashAttribute 1회성 세션임. jsp 에서 ${result}로 사용가능 
		return "redirect:/board/list.do";
	}
	
	@GetMapping("/get.do")
	public String get(@RequestParam("boardId") int boardId, Model model, @ModelAttribute("cri") Criteria cri) {
		BoardVO vo = boardService.get(boardId);
		model.addAttribute("vo", vo);
		return "board/get"; // /WEB-INF/views/board/get.jsp -> @ModelAttribute 객체 바인딩 해서 jsp 에서 사용할수 있음 ${cri.page}
	}
	
	@GetMapping("/modify.do")
	public String modify(@RequestParam("boardId") int boardId, Model model, @ModelAttribute("cri") Criteria cri) {
		BoardVO vo = boardService.get(boardId);
		model.addAttribute("vo", vo);
		return "board/modify"; // /WEB-INF/views/board/modify.jsp
	}
	
	@PostMapping("/modify.do")
	public String modify(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		boardService.modify(vo); //수정
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board/list.do";	// ?page=2&perPageNum=10
	}
	
	@GetMapping("/remove.do")
	public String remove(int boardId, Criteria cri, RedirectAttributes rttr) {
		boardService.remove(boardId);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board/list.do";	// ?page=2&perPageNum=10	
	}
	
	@GetMapping("/reply.do")
	public String reply(int boardId, Model model, @ModelAttribute("cri") Criteria cri){
		BoardVO vo = boardService.get(boardId);
		model.addAttribute("vo", vo);
		return "board/reply"; // /WEB-INF/views/board/reply.jsp	
	}
	
	@PostMapping("/reply.do")
	public String reply(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		// 답글에 필요한 처리....
		boardService.replyProcess(vo); // 답글 저장됨
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/board/list.do";
	}
	

}

package com.spring.kgstudy.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.kgstudy.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService service;
	
	  
	@GetMapping("board.do")
	public String test(Model model) {
		
		model.addAttribute("board",service.test());
		
		
		return "boardAll";
		
	}
	
	

}

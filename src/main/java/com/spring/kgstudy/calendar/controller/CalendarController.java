package com.spring.kgstudy.calendar.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.kgstudy.calendar.service.CalendarService;
import com.spring.kgstudy.calendar.vo.CalendarVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("/calendar")
@Controller
@RequiredArgsConstructor
public class CalendarController {

	private final CalendarService service;
	
	@GetMapping("/calendar.do")
	public String list() {
		return "/calender/calenderView";
	}
	
	@ResponseBody
	@GetMapping(value = "/data.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<CalendarVO> getList(Model model, @RequestParam("userID") String userID) throws Exception{
		
		List<CalendarVO> list = service.getList(userID);
		model.addAttribute("list", list);
		
        return list;
	}
	
	
	@RequestMapping(value = "/calenInsert.do", method = RequestMethod.POST)
	public String calenInsert(CalendarVO vo, Model model) {
		boolean result = service.calenInsert(vo);

		
		return "redirect:/calendar/calendar.do";
	}
	
	
	@ResponseBody
	@GetMapping(value = "/oneData.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public CalendarVO getOneData(CalendarVO vo, Model model, @RequestParam("id") int id) throws Exception{
		
		CalendarVO oneData = service.getOneData(id);
		model.addAttribute("oneData", oneData);
		
        return oneData;
	}
	
	
	@RequestMapping(value = "/calenDelete.do", method = RequestMethod.GET)
	public String calenDelete(@RequestParam("id") int id, Model model) {
		
		System.out.println(id);
		
		boolean result = service.calenDelete(id);
		
		if (result) {
			model.addAttribute("msg", "삭제 성공");
		} else {
			model.addAttribute("msg", "삭제 실패");
		}
		
		return "redirect:/calendar/calendar.do";
	}
	
	@RequestMapping(value = "/calenUpdate.do", method = RequestMethod.POST)
	public String calenUpdate(CalendarVO vo, Model model) {
		
		System.out.println(vo);
		
		boolean result = service.calenUpdate(vo);

		return "redirect:/calendar/calendar.do";
	}
	
	
	
	
}

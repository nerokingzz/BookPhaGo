package org.team.bpg.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.vo.BookVO;

@Controller
public class IndexController {

	@Autowired
	private ChatService chatService;
	
	
	@RequestMapping("getRatestBook.do")
	@ResponseBody
	public BookVO letsGetRatestBook() {
		BookVO vo = chatService.getRatestBook();
		return vo;
	}
	
	
	
	@RequestMapping("getTodayBook.do")
	@ResponseBody
	public BookVO letsGetTodayBook() {
		BookVO vo = chatService.getTodayBook();
		
		return vo;
	}
	

	
}

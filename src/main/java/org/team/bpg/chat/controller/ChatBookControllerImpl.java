package org.team.bpg.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.book.service.LibraryService;

@Controller
public class ChatBookControllerImpl {
	
	@Autowired
	private LibraryService libraryService;
	
	
	@RequestMapping(value="/chat_usersearchbook.do", method=RequestMethod.GET)
	public ModelAndView chat_userSearchBook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("i am in usersearchBook");
		//챗봇을 통한 도서 검색으로는 '도서명'만 지원하도록 일단 구현.
		String search_option = "bookName";
		String search_value = request.getParameter("search_value");
		
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);
		
		ModelAndView mav=new ModelAndView();
		
		List<Map<String, Object>> list =libraryService.usersearchbook(book_list);
		
		System.out.println("getting mav's info..." + mav.getModel());
		
		mav.addObject("usserlist", list);
		
		mav.setViewName("book/userlibrarylist");
		
		return mav;
	}
	

}

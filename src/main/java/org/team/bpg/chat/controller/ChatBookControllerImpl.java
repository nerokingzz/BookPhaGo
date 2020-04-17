package org.team.bpg.chat.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.book.service.LibraryService;

@RestController
public class ChatBookControllerImpl {
	
	@Autowired
	private LibraryService libraryService;
	
	@ResponseBody
	@RequestMapping("chatSearchBook.do")
	public List<Map<String, Object>> chatSearchBook (@RequestParam("searchKeyword") String searchKeyword){


		Map<String, String> _searchKeyword = new HashMap<>();
		//챗봇을 통한 도서 검색은 도서명을 기준으로 한 검색
		_searchKeyword.put("search_option", "bookName");
		_searchKeyword.put("search_value", searchKeyword);
		List<Map<String, Object>> booklist;
		
		
		booklist = libraryService.usersearchbook(_searchKeyword);
		

		return booklist;
	}

}

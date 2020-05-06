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
	
	
	@RequestMapping("chatBookRent.do")
	public int chatRentBook(@RequestParam("userid") String userid, @RequestParam("bookNumber") String bookNumber) {
		
		System.out.println("chatRent 안이지롱 ㅋ");
		
		int totalResult;
		
		String bookState = "대출중";
		String bookState1 = "대출불가";
		String bookState2 = "예약가능";
		System.out.println("1111111");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("userid", userid);
		book_list.put("bookNumber", bookNumber);
		book_list.put("bookState", bookState);
		book_list.put("bookState1", bookState1);
		book_list.put("bookState2", bookState2);
		
		
		int result1 = 0;
		int result2 = 0;		
		int result3 = 0;		
		if(userid != null && bookNumber != null) {
			result1 = libraryService.userborrow(userid);
			result2 = libraryService.insertbookrent(book_list);
			result3 = libraryService.updatebooklib(book_list);
			
			System.out.println(result1);
			System.out.println(result2);
			System.out.println(result3);
			System.out.println("도서대출완료");
		}
		
		if(result1 == 1 && result2 == 1 && result3 ==1) {
			totalResult = 1;
		}else {
			totalResult = 0;
		}
		
		return totalResult;
	}
	
	
	
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

	
	
	
	@RequestMapping("chatSearchRentBook.do")
	public @ResponseBody Map<String, Object> chatSearchRentBook (@RequestParam("searchKeyword") String searchKeyword){
	
		String bookNumber = searchKeyword;

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			List<Map<String, Object>> booklist = libraryService.searchbnumber(bookNumber);
			if (booklist != null) {
				System.out.println(booklist);
				book_list.put("booklist", booklist);
			}
		} catch (Exception e) {
			System.out.println("catch문 안입니다요 ㅠㅠㅠ");
			e.printStackTrace();
		}
			
	
		return book_list;
	}
	
	
	
}
